package bo.com.spaps.controller;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.Conversation;
import javax.enterprise.context.ConversationScoped;
import javax.enterprise.event.Event;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.primefaces.component.api.UIData;
import org.primefaces.component.datatable.DataTable;
import org.primefaces.event.SelectEvent;
import org.primefaces.event.UnselectEvent;
import org.primefaces.model.DefaultTreeNode;
import org.primefaces.model.TreeNode;
import org.richfaces.cdi.push.Push;

import bo.com.spaps.dao.SessionMain;
import bo.com.spaps.dao.SucursalDao;
import bo.com.spaps.model.Compania;
import bo.com.spaps.model.Sucursal;
import bo.com.spaps.model.Usuario;
import bo.com.spaps.model.UsuarioEmpresa;
import bo.com.spaps.model.UsuarioSucursal;
import bo.com.spaps.util.EDNivel;
import bo.com.spaps.util.FacesUtil;

@Named(value = "creacionController")
@ConversationScoped
public class CreacionController implements Serializable {

	private static final long serialVersionUID = 310306444101578622L;

	public static final String PUSH_CDI_TOPIC = "pushCdi";

	@Inject
	private FacesContext facesContext;

	@Inject
	Conversation conversation;

	@Inject
	@Push(topic = PUSH_CDI_TOPIC)
	Event<String> pushEventSucursal;
	
	//dao
	private @Inject SucursalDao sucursalDao;

	// ESTADOS
	private boolean modificar = false;
	private boolean registrar = false;
	private boolean crear = true;
	private boolean seleccionada1 = false;
	private boolean seleccionadaFormCompania = true;
	private boolean seleccionadaFormGestion = false;
	private boolean seleccionadaFormAgregarCompania = true;
	private boolean seleccionarForm1 = true;
	private boolean buttonCancelar = true;
	private boolean buttonAnterior;
	private boolean buttonSiguiente;

	// VAR
	private String tituloPanel = "Registrar Compania";
	private String nombreCompania = "";
	private String nombreEstado = "ACTIVO";
	private String periodo = "enero-diciembre";
	private String formTitulo = "EMPRESA";
	private String nombreMonedaNacional;
	private String simboloMonedaNacional;
	private String simboloMonedaExtranjera;
	private int nivel;
	private int tamanio = 1;
	private String codigo;
	private String periodoActual = "enero";
	private double tipoCambio = 6.91;
	private double tipoCambioUfv = 2.02;
	private String tipoPlanCuenta = "personalizado";
	private int nivelAnterior = 0;
	private String tabCompania = "active";
	private String tabGestion = "";
	private String tabPlanCuenta = "";
	private String tabParametros = "";
	private int numeroTab;

	// SESION
	private @Inject SessionMain sessionMain; // variable del login
	private Usuario usuarioLogin;
	private Compania companiaLogin;

	// OBJECT
	private Compania newCompania;
	private Compania selectedCompania;
	private boolean seleccionadaFormEmpresa=true;

	// LIST
	private String[] arrayPeriodo = { "enero-diciembre", "abril-marzo",
			"julio-junio", "octubre-septiembre" };
	private List<Usuario> listUsuario = new ArrayList<Usuario>();
	private List<Compania> listaCompania;
	private List<Compania> listaCompaniaActivas= new ArrayList<Compania>();
	private List<UsuarioSucursal> listUsuarioSucursals= new ArrayList<UsuarioSucursal>();
	private List<Compania> listFilterCompania;
	private String[] listEstado = { "ACTIVO", "INACTIVO" };
	private String[] arrayNivel = { "PRIMER NIVEL", "SEGUNDO NIVEL",
			"TERCER NIVEL", "CUARTO NIVEL", "QUINTO NIVEL", "SEXTO NIVEL",
			"SEPTIMO NIVEL", "OCTAVO NIVEL", "NOVENO NIVEL" };
	private String[] arrayPeriodoActual = { "enero", "febrero", "marzo",
			"abril", "mayo", "junio", "julio", "agosto", "septiembre",
			"octubre", "noviembre", "diciembre" };
	/*
	 * private List<PlanCuenta> listPlanCuentaDefault = new
	 * ArrayList<PlanCuenta>();
	 */
	private List<EDNivel> listNivel = new ArrayList<EDNivel>();
	/*
	 * private List<TipoCuenta> listDefinicionCuenta = new
	 * ArrayList<TipoCuenta>();
	 */
	// 1 2 3 4 5 6 7 8 9
	private Integer[] arrayTamanio = { 1, 2, 2, 3, 3, 3, 3, 3, 3 };

