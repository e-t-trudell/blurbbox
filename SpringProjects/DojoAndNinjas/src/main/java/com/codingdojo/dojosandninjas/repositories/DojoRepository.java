package com.codingdojo.dojosandninjas.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.dojosandninjas.models.Dojo;


@Repository
public interface DojoRepository extends CrudRepository<Dojo, Long>{
List<Dojo> findAll();
	
//	// this method finds expenses with descriptions containing the search string
//    List<Dojo> findByNameContaining(String search);
//    // this method counts how many titles contain a certain string
//    Long countByNameContaining(String search);
//    // this method deletes an expense that starts with a specific title
//    Long deleteByNameStartingWith(String search);
}
