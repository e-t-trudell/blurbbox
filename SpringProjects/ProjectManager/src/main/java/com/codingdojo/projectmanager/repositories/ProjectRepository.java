package com.codingdojo.projectmanager.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.projectmanager.models.Project;
import com.codingdojo.projectmanager.models.User;

@Repository
public interface ProjectRepository extends CrudRepository<Project, Long> {
		List<Project> findAll();
		Project findByIdIs (Long id);
		List<Project> findAllByUsers(User user); // used to find all projects connected to a user
		List<Project> findByUsersNotContains (User user); // used to find all projects not connected by a user
}
 