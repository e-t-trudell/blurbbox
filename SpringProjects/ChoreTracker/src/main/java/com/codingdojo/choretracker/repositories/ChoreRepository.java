package com.codingdojo.choretracker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.choretracker.models.Chore;
import com.codingdojo.choretracker.models.User;

@Repository
public interface ChoreRepository extends CrudRepository<Chore, Long>{
	List<Chore> findAll();
	
}
