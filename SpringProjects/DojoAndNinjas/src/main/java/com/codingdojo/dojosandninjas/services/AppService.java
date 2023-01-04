package com.codingdojo.dojosandninjas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.dojosandninjas.models.Dojo;
import com.codingdojo.dojosandninjas.models.Ninja;
import com.codingdojo.dojosandninjas.repositories.DojoRepository;
import com.codingdojo.dojosandninjas.repositories.NinjaRepository;

@Service
public class AppService {
	@Autowired
	private NinjaRepository ninjaRepository;
	@Autowired
	private DojoRepository dojoRepository;
	
	public List<Dojo> allDojos(){
		return this.dojoRepository.findAll();
	}
	public Dojo createDojo(Dojo dojo) {
		return this.dojoRepository.save(dojo);
	}
	public Ninja createNinja(Ninja ninja) {
		return this.ninjaRepository.save(ninja);
	}
	
	public Dojo getOneDojo(Long id) {
		return this.dojoRepository.findById(id).orElse(null);
	}
	
	
}