	// Component Primefaces
	private UIData usersDataTable;
	private TreeNode selectedNode;

	// treeNode
	private TreeNode rootPC;

	@PostConstruct
	public void initNewCompania() {

		System.out.println(" init new initNewCompania");
		beginConversation();
		companiaLogin = sessionMain.getSucursalLogin().getCompania();
		usuarioLogin = sessionMain.getUsuarioLogin();

		loadValuesDefault();
	}

	// ----------------- default ----------------
	private void loadValuesDefault() {
		numeroTab = 1;
		buttonAnterior = false;
		buttonSiguiente = true;

		tabCompania = "active";
		tabGestion = "";
		tabPlanCuenta = "";
		tabParametros = "";

		seleccionadaFormAgregarCompania = true;
		if (listaCompaniaActivas.isEmpty()) {
			formTitulo = "CREAR EMPRESA";
			seleccionadaFormCompania = false;
			seleccionadaFormGestion = false;
			buttonCancelar = false;
		} else {

		}
		rootPC = new DefaultTreeNode("Root", null);
		modificar = false;
		/*cargarPlanCuentaDefault();
		cargarTreeNiveles();*/
		/* definirListCuenta(); */
	}

	

	// ----------------- treenode ----------------

	public void cargarTreeNiveles() {
		listNivel = new ArrayList<EDNivel>();
		EDNivel edNivel1 = new EDNivel("1", arrayNivel[0], arrayTamanio[0]);
		listNivel.add(edNivel1);
		EDNivel edNivel2 = new EDNivel("2", arrayNivel[1], arrayTamanio[1]);
		listNivel.add(edNivel2);
		for (int i = 2; i < nivel; i++) {
			EDNivel edNivel3 = new EDNivel(String.valueOf(i + 1),
					arrayNivel[i], arrayTamanio[i]);
			listNivel.add(edNivel3);
		}
	}

	// ---------------- acciones para nivel --------------------

	public void aumentarOSubir() {
		loadVarTab();
		if (!swNivel) {
			return;
		}// salir
		if (nivel == 5) {
			tipoPlanCuenta = "default";
		} else {
			tipoPlanCuenta = "personalizado";
		}
		if (nivelAnterior < nivel) {
			// aumentar una codificacion al nivel aumentado
			codigo = aumentar1Nivel();
			int nivelAux = this.nivel;
			EDNivel edNivel3 = new EDNivel(String.valueOf(nivelAux),
					arrayNivel[nivelAux - 1], arrayTamanio[nivelAux - 1]);
			listNivel.add(edNivel3);
		} else {
			// quitar una codificacion al nivel disminuido
			codigo = quitar1Nivel();
			listNivel.remove(listNivel.size() - 1);
		}
	}

	public void loadVarTab() {
		tabCompania = "";
		tabGestion = "";
		tabPlanCuenta = "active";
		tabParametros = "";
	}

	public void loadVarTabItem(int item) {
		tabCompania = "";
		tabGestion = "";
		tabPlanCuenta = "";
		tabParametros = "";
		switch (item) {
		case 1:
			tabCompania = "active";
			break;
		case 2:
			tabGestion = "active";
			break;
		case 3:
			tabPlanCuenta = "active";
			break;
		case 4:
			tabParametros = "active";
			break;

		default:
			break;
		}
	}

	private String aumentar1Nivel() {
		System.out.println("aumentar1Nivel()");
		String aux = ".";
		int nivelAux = nivel;
		int tamanioAux = arrayTamanio[nivelAux - 1];
		for (int i = 0; i < tamanioAux; i++) {
			aux = aux + "9";
		}
		return codigo + aux;
	}

