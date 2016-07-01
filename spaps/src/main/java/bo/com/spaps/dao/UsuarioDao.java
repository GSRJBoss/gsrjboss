/**
 * 
 */
package bo.com.spaps.dao;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;

import bo.com.spaps.model.Usuario;
import bo.com.spaps.model.UsuarioCompania;
import bo.com.spaps.util.FacesUtil;
import bo.com.spaps.util.O;
import bo.com.spaps.util.P;
import bo.com.spaps.util.Q;
import bo.com.spaps.util.R;
import bo.com.spaps.util.S;
import bo.com.spaps.util.U;
import bo.com.spaps.util.V;
import bo.com.spaps.util.W;

/**
 * @author Cesar Rojas
 *
 */
@Stateless
public class UsuarioDao extends
		DataAccessObjectJpa<Usuario, UsuarioCompania, R, S, O, P, Q, U, V, W> {

	/**
	 * 
	 */
	public UsuarioDao() {
		super(Usuario.class, UsuarioCompania.class);
	}

	public Usuario registrar(Usuario usuario,
			List<UsuarioCompania> usuarioCompania) {
		try {
			beginTransaction();
			usuario = create(usuario);
			for (UsuarioCompania usuarioCompania2 : usuarioCompania) {
				usuarioCompania2.setUsuario(usuario);
				usuarioCompania2.setFechaRegistro(new Date());
				usuarioCompania2 = createE(usuarioCompania2);
			}
			commitTransaction();
			FacesUtil.infoMessage("Registro Correcto",
					"Usuario " + usuario.toString());
			return usuario;
		} catch (Exception e) {
			String cause = e.getMessage();
			if (cause
					.contains("org.hibernate.exception.ConstraintViolationException: could not execute statement")) {
				FacesUtil.errorMessage("Ya existe un registro igual.");
			} else {
				FacesUtil.errorMessage("Error al registrar");
			}
			rollbackTransaction();
			return null;
		}
	}

	public Usuario modificar(Usuario usuario) {
		try {
			beginTransaction();
			usuario = update(usuario);
			commitTransaction();
			FacesUtil.infoMessage("Modificación Correcta",
					"Usuario " + usuario.toString());
			return usuario;
		} catch (Exception e) {
			String cause = e.getMessage();
			if (cause
					.contains("org.hibernate.exception.ConstraintViolationException: could not execute statement")) {
				FacesUtil.errorMessage("Ya existe un registro igual.");
			} else {
				FacesUtil.errorMessage("Error al modificar");
			}
			rollbackTransaction();
			return null;
		}
	}

	public boolean eliminar(Usuario usuario) {
		try {
			beginTransaction();
			usuario.setState("RM");
			Usuario bar = modificar(usuario);
			commitTransaction();
			FacesUtil.infoMessage("Eliminación Correcta",
					"Usuario " + usuario.toString());
			return bar != null ? true : false;
		} catch (Exception e) {
			FacesUtil.errorMessage("Error al eliminar");
			rollbackTransaction();
			return false;
		}
	}

	public Usuario obtenerUsuario(Integer id) {
		return findById(id);
	}

	public Usuario obtenerUsuarioPorNombre(String nombre) {
		return findByParameter("nombre", nombre);
	}

	public List<Usuario> obtenerUsuariosPorNombre(String nombre) {
		String query = "select em.* from Usuario em where nombre like '"
				+ nombre + "'";
		return executeQueryResulList(query);
	}

	public List<UsuarioCompania> obtenerSucursalesDeUsuario(Usuario usuario) {
		return findAllActivosByParameterE("usuario", usuario.getId());
	}

	public boolean VerificarSuperAdmin(Usuario usuario) {
		List<UsuarioCompania> lr = obtenerSucursalesDeUsuario(usuario);
		return lr.size() > 1;
	}

	public List<Usuario> obtenerUsuariosPorRol(Integer id) {
		return findAllActivosByParameter("rol", id);
	}

	public List<Usuario> obtenerUsuariosPorRol(String nombre) {
		return findAllActivosByParameter("rol", nombre);
	}

	public List<Usuario> obtenerUsuarioOrdenAscPorId() {
		return findAscAllOrderedByParameter("id");
	}

	public List<Usuario> obtenerUsuarioOrdenDescPorId() {
		return findDescAllOrderedByParameter("id");
	}

	public Usuario findByLogin(String username, String password) {
		return findByParameterObjectTwo("", "password", username, password);
	}

}
