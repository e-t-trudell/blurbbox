package com.codingdojo.projectmanager.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.projectmanager.models.Project;
import com.codingdojo.projectmanager.repositories.ProjectRepository;



@Service
public class ProjectServices {
	@Autowired
	private ProjectRepository projectRepository;
	
	public Project findById(Long id) {
		Optional<Project> result = projectRepository.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public List<Project> all() {
		return projectRepository.findAll();
	}
	
	public Project createProject(Project project) {
		return this.projectRepository.save(project);
	}
	
	public Project updateProject(Project project) {
		return projectRepository.save(project);
	}
	
	public void deleteProject(Long id) {
    	Optional<Project> optionalProject = projectRepository.findById(id);
    	if(optionalProject.isPresent()) {
    		 projectRepository.deleteById(id);
    	}
    	
    }
}
