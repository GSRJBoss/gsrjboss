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

import org.primefaces.component.datatable.DataTable;
import org.primefaces.event.SelectEvent;

import bo.com.spaps.dao.GrupoSanguineoDao;
import bo.com.spaps.dao.SessionMain;
import bo.com.spaps.model.GrupoSanguineo;
import bo.com.spaps.model.Sucursal;
import bo.com.spaps.model.Usuario;
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
	private Sucursal sucursalLogin;
	private Usuario usuarioLogin;

	/******* LIST **********/
	private List<GrupoSanguineo> listaGrupoSanguineo;
	private String[] listaEstado = { "ACTIVO", "INACTIVO", "ELIMINADO" };

	/******* ESTADOS **********/
	private boolean modificar = false;
	private boolean registrar = false;
	private boolean crear = true;
	private String estado = "AC";

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
		return sucursalLogin;
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
		this.sucursalLogin = sucursal;
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

	public String[] getListaEstado() {
		return listaEstado;
	}

	public void setListaEstado(String[] listaEstado) {
		this.listaEstado = listaEstado;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Sucursal getSucursalLogin() {
		return sucursalLogin;
	}

	public void setSucursalLogin(Sucursal sucursalLogin) {
		this.sucursalLogin = sucursalLogin;
	}

	public Usuario getUsuarioLogin() {
		return usuarioLogin;
	}

	public void setUsuarioLogin(Usuario usuarioLogin) {
		this.usuarioLogin = usuarioLogin;
	}

	public void cambiarAspecto() {
		crear = false;
		registrar = true;
		modificar = false;
	}

	public void onRowSelect(SelectEvent event) {
		crear = false;
		registrar = false;
		modificar = true;
		grupoSanguineo = grupoSanguineoSelected;
		estado = grupoSanguineo.getEstado();
		resetearFitrosTabla("formTableGrupoSanguineo:dataTableGrupoSanguineo");
	}

	public void resetearFitrosTabla(String id) {
		DataTable table = (DataTable) FacesContext.getCurrentInstance()
				.getViewRoot().findComponent(id);
		table.setSelection(null);
		table.reset();
	}

	@PostConstruct
	public void initNew() {
		grupoSanguineo = new GrupoSanguineo();
		grupoSanguineoSelected = new GrupoSanguineo();
		sucursalLogin = sessionMain.getSucursalLogin();
		usuarioLogin = sessionMain.getUsuarioLogin();
		listaGrupoSanguineo = grupoSanguineoDao
				.obtenerGrupoSanguineoOrdenAscPorId();
		setCrear(true);
		setModificar(false);
		setRegistrar(false);
	}

	public void registrar() {
		try {
			if (grupoSanguineo.getDescripcion().trim().isEmpty()
					|| getSucursal() == null
					|| getSucursal().getCompania() == null) {
				FacesUtil.infoMessage("VALIDACION",
						"No puede haber campos vacíos");
				return;
			} else {
				grupoSanguineo.setCompania(getSucursal().getCompania());
				grupoSanguineo.setSucursal(getSucursal());
				grupoSanguineo.setEstado("AC");
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
					|| getEstado().trim().isEmpty() || getSucursal() == null
					|| getSucursal().getCompania() == null) {
				FacesUtil.infoMessage("VALIDACION",
						"No puede haber campos vacíos");
				return;
			} else {
				grupoSanguineo.setCompania(getSucursal().getCompania());
				grupoSanguineo.setSucursal(getSucursal());
				if (getEstado().equals("ACTIVO")) {
					grupoSanguineo.setEstado("AC");
				} else {
					if (getEstado().equals("INACTIVO")) {
						grupoSanguineo.setEstado("IN");
					} else {
						if (getEstado().equals("ELIMINADO")) {
							grupoSanguineo.setEstado("RM");
						}
					}
				}
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
