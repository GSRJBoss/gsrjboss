package bo.com.spaps.service;

import javax.ejb.Stateless;

import bo.com.spaps.model.UsuarioRol;

//The @Stateless annotation eliminates the need for manual transaction demarcation
@Stateless
public class UsuarioRolRegistration extends DataAccessService<UsuarioRol>{

	public UsuarioRolRegistration(){
		super(UsuarioRol.class);
	}

	
}