	private String quitar1Nivel() {
		System.out.println("quitar1Nivel()");
		String aux = codigo;
		int length = aux.length();
		System.out.println("length: " + length);
		for (int index = length; index > 0; index--) {
			String letra = String.valueOf(codigo.charAt(index - 1));
			System.out.println("letra: " + letra);
			if (letra.equals(".")) {
				return aux.substring(0, index - 1);
			}
		}
		return aux;
	}

	private void actualizarCodigo() {
		String aux = "";
		for (int i = 0; i < nivel; i++) {
			Integer t = arrayTamanio[i];
			for (int j = 0; j < t; j++) {
				aux = aux + "9";
			}
			aux = aux + ".";
		}
		codigo = aux.substring(0, aux.length() - 1);
	}

	private void cargarNivelToList(EDNivel aux) {
		for (int index = 0; index < listNivel.size(); index++) {
			EDNivel edNivel = listNivel.get(index);
			if (edNivel.equals(aux)) {
				listNivel.set(index, aux);
				arrayTamanio[index] = aux.getTamanio();
				return;
			}
		}
	}

	public void resetearFitrosTabla(String id) {
		DataTable table = (DataTable) FacesContext.getCurrentInstance()
				.getViewRoot().findComponent(id);
		table.setSelection(null);
		table.reset();
	}

	// ----------------------busqueda de objetos localmente -----------------

	// ------------------------- conversation -------------------------

	public void beginConversation() {
		if (conversation.isTransient()) {
			System.out.println("beginning conversation : " + this.conversation);
			conversation.begin();
			System.out.println("---> Init Conversation");
		}
	}

	public void endConversation() {
		if (!conversation.isTransient()) {
			conversation.end();
		}
	}

	// ------------- registros, modificaciones --------------------

	public void registrarCompania2() {
		try {
			// validacion compania
			if (newCompania.getDescripcion().trim().isEmpty()
					|| newCompania.getNit().trim().isEmpty()
					|| newCompania.getDireccion().trim().isEmpty()
					|| newCompania.getTelefono().trim().isEmpty()) {
				FacesUtil.infoMessage("VALIDACION", "Datos de la Compania");
				buttonAnterior = false;
				buttonSiguiente = true;
				numeroTab = 1;
				loadVarTabItem(1);
				return;
			}

			Date fechaActual = new Date();
			// EMPRESA
			newCompania.setDescripcion(newCompania.getDescripcion()
					.toUpperCase());
			newCompania.setEstado("AC");
			newCompania.setUsuarioRegistro(usuarioLogin.getId());
			newCompania.setFechaRegistro(fechaActual);

		} catch (Exception e) {
			FacesUtil.errorMessage("Error al registrar.");
		}
	}

	public void onRowSelectCompania(SelectEvent event) {
		System.out.println("Ingreso a onRowSelectCompania...");
		newCompania = selectedCompania;

		modificar = true;
		crear = false;
		registrar = false;
		resetearFitrosTabla("formTableCompania:dataTableCompania");
	}

	// para pagina index.xhtml
	public void onRowSelectCompania3(SelectEvent event) {
		System.out.println(" onRowSelectCompania3 ");
		newCompania = selectedCompania;
		seleccionadaFormAgregarCompania = false;
		FacesUtil.updateComponent("formCompania");
	}

	// para pagina index.xhtml
	public void onRowSelectCompania2(SelectEvent event) {
		System.out.println(" onRowSelectCompania2 ");
		newCompania = selectedCompania;
		seleccionadaFormAgregarCompania = false;
		// resetearFitrosTabla("form1:dataTableGestion");
		try {
			// HttpSession session = (HttpSession)
			// FacesContext.getCurrentInstance().getExternalContext().getSession(false);
			// session.setAttribute("compania",
			// selectedCompania.getRazonSocial());
			// session.setAttribute("gestion", selectedGestion.getGestion());
			FacesContext context = FacesContext.getCurrentInstance();
			HttpServletRequest request = (HttpServletRequest) context
					.getExternalContext().getRequest();
			String path = request.getContextPath() + "/pages/dashboard.xhtml";
			System.out.println("PATH :  " + path);
			context.getExternalContext().redirect(
					request.getContextPath() + "/pages/dashboard.xhtml");
		} catch (Exception e) {
			System.out.println(" Error : " + e.getMessage());
		}
	}

