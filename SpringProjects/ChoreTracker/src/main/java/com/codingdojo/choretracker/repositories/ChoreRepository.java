package com.codingdojo.choretracker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.choretracker.models.Chore;
import com.codingdojo.choretracker.models.User;

@Repository
public interface ChoreRepository extends CrudRepository<Chore, Long>{
	List<Chore> findAll();
	Chore findByIdIs (Long id);
	List<Chore> findAllByUsers(User user); // used to find all chores connected to a user
	List<Chore> findByUsersNotContains (User user); // used to find all chores not connected by a user
}
