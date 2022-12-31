package com.codingdojo.languages.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.languages.models.Language;


@Repository
public interface LanguageRepository extends CrudRepository<Language, Long>{
	List<Language> findAll();
	 
	// this method finds expenses with descriptions containing the search string
    List<Language> findByCreatorContaining(String search);
    // this method counts how many titles contain a certain string
    Long countByNameContaining(String search);
    // this method deletes an expense that starts with a specific title
    Long deleteByNameStartingWith(String search);
}
