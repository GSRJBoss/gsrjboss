/**
 * 
 */
package bo.com.spaps.controller;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.Conversation;
import javax.enterprise.context.ConversationScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.inject.Named;

import bo.com.spaps.dao.GrupoSanguineoDao;
import bo.com.spaps.dao.SessionMain;
import bo.com.spaps.model.GrupoSanguineo;
import bo.com.spaps.model.Sucursal;
import bo.com.spaps.util.FacesUtil;

@Named("grupoSanguineoController")
@ConversationScoped
/**
 * @author ANITA
 *
 */
public class GrupoSanguineoController implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2245907090770606622L;

	/******* DAO **********/
	private @Inject GrupoSanguineoDao grupoSanguineoDao;
	private @Inject SessionMain sessionMain;

	/******* OBJECT **********/
	private GrupoSanguineo grupoSanguineo;
	private GrupoSanguineo grupoSanguineoSelected;
	private Sucursal sucursal;

	/******* LIST **********/
	private List<GrupoSanguineo> listaGrupoSanguineo;

	/******* ESTADOS **********/
	private boolean modificar = false;
	private boolean registrar = false;
	private boolean crear = true;

	@Inject
	Conversation conversation;

	/**
	 * 
	 */
	public GrupoSanguineoController() {
	}

	public GrupoSanguineo getGrupoSanguineo() {
		return grupoSanguineo;
	}

	public GrupoSanguineo getGrupoSanguineoSelected() {
		return grupoSanguineoSelected;
	}

	public Sucursal getSucursal() {
		return sucursal;
	}

	public List<GrupoSanguineo> getListaGrupoSanguineo() {
		return listaGrupoSanguineo;
	}

	public boolean isModificar() {
		return modificar;
	}

	public boolean isRegistrar() {
		return registrar;
	}

	public boolean isCrear() {
		return crear;
	}

	public void setGrupoSanguineo(GrupoSanguineo grupoSanguineo) {
		this.grupoSanguineo = grupoSanguineo;
	}

	public void setGrupoSanguineoSelected(GrupoSanguineo grupoSanguineoSelected) {
		this.grupoSanguineoSelected = grupoSanguineoSelected;
	}

	public void setSucursal(Sucursal sucursal) {
		this.sucursal = sucursal;
	}

	public void setListaGrupoSanguineo(List<GrupoSanguineo> listaGrupoSanguineo) {
		this.listaGrupoSanguineo = listaGrupoSanguineo;
	}

	public void setModificar(boolean modificar) {
		this.modificar = modificar;
	}

	public void setRegistrar(boolean registrar) {
		this.registrar = registrar;
	}

	public void setCrear(boolean crear) {
		this.crear = crear;
	}

	@PostConstruct
	public void initNew() {
		grupoSanguineo = new GrupoSanguineo();
		grupoSanguineoSelected = new GrupoSanguineo();
		sucursal = sessionMain.getSucursalLogin();
		setCrear(true);
		setModificar(false);
		setRegistrar(false);
	}

	public void registrar() {
		try {
			if (grupoSanguineo.getDescripcion().trim().isEmpty()
					|| grupoSanguineo.getEstado().trim().isEmpty()
					|| getSucursal() == null
					|| getSucursal().getCompania() == null) {
				FacesUtil.infoMessage("VALIDACION",
						"No puede haber campos vacíos");
				return;
			} else {
				grupoSanguineo.setCompania(getSucursal().getCompania());
				grupoSanguineo.setSucursal(getSucursal());
				grupoSanguineo.setFechaRegistro(new Date());
				grupoSanguineo.setFechaModificacion(grupoSanguineo
						.getFechaRegistro());
				grupoSanguineo.setUsuarioRegistro(sessionMain.getUsuarioLogin()
						.getId());
				GrupoSanguineo r = grupoSanguineoDao.registrar(grupoSanguineo);
				if (r != null) {
					FacesUtil.infoMessage("GrupoSanguineo registrado",
							r.toString());
					initNew();
				} else {
					FacesUtil.errorMessage("Error al registrar");
					initNew();
				}
			}
		} catch (Exception e) {
			System.out.println("Error en registro de grupoSanguineo: "
					+ e.getMessage());
		}

	}

	public void actualizar() {
		try {
			if (grupoSanguineo.getDescripcion().trim().isEmpty()
					|| grupoSanguineo.getEstado().trim().isEmpty()
					|| getSucursal() == null
					|| getSucursal().getCompania() == null) {
				FacesUtil.infoMessage("VALIDACION",
						"No puede haber campos vacíos");
				return;
			} else {
				grupoSanguineo.setCompania(getSucursal().getCompania());
				grupoSanguineo.setSucursal(getSucursal());
				grupoSanguineo.setFechaModificacion(new Date());
				grupoSanguineo.setUsuarioRegistro(sessionMain.getUsuarioLogin()
						.getId());
				GrupoSanguineo r = grupoSanguineoDao.modificar(grupoSanguineo);
				if (r != null) {
					FacesUtil.infoMessage("GrupoSanguineo actualizado",
							r.toString());
					initNew();
				} else {
					FacesUtil.errorMessage("Error al actualizar");
					initNew();
				}
			}
		} catch (Exception e) {
			System.out.println("Error en modificacion de grupoSanguineo: "
					+ e.getMessage());
		}

	}

	public void eliminar() {
		try {
			if (grupoSanguineoDao.eliminar(grupoSanguineo)) {
				FacesUtil.infoMessage("GrupoSanguineo Eliminado",
						grupoSanguineo.toString());
				initNew();
			} else {
				FacesUtil.errorMessage("Error al eliminar");
				initNew();
			}
		} catch (Exception e) {
			System.out.println("Error en eliminacion de grupoSanguineo: "
					+ e.getMessage());
		}
	}

	public void initConversation() {
		if (!FacesContext.getCurrentInstance().isPostback()
				&& conversation.isTransient()) {
			conversation.begin();
			System.out.println(">>>>>>>>>> CONVERSACION INICIADA...");
		}
	}

	public String endConversation() {
		if (!conversation.isTransient()) {
			conversation.end();
			System.out.println(">>>>>>>>>> CONVERSACION TERMINADA...");
		}
		return "kardex_producto.xhtml?faces-redirect=true";
	}

}
