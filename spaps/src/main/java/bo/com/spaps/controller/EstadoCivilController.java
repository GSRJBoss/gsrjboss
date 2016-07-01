/**
 * 
 */
package bo.com.spaps.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.enterprise.context.Conversation;
import javax.enterprise.context.ConversationScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.inject.Named;

import org.primefaces.component.datatable.DataTable;
import org.primefaces.event.SelectEvent;

import bo.com.spaps.dao.EstadoCivilDao;
import bo.com.spaps.dao.SessionMain;
import bo.com.spaps.model.EstadoCivil;
import bo.com.spaps.model.Sucursal;
import bo.com.spaps.util.FacesUtil;

@Named("estadoCivilController")
@ConversationScoped
/**
 * @author Cinthia Zabala
 *
 */
public class EstadoCivilController implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4041494281757237757L;

	/******* DAO **********/
	private @Inject EstadoCivilDao estadoCivilDao;
	private @Inject SessionMain sessionMain;
	@Inject
	private Logger log;

	/******* OBJECT **********/
	private EstadoCivil estadoCivil;
	private EstadoCivil estadoCivilSelected;
	private Sucursal sucursalLogin;

	/******* LIST **********/
	private List<EstadoCivil> listaEstadoCivil;
	private String[] listEstado = { "ACTIVO", "INACTIVO" };

	/******* ESTADOS **********/
	private boolean modificar = false;
	private boolean registrar = false;
	private boolean crear = true;
	private String estado;

	// columnas
	private String tipoColumnRegistro = "col-md-4"; // 4
	private String tipoColumnTable = "col-md-12"; // 8

	@Inject
	Conversation conversation;

	/**
	 * 
	 */
	public EstadoCivilController() {
	}

	public EstadoCivil getEstadoCivil() {
		return estadoCivil;
	}

	public void setEstadoCivil(EstadoCivil estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public EstadoCivil getEstadoCivilSelected() {
		return estadoCivilSelected;
	}

	public void setEstadoCivilSelected(EstadoCivil estadoCivilSelected) {
		this.estadoCivilSelected = estadoCivilSelected;
	}

	public Sucursal getSucursal() {
		return sucursalLogin;
	}

	public void setSucursal(Sucursal sucursal) {
		this.sucursalLogin = sucursal;
	}

	public List<EstadoCivil> getListaEstadoCivil() {
		return listaEstadoCivil;
	}

	public void setListaEstadoCivil(List<EstadoCivil> listaEstadoCivil) {
		this.listaEstadoCivil = listaEstadoCivil;
	}

	public boolean isModificar() {
		return modificar;
	}

	public void setModificar(boolean modificar) {
		this.modificar = modificar;
	}

	public boolean isRegistrar() {
		return registrar;
	}

	public void setRegistrar(boolean registrar) {
		this.registrar = registrar;
	}

	public boolean isCrear() {
		return crear;
	}

	public void setCrear(boolean crear) {
		this.crear = crear;
	}

	public String getTipoColumnRegistro() {
		return tipoColumnRegistro;
	}

	public String getTipoColumnTable() {
		return tipoColumnTable;
	}

	public void setTipoColumnRegistro(String tipoColumnRegistro) {
		this.tipoColumnRegistro = tipoColumnRegistro;
	}

	public void setTipoColumnTable(String tipoColumnTable) {
		this.tipoColumnTable = tipoColumnTable;
	}

	public String[] getListEstado() {
		return listEstado;
	}

	public void setListEstado(String[] listEstado) {
		this.listEstado = listEstado;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	@PostConstruct
	public void initNew() {
		initConversation();
		estadoCivil = new EstadoCivil();
		estadoCivilSelected = new EstadoCivil();
		estado = "";
		// sucursalLogin = sessionMain.getSucursalLogin();
		listaEstadoCivil = new ArrayList<>();
		listaEstadoCivil = estadoCivilDao.obtenerEstadoCivilOrdenAscPorId();
		System.out.println("lista de estados civiles tiene: "
				+ listaEstadoCivil.size());
		setCrear(true);
		setModificar(false);
		setRegistrar(false);
	}

	public void Init() {
		initConversation();
		estado = "";
		estadoCivil = new EstadoCivil();
		estadoCivilSelected = new EstadoCivil();
		listaEstadoCivil = new ArrayList<>();
		listaEstadoCivil = estadoCivilDao.obtenerEstadoCivilOrdenAscPorId();
		// sucursalLogin = sessionMain.getSucursalLogin();
		setCrear(true);
		setModificar(false);
		setRegistrar(false);
	}

	public void registrar() {
		try {
			log.info("entro a registrar");
			System.out.println("entro a registrar");
			if (estadoCivil.getDescripcion().trim().isEmpty()
			/*
			 * || estadoCivil.getEstado().trim().isEmpty() || getSucursal() ==
			 * null
			 */) {
				log.info("entro a registrar if");
				System.out.println("entro a registrar if");
				FacesUtil.infoMessage("VALIDACION",
						"No puede haber campos vacíos");
				return;
			} else {
				log.info("entro a registrar else");
				System.out.println("entro a registrar else");
				// estadoCivil.setCompania(getSucursal().getCompania());
				// estadoCivil.setSucursal(getSucursal());
				System.out.println("Sucursal : "
						+ sessionMain.PruebaSucursal().getDescripcion());
				estadoCivil.setSucursal(sessionMain.PruebaSucursal());
				estadoCivil
						.setCompania(estadoCivil.getSucursal().getCompania());
				System.out.println("compania : "
						+ estadoCivil.getCompania().getDescripcion());
				estadoCivil.setFechaRegistro(new Date());
				estadoCivil
						.setFechaModificacion(estadoCivil.getFechaRegistro());
				// estadoCivil.setUsuarioRegistro(sessionMain.getUsuarioLogin().getId());
				estadoCivil.setUsuarioRegistro(sessionMain.PruebaUsuario()
						.getId());
				System.out.println("usuario : "
						+ estadoCivil.getUsuarioRegistro());
				EstadoCivil r = estadoCivilDao.registrar(estadoCivil);
				if (r != null) {
					FacesUtil.infoMessage("EstadoCivil registrado",
							r.toString());
					initNew();
				} else {
					FacesUtil.errorMessage("Error al registrar");
					initNew();
				}
			}
		} catch (Exception e) {
			System.out.println("Error en registro de estadoCivil: "
					+ e.getMessage());
		}

	}

	public void cambiarAspecto() {
		crear = false;
		registrar = true;
		modificar = false;
	}

	public void actualizar() {
		try {
			if (estadoCivil.getDescripcion().trim().isEmpty()
					|| estadoCivil.getEstado().trim().isEmpty()) {
				FacesUtil.infoMessage("VALIDACION",
						"No puede haber campos vacíos");
				return;
			} else {
				estadoCivil.setFechaModificacion(new Date());
				estadoCivil.setUsuarioRegistro(sessionMain.getUsuarioLogin()
						.getId());
				System.out.println(getEstado());
				if (getEstado().equals("ACTIVO")) {
					estadoCivil.setEstado("AC");
				} else {
					estadoCivil.setEstado("IN");
				}
				System.out.println(estadoCivil.getEstado());
				EstadoCivil r = estadoCivilDao.modificar(estadoCivil);
				if (r != null) {
					FacesUtil.infoMessage("EstadoCivil actualizado",
							r.toString());
					initNew();
				} else {
					FacesUtil.errorMessage("Error al actualizar");
					initNew();
				}
			}
		} catch (Exception e) {
			System.out.println("Error en modificacion de estadoCivil: "
					+ e.getMessage());
		}

	}

	public void eliminar() {
		try {
			if (estadoCivilDao.eliminar(estadoCivil)) {
				FacesUtil.infoMessage("EstadoCivil Eliminado",
						estadoCivil.toString());
				initNew();
			} else {
				FacesUtil.errorMessage("Error al eliminar");
				initNew();
			}
		} catch (Exception e) {
			System.out.println("Error en eliminacion de estadoCivil: "
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

	public void onRowSelect(SelectEvent event) {
		crear = false;
		registrar = false;
		modificar = true;
		estadoCivil = estadoCivilSelected;
		tipoColumnTable = "col-md-8";
		resetearFitrosTabla("formTableEstadoCivil:dataTableEstadoCivil");
	}

	public void resetearFitrosTabla(String id) {
		DataTable table = (DataTable) FacesContext.getCurrentInstance()
				.getViewRoot().findComponent(id);
		table.setSelection(null);
		table.reset();
	}

}