	public void onRowUnSelect(UnselectEvent event) {
		/*
		 * FacesMessage msg = new FacesMessage("Grupo Centro Costo Selected",
		 * ((GrupoCentroCosto)event.getObject()).getNombre());
		 * FacesContext.getCurrentInstance().addMessage(null, msg);
		 */
	}

	public void crearCompania() {
		crear = false;
		modificar = false;
		registrar = true;
	}

	// ------------------- action for view --------------------------
	// button form index.xhtml
	public void formButtonAtras() {
		seleccionadaFormCompania = true;
		seleccionadaFormGestion = false;
		seleccionadaFormAgregarCompania = true;
		formTitulo = "EMPRESA";
		selectedCompania = new Compania();
	}

	private int digitoAnterior = 0;

	public void onRowSelectTipoCuenta(SelectEvent event) {
		loadVarTab();
		/* digitoAnterior = selectedTipoCuenta.getDigito(); */
	}

	public void actualizarComponentes() {

	}

	public void actionButtonSiguiente() {
		int numeroAux = numeroTab + 1;
		if (numeroTab == 3 && numeroAux == 4) {
			numeroTab = 4;
			buttonAnterior = true;
			buttonSiguiente = false;
		} else {
			numeroTab++;
			buttonAnterior = true;
			buttonSiguiente = true;
		}
		loadVarTabItem(numeroTab);
	}

	public void actionButtonAnterior() {
		int numeroAux = numeroTab - 1;
		if (numeroTab == 2 && numeroAux == 1) {
			numeroTab = 1;
			buttonAnterior = false;
			buttonSiguiente = true;
		} else {
			numeroTab--;
			buttonAnterior = true;
			buttonSiguiente = true;
		}
		loadVarTabItem(numeroTab);
	}

	// ---------------- get and set ----------------------

	public List<Compania> getListaCompania() {
		return listaCompania;
	}

	public List<Compania> getlistaCompaniaActivas() {
		return listaCompaniaActivas;
	}

	public String getTituloPanel() {
		return tituloPanel;
	}

	public void setTituloPanel(String tituloPanel) {
		this.tituloPanel = tituloPanel;
	}

	public boolean isModificar() {
		return modificar;
	}

	public void setModificar(boolean modificar) {
		this.modificar = modificar;
	}

	public Compania getSelectedCompania() {
		return selectedCompania;
	}

	public void setSelectedCompania(Compania selectedCompania) {
		seleccionada1 = true;
		seleccionadaFormCompania = false;
		seleccionadaFormGestion = true;
		formTitulo = "GESTIÓN - "
				+ selectedCompania.getDescripcion().toUpperCase();
		this.selectedCompania = selectedCompania;
	}

	public List<Usuario> getListUsuario() {
		return listUsuario;
	}

	public void setListUsuario(List<Usuario> listUsuario) {
		this.listUsuario = listUsuario;
	}

	// public void setSelectedGestion(Gestion selectedGestion) {
	// this.selectedGestion = selectedGestion;
	// // cargar siguiente pagina
	// try {
	// HttpSession session = (HttpSession) FacesContext
	// .getCurrentInstance().getExternalContext()
	// .getSession(false);
	// session.setAttribute("compania", selectedCompania.getRazonSocial());
	// session.setAttribute("gestion", selectedGestion.getGestion());
	// FacesContext.getCurrentInstance().getExternalContext()
	// .redirect("/webapp/pages/dashboard.xhtml");
	// } catch (Exception e) {
	// }
	// }

	public boolean isSeleccionada1() {
		return seleccionada1;
	}

