package com.erictrudell.blurbbox.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.erictrudell.blurbbox.models.Blurb;

@Repository
public interface BlurbRepository extends CrudRepository <Blurb, Long>{

	List <Blurb> findAll();
	
}
