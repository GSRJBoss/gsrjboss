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

import bo.com.spaps.dao.DocumentoIdentidadDao;
import bo.com.spaps.dao.SessionMain;
import bo.com.spaps.model.DocumentoIdentidad;
import bo.com.spaps.model.Sucursal;
import bo.com.spaps.model.Usuario;
import bo.com.spaps.util.FacesUtil;

@Named("documentoIdentidadController")
@ConversationScoped
/**
 * @author Cinthia Zabala
 *
 */
public class DocumentoIdentidadController implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6031966114388889680L;

	/******* DAO **********/
	private @Inject DocumentoIdentidadDao documentoIdentidadDao;
	private @Inject SessionMain sessionMain;

	/******* OBJECT **********/
	private DocumentoIdentidad documentoIdentidad;
	private DocumentoIdentidad documentoIdentidadSelected;
	private Sucursal sucursalLogin;
	private Usuario usuario;

	/******* LIST **********/
	private List<DocumentoIdentidad> listaDocumentoIdentidad;
	private String[] listaEstado = { "ACTIVO", "INACTIVO" };

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
	public DocumentoIdentidadController() {
	}

	public DocumentoIdentidad getDocumentoIdentidad() {
		return documentoIdentidad;
	}

	public void setDocumentoIdentidad(DocumentoIdentidad documentoIdentidad) {
		this.documentoIdentidad = documentoIdentidad;
	}

	public DocumentoIdentidad getDocumentoIdentidadSelected() {
		return documentoIdentidadSelected;
	}

	public void setDocumentoIdentidadSelected(
			DocumentoIdentidad documentoIdentidadSelected) {
		this.documentoIdentidadSelected = documentoIdentidadSelected;
	}

	public List<DocumentoIdentidad> getListaDocumentoIdentidad() {
		return listaDocumentoIdentidad;
	}

	public void setListaDocumentoIdentidad(
			List<DocumentoIdentidad> listaDocumentoIdentidad) {
		this.listaDocumentoIdentidad = listaDocumentoIdentidad;
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

	public Sucursal getSucursalLogin() {
		return sucursalLogin;
	}

	public void setSucursalLogin(Sucursal sucursalLogin) {
		this.sucursalLogin = sucursalLogin;
	}

	public String[] getListaEstado() {
		return listaEstado;
	}

	public String getEstado() {
		return estado;
	}

	public void setListaEstado(String[] listaEstado) {
		this.listaEstado = listaEstado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@PostConstruct
	public void initNew() {
		documentoIdentidad = new DocumentoIdentidad();
		documentoIdentidadSelected = new DocumentoIdentidad();
		listaDocumentoIdentidad = documentoIdentidadDao
				.obtenerDocumentoIdentidadOrdenAscPorId();
		// usuario = sessionMain.getUsuarioLogin();
		// sucursalLogin = sessionMain.getSucursalLogin();
		setCrear(true);
		setModificar(false);
		setRegistrar(false);
	}

	public void Init() {
		documentoIdentidad = new DocumentoIdentidad();
		documentoIdentidadSelected = new DocumentoIdentidad();
		listaDocumentoIdentidad = documentoIdentidadDao
				.obtenerDocumentoIdentidadOrdenAscPorId();
		// sucursalLogin = sessionMain.getSucursalLogin();
		setCrear(true);
		setModificar(false);
		setRegistrar(false);
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
		documentoIdentidad = documentoIdentidadSelected;
		resetearFitrosTabla("formTableDocumentoIdentidad:dataTableDocumentoIdentidad");
	}

	public void resetearFitrosTabla(String id) {
		DataTable table = (DataTable) FacesContext.getCurrentInstance()
				.getViewRoot().findComponent(id);
		table.setSelection(null);
		table.reset();
	}

	public void registrar() {
		try {
			if (documentoIdentidad.getNombre().trim().isEmpty()
					|| documentoIdentidad.getSigla().trim().isEmpty()
			/*
			 * || documentoIdentidad.getEstado().trim().isEmpty() ||
			 * getSucursalLogin() == null || getSucursalLogin().getCompania() ==
			 * null
			 */) {
				FacesUtil.infoMessage("VALIDACION",
						"No puede haber campos vacíos");
				return;
			} else {
				/*
				 * documentoIdentidad
				 * .setCompania(getSucursalLogin().getCompania());
				 * documentoIdentidad.setSucursal(getSucursalLogin());
				 * documentoIdentidad.setFechaRegistro(new Date());
				 * documentoIdentidad.setUsuarioRegistro(sessionMain
				 * .getUsuarioLogin().getId());
				 */
				documentoIdentidad.setUsuarioRegistro(sessionMain
						.PruebaUsuario().getId());
				documentoIdentidad.setSucursal(sessionMain.PruebaSucursal());
				documentoIdentidad.setCompania(documentoIdentidad.getSucursal()
						.getCompania());
				documentoIdentidad.setEstado("AC");
				documentoIdentidad.setFechaRegistro(new Date());
				documentoIdentidad.setFechaModificacion(documentoIdentidad
						.getFechaRegistro());
				DocumentoIdentidad r = documentoIdentidadDao
						.registrar(documentoIdentidad);
				if (r != null) {
					FacesUtil.infoMessage("DocumentoIdentidad registrado",
							r.toString());
					initNew();
				} else {
					FacesUtil.errorMessage("Error al registrar");
					initNew();
				}
			}
		} catch (Exception e) {
			System.out.println("Error en registro de documentoIdentidad: "
					+ e.getMessage());
		}

	}

	public void actualizar() {
		try {
			if (documentoIdentidad.getNombre().trim().isEmpty()
					|| documentoIdentidad.getSigla().trim().isEmpty()
					|| getEstado().trim().isEmpty()) {
				FacesUtil.infoMessage("VALIDACION",
						"No puede haber campos vacíos");
				return;
			} else {
				documentoIdentidad.setFechaModificacion(new Date());
				documentoIdentidad.setUsuarioRegistro(sessionMain
						.PruebaUsuario().getId());
				System.out.println(getEstado());
				documentoIdentidad.setEstado(getEstado());
				if (getEstado().equals("ACTIVO")) {
					documentoIdentidad.setEstado("AC");
				} else {
					if (getEstado().equals("INACTIVO"))
						documentoIdentidad.setEstado("IN");
				}
				DocumentoIdentidad r = documentoIdentidadDao
						.modificar(documentoIdentidad);
				if (r != null) {
					FacesUtil.infoMessage("DocumentoIdentidad actualizado",
							r.toString());
					initNew();
				} else {
					FacesUtil.errorMessage("Error al actualizar");
					initNew();
				}
			}
		} catch (Exception e) {
			System.out.println("Error en modificacion de documentoIdentidad: "
					+ e.getMessage());
		}

	}

	public void eliminar() {
		try {
			if (documentoIdentidadDao.eliminar(documentoIdentidad)) {
				FacesUtil.infoMessage("DocumentoIdentidad Eliminado",
						documentoIdentidad.toString());
				initNew();
			} else {
				FacesUtil.errorMessage("Error al eliminar");
				initNew();
			}
		} catch (Exception e) {
			System.out.println("Error en eliminacion de documentoIdentidad: "
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
