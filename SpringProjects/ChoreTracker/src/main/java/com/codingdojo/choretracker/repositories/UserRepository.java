package com.codingdojo.choretracker.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.choretracker.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long>{
	List<User> findAll();
	Optional<User> findByEmail(String email); //used for login and registration when looking up by email
	User findByIdIs (Long id); // needed to find individual users within our project
}
