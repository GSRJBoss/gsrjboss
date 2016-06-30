package bo.com.spaps.dao;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;

import bo.com.spaps.model.Usuario;
import bo.com.spaps.util.E;
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
 * 
 * @author David.Ticlla.Felipe
 *
 */
@Stateless
public class UsuarioDao extends DataAccessObjectJpa<Usuario,E,R,S,O, P, Q, U, V, W> {

	public UsuarioDao(){
		super(Usuario.class);
	}

	public Usuario registrarUsuario(Usuario usuario){
		try{
			beginTransaction();
			usuario = create(usuario);
			commitTransaction();
			FacesUtil.infoMessage("Registro Correcto", "Usuario "+usuario.getNombre());
			return usuario;
		}catch(Exception e){
			String cause=e.getMessage();
			if (cause.contains("org.hibernate.exception.ConstraintViolationException: could not execute statement")) {
				FacesUtil.errorMessage("Ya existe un registro igual.");
			}else{
				FacesUtil.errorMessage("Error al registrar");
			}
			rollbackTransaction();
			return null;
		}
	}

	public Usuario modificarUsuario(Usuario usuario){
		try{
			beginTransaction();
			usuario = update(usuario);
			commitTransaction();
			FacesUtil.infoMessage("Modificación Correcta", "Usuario "+usuario.getNombre());
			return usuario;
		}catch(Exception e){
			String cause=e.getMessage();
			if (cause.contains("org.hibernate.exception.ConstraintViolationException: could not execute statement")) {
				FacesUtil.errorMessage("Ya existe un registro igual.");
			}else{
				FacesUtil.errorMessage("Error al modificar");
			}
			rollbackTransaction();
			return null;
		}
	}

	public boolean eliminarUsuario(Usuario usuario){
		try{
			beginTransaction();
			usuario.setLogin(new Date()+"|"+usuario.getLogin());
			Usuario usr = modificarUsuario(usuario);
			commitTransaction();
			FacesUtil.infoMessage("Eliminación Correcta", "Usuario "+usuario.getNombre());
			return usr!=null?true:false;
		}catch(Exception e){
			FacesUtil.errorMessage("Error al eliminar");
			rollbackTransaction();
			return false;
		}
	}

	
	public Usuario obtenerUsuarioId(Integer id){
		return findById(id);
	}
	
	public List<Usuario> obtenerUsuarioOrdenAscPorId(){
		return findAscAllOrderedByParameter("id");
	}
	
	public List<Usuario> obtenerUsuarioOrdenDescPorId(){
		return findDescAllOrderedByParameter("id");
	}
}
