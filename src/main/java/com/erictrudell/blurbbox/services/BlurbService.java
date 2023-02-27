package com.erictrudell.blurbbox.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erictrudell.blurbbox.models.Blurb;
import com.erictrudell.blurbbox.repositories.BlurbRepository;

@Service
public class BlurbService {


	@Autowired
	private BlurbRepository repo;
	
	public Blurb findById(Long id) {
		
		Optional<Blurb> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		
		return null;
	}
	

	public List<Blurb> all() {
		return repo.findAll();
	}
	
	public Blurb create(Blurb blurb) {
		return repo.save(blurb);
	}
	
	public Blurb updateBlurb(Blurb blurb) {
		return repo.save(blurb);
	}
	
	public Blurb findBlurb(Long id) {
        Optional<Blurb> optionalBlurb = repo.findById(id);
        if(optionalBlurb.isPresent()) {
            return optionalBlurb.get();
        } else {
            return null;
	        }
    }
	
	public void deleteBlurb(Blurb blurb) {
		repo.delete(blurb);
}
}