	public void setSeleccionada1(boolean seleccionada1) {
		this.seleccionada1 = seleccionada1;
	}

	public String getNombreCompania() {
		return nombreCompania;
	}

	public void setNombreCompania(String nombreCompania) {
		this.nombreCompania = nombreCompania;
	}

	public String getPeriodo() {
		return periodo;
	}

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

	public String[] getArrayPeriodo() {
		return arrayPeriodo;
	}

	public void setArrayPeriodo(String[] arrayPeriodo) {
		this.arrayPeriodo = arrayPeriodo;
	}

	public List<Compania> getListFilterCompania() {
		return listFilterCompania;
	}

	public void setListFilterCompania(List<Compania> listFilterCompania) {
		this.listFilterCompania = listFilterCompania;
	}

	public String getNombreEstado() {
		return nombreEstado;
	}

	public void setNombreEstado(String nombreEstado) {
		this.nombreEstado = nombreEstado;
	}

	public String[] getListEstado() {
		return listEstado;
	}

	public void setListEstado(String[] listEstado) {
		this.listEstado = listEstado;
	}

	public boolean isSeleccionadaFormCompania() {
		return seleccionadaFormCompania;
	}

	public void setSeleccionadaFormCompania(boolean seleccionadaFormCompania) {
		this.seleccionadaFormCompania = seleccionadaFormCompania;
	}

	public boolean isSeleccionadaFormGestion() {
		return seleccionadaFormGestion;
	}

	public void setSeleccionadaFormGestion(boolean seleccionadaFormGestion) {
		this.seleccionadaFormGestion = seleccionadaFormGestion;
	}

	public boolean isSeleccionadaFormAgregarCompania() {
		return seleccionadaFormAgregarCompania;
	}

	public void setSeleccionadaFormAgregarCompania(
			boolean seleccionadaFormAgregarCompania) {
		this.seleccionadaFormAgregarCompania = seleccionadaFormAgregarCompania;
	}

	public String getFormTitulo() {
		return formTitulo;
	}

	public void setFormTitulo(String formTitulo) {
		this.formTitulo = formTitulo;
	}

	public boolean isCrear() {
		return crear;
	}

	public void setCrear(boolean crear) {
		this.crear = crear;
	}

	public boolean isRegistrar() {
		return registrar;
	}

	public void setRegistrar(boolean registrar) {
		this.registrar = registrar;
	}

	public String getNombreMonedaNacional() {
		return nombreMonedaNacional;
	}

	public String getSimboloMonedaNacional() {
		return simboloMonedaNacional;
	}

	public void setSimboloMonedaNacional(String simboloMonedaNacional) {
		this.simboloMonedaNacional = simboloMonedaNacional;
	}

	public String getSimboloMonedaExtranjera() {
		return simboloMonedaExtranjera;
	}

	public void setSimboloMonedaExtranjera(String simboloMonedaExtranjera) {
		this.simboloMonedaExtranjera = simboloMonedaExtranjera;
	}

	public Compania getCompaniaLogin() {
		return companiaLogin;
	}

	public void setCompaniaLogin(Compania companiaLogin) {
		this.companiaLogin = companiaLogin;
	}

	public Compania getNewCompania() {
		return newCompania;
	}

	public void setNewCompania(Compania newCompania) {
		this.newCompania = newCompania;
	}

	public String[] getArrayNivel() {
		return arrayNivel;
	}

	public void setArrayNivel(String[] arrayNivel) {
		this.arrayNivel = arrayNivel;
	}

	public TreeNode getSelectedNode() {
		return selectedNode;
	}

	public void setSelectedNode(TreeNode selectedNode) {
		this.selectedNode = selectedNode;
	}

	public int getNivel() {
		return nivel;
	}

	// para verificar que no siga aumentando al nivel maximo =9 o disminuyendo
	// al nivelminimo=2
	private boolean swNivel = true;

	public void setNivel(int nivel) {
		nivelAnterior = this.nivel;
		if ((nivelAnterior == nivel && nivel == 2)
				|| (nivelAnterior == nivel && nivel == 9)) {
			swNivel = false;
		} else {
			swNivel = true;
		}
		this.nivel = nivel;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getPeriodoActual() {
		return periodoActual;
	}

	public void setPeriodoActual(String periodoActual) {
		this.periodoActual = periodoActual;
	}

	public String[] getArrayPeriodoActual() {
		return arrayPeriodoActual;
	}

	public void setArrayPeriodoActual(String[] arrayPeriodoActual) {
		this.arrayPeriodoActual = arrayPeriodoActual;
	}

	public boolean isSeleccionarForm1() {
		return seleccionarForm1;
	}

	public void setSeleccionarForm1(boolean seleccionarForm1) {
		this.seleccionarForm1 = seleccionarForm1;
	}

	public double getTipoCambio() {
		return tipoCambio;
	}

	public void setTipoCambio(double tipoCambio) {
		this.tipoCambio = tipoCambio;
	}

	public double getTipoCambioUfv() {
		return tipoCambioUfv;
	}

	public void setTipoCambioUfv(double tipoCambioUfv) {
		this.tipoCambioUfv = tipoCambioUfv;
	}

	public String getTipoPlanCuenta() {
		return tipoPlanCuenta;
	}

	public void setTipoPlanCuenta(String tipoPlanCuenta) {
		this.tipoPlanCuenta = tipoPlanCuenta;
	}

	public TreeNode getRootPC() {
		return rootPC;
	}

	public void setRootPC(TreeNode rootPC) {
		this.rootPC = rootPC;
	}

	public List<EDNivel> getListNivel() {
		return listNivel;
	}

	public void setListNivel(List<EDNivel> listNivel) {
		this.listNivel = listNivel;
	}

	public UIData getUsersDataTable() {
		return usersDataTable;
	}

	public void setUsersDataTable(UIData usersDataTable) {
		this.usersDataTable = usersDataTable;
	}

	public boolean isButtonCancelar() {
		return buttonCancelar;
	}

	public void setButtonCancelar(boolean buttonCancelar) {
		this.buttonCancelar = buttonCancelar;
	}

	public int getTamanio() {
		return tamanio;
	}

	public void setTamanio(int tamanio) {
		this.tamanio = tamanio;
	}

	public String getTabCompania() {
		return tabCompania;
	}

	public void setTabCompania(String tabCompania) {
		this.tabCompania = tabCompania;
	}

	public String getTabGestion() {
		return tabGestion;
	}

	public void setTabGestion(String tabGestion) {
		this.tabGestion = tabGestion;
	}

	public String getTabPlanCuenta() {
		return tabPlanCuenta;
	}

	public void setTabPlanCuenta(String tabPlanCuenta) {
		this.tabPlanCuenta = tabPlanCuenta;
	}

	public String getTabParametros() {
		return tabParametros;
	}

	public void setTabParametros(String tabParametros) {
		this.tabParametros = tabParametros;
	}

	public int getNumeroTab() {
		return numeroTab;
	}

	public void setNumeroTab(int numeroTab) {
		this.numeroTab = numeroTab;
	}

	public boolean isButtonAnterior() {
		return buttonAnterior;
	}

	public void setButtonAnterior(boolean buttonAnterior) {
		this.buttonAnterior = buttonAnterior;
	}

	public boolean isButtonSiguiente() {
		return buttonSiguiente;
	}

	public void setButtonSiguiente(boolean buttonSiguiente) {
		this.buttonSiguiente = buttonSiguiente;
	}

	public boolean isSeleccionadaFormEmpresa() {
		return seleccionadaFormEmpresa;
	}

	public void setSeleccionadaFormEmpresa(boolean seleccionadaFormEmpresa) {
		this.seleccionadaFormEmpresa = seleccionadaFormEmpresa;
	}

	public List<UsuarioSucursal> getListUsuarioSucursals() {
		return listUsuarioSucursals;
	}

	public void setListUsuarioSucursals(List<UsuarioSucursal> listUsuarioSucursals) {
		this.listUsuarioSucursals = listUsuarioSucursals;
	}

}
