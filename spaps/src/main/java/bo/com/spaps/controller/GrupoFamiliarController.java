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

import bo.com.spaps.dao.GrupoFamiliarDao;
import bo.com.spaps.dao.SessionMain;
import bo.com.spaps.model.GrupoFamiliar;
import bo.com.spaps.model.Sucursal;
import bo.com.spaps.util.FacesUtil;

@Named("grupoFamiliarController")
@ConversationScoped
/**
 * @author ANITA
 *
 */
public class GrupoFamiliarController implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 74072553476463104L;

	/******* DAO **********/
	private @Inject GrupoFamiliarDao grupoFamiliarDao;
	private @Inject SessionMain sessionMain;

	/******* OBJECT **********/
	private GrupoFamiliar grupoFamiliar;
	private GrupoFamiliar grupoFamiliarSelected;
	private Sucursal sucursal;

	/******* LIST **********/
	private List<GrupoFamiliar> listaGrupoFamiliar;

	/******* ESTADOS **********/
	private boolean modificar = false;
	private boolean registrar = false;
	private boolean crear = true;

	@Inject
	Conversation conversation;

	/**
	 * 
	 */
	public GrupoFamiliarController() {
	}

	public GrupoFamiliar getGrupoFamiliar() {
		return grupoFamiliar;
	}

	public GrupoFamiliar getGrupoFamiliarSelected() {
		return grupoFamiliarSelected;
	}

	public Sucursal getSucursal() {
		return sucursal;
	}

	public List<GrupoFamiliar> getListaGrupoFamiliar() {
		return listaGrupoFamiliar;
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

	public void setGrupoFamiliar(GrupoFamiliar grupoFamiliar) {
		this.grupoFamiliar = grupoFamiliar;
	}

	public void setGrupoFamiliarSelected(GrupoFamiliar grupoFamiliarSelected) {
		this.grupoFamiliarSelected = grupoFamiliarSelected;
	}

	public void setSucursal(Sucursal sucursal) {
		this.sucursal = sucursal;
	}

	public void setListaGrupoFamiliar(List<GrupoFamiliar> listaGrupoFamiliar) {
		this.listaGrupoFamiliar = listaGrupoFamiliar;
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
		grupoFamiliar = new GrupoFamiliar();
		grupoFamiliarSelected = new GrupoFamiliar();
		sucursal = sessionMain.getSucursalLogin();
		setCrear(true);
		setModificar(false);
		setRegistrar(false);
	}

	public void registrar() {
		try {
			if (grupoFamiliar.getCodigo().trim().isEmpty()
					|| grupoFamiliar.getSexo().trim().isEmpty()
					|| grupoFamiliar.getEstado().trim().isEmpty()
					|| getSucursal() == null
					|| getSucursal().getCompania() == null) {
				FacesUtil.infoMessage("VALIDACION",
						"No puede haber campos vacíos");
				return;
			} else {
				grupoFamiliar.setCompania(getSucursal().getCompania());
				grupoFamiliar.setSucursal(getSucursal());
				grupoFamiliar.setFechaRegistro(new Date());
				grupoFamiliar.setFechaModificacion(grupoFamiliar
						.getFechaRegistro());
				grupoFamiliar.setUsuarioRegistro(sessionMain.getUsuarioLogin()
						.getId());
				GrupoFamiliar r = grupoFamiliarDao.registrar(grupoFamiliar);
				if (r != null) {
					FacesUtil.infoMessage("GrupoFamiliar registrado",
							r.toString());
					initNew();
				} else {
					FacesUtil.errorMessage("Error al registrar");
					initNew();
				}
			}
		} catch (Exception e) {
			System.out.println("Error en registro de grupoFamiliar: "
					+ e.getMessage());
		}

	}

	public void actualizar() {
		try {
			if (grupoFamiliar.getCodigo().trim().isEmpty()
					|| grupoFamiliar.getSexo().trim().isEmpty()
					|| grupoFamiliar.getEstado().trim().isEmpty()
					|| getSucursal() == null
					|| getSucursal().getCompania() == null) {
				FacesUtil.infoMessage("VALIDACION",
						"No puede haber campos vacíos");
				return;
			} else {
				grupoFamiliar.setCompania(getSucursal().getCompania());
				grupoFamiliar.setSucursal(getSucursal());
				grupoFamiliar.setFechaModificacion(new Date());
				grupoFamiliar.setUsuarioRegistro(sessionMain.getUsuarioLogin()
						.getId());
				GrupoFamiliar r = grupoFamiliarDao.modificar(grupoFamiliar);
				if (r != null) {
					FacesUtil.infoMessage("GrupoFamiliar actualizado",
							r.toString());
					initNew();
				} else {
					FacesUtil.errorMessage("Error al actualizar");
					initNew();
				}
			}
		} catch (Exception e) {
			System.out.println("Error en modificacion de grupoFamiliar: "
					+ e.getMessage());
		}

	}

	public void eliminar() {
		try {
			if (grupoFamiliarDao.eliminar(grupoFamiliar)) {
				FacesUtil.infoMessage("GrupoFamiliar Eliminado",
						grupoFamiliar.toString());
				initNew();
			} else {
				FacesUtil.errorMessage("Error al eliminar");
				initNew();
			}
		} catch (Exception e) {
			System.out.println("Error en eliminacion de grupoFamiliar: "
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
