package com.codingdojo.test1.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.test1.models.Show;
import com.codingdojo.test1.repositories.ShowRepository;

@Service
public class ShowServices {
	@Autowired 
	private ShowRepository showRepository;
	
	public Show findById(Long id) {
		Optional<Show> result = showRepository.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public List<Show> all() {
		return showRepository.findAll();
	}
	
	public Show createShow(Show show) {
		return this.showRepository.save(show);
	}
	
	public Show updateShow(Show show) {
		return showRepository.save(show);
	}
	
	public void deleteShow(Long id) {
    	Optional<Show> optionalShow = showRepository.findById(id);
    	if(optionalShow.isPresent()) {
    		 showRepository.deleteById(id);
    	}
    	
    }
}
