package com.codingdojo.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.dojosandninjas.models.Dojo;
import com.codingdojo.dojosandninjas.repositories.DojoRepository;


@Service
public class DojoService {
private final DojoRepository dojoRepository;
	
	public DojoService(DojoRepository dojoRepository) {
		this.dojoRepository = dojoRepository;
	}
	
	// returns all the books
    public List<Dojo> allDojos() {
        return dojoRepository.findAll();
    }
    // creates a book
    public Dojo createDojo(Dojo d) {
        return dojoRepository.save(d);
    }
    // retrieves a book
    public Dojo findDojo(Long id) {
        Optional<Dojo> optionalDojo = dojoRepository.findById(id);
        if(optionalDojo.isPresent()) {
            return optionalDojo.get();
        } else {
            return null;
        }
    }
    //updates a book
    public Dojo updateDojo(Dojo d) {
    	return dojoRepository.save(d);

    }
    
    // Delete a book
    public void deleteDojo(Long id) {
    	Optional<Dojo> optionalDojo = dojoRepository.findById(id);
    	if(optionalDojo.isPresent()) {
    		 dojoRepository.deleteById(id);
    	}
    	
    }
}
