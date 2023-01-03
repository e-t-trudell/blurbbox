package com.codingdojo.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

//import com.codingdojo.dojosandninjas.models.Dojo;
import com.codingdojo.dojosandninjas.models.Ninja;
import com.codingdojo.dojosandninjas.repositories.NinjaRepository;

@Service
public class NinjaService {
private final NinjaRepository ninjaRepository;
	
	public NinjaService(NinjaRepository ninjaRepository) {
		this.ninjaRepository = ninjaRepository;
	}
	
	// returns all the books
    public List<Ninja> allNinjas() {
        return ninjaRepository.findAll();
    }
    // creates a book
    public Ninja createNinja(Ninja n) {
        return ninjaRepository.save(n);
    }
    // retrieves a book
    public Ninja findNinja(Long id) {
        Optional<Ninja> optionalNinja = ninjaRepository.findById(id);
        if(optionalNinja.isPresent()) {
            return optionalNinja.get();
        } else {
            return null;
        }
    }
    //updates a book
    public Ninja updateNinja(Ninja n) {
    	return ninjaRepository.save(n);

    }
    
    // Delete a book
    public void deleteNinja(Long id) {
    	Optional<Ninja> optionalNinja = ninjaRepository.findById(id);
    	if(optionalNinja.isPresent()) {
    		 ninjaRepository.deleteById(id);
    	}
    	
    }
    
//    public List<Ninja> byDojo(Dojo dojo) {
//    	return dojoRepository.findAllByDojo(dojo);
//    }
}