package com.erictrudell.blurbbox.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.erictrudell.blurbbox.models.Role;

public interface RoleRepository extends CrudRepository<Role, Long> {
	
	List<Role> findAll();
    
    List<Role> findByName(String name);
}
