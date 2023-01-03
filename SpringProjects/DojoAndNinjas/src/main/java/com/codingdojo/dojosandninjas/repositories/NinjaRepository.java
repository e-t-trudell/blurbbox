package com.codingdojo.dojosandninjas.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.dojosandninjas.models.Dojo;
import com.codingdojo.dojosandninjas.models.Ninja;

@Repository
public interface NinjaRepository extends CrudRepository<Ninja, Long> {
List<Ninja> findAll();
	
	// this method finds expenses with descriptions containing the search string
    List<Ninja> findByNameContaining(String search);
    // this method counts how many titles contain a certain string
    Long countByNameContaining(String search);
    // this method deletes an expense that starts with a specific title
    Long deleteByNameStartingWith(String search);
List<Ninja> findAllByDojo(Dojo dojo);
}
