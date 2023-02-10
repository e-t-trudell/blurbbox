package com.codingdojo.choretracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.choretracker.models.Chore;
import com.codingdojo.choretracker.models.User;
import com.codingdojo.choretracker.repositories.ChoreRepository;


@Service
public class ChoreService {
	
private final ChoreRepository choreRepository;
	
	public ChoreService(ChoreRepository choreRepository) {
		this.choreRepository = choreRepository;
	}
	
	public List<Chore> allChores(){
		return choreRepository.findAll();
	}
	
	public Chore updateChore(Chore chore) {
		return choreRepository.save(chore);
	}
	
	public List<Chore> getAssignedChores(User user){
		return choreRepository.findAllByUsers(user);
	}
	
	public List<Chore> getUnassignedChores(User user){
		return choreRepository.findByUsersNotContains(user);
	}
	
	public Chore addChore(Chore chore) {
		return choreRepository.save(chore);
	}
	
	public void deleteChore(Chore chore) {
		choreRepository.delete(chore);
	}
	
	public Chore findById(Long id) {
		Optional<Chore> optionalChore = choreRepository.findById(id);
		if(optionalChore.isPresent()) {
			return optionalChore.get();
		}else {
			return null;
		}
	}
}
