package com.erictrudell.blurbbox.models;


import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name="categories")
public class Category {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotBlank(message="Title required")
    private String title;
	
	@OneToMany(mappedBy="blurb", fetch = FetchType.LAZY)
    private List<Blurb> blurbs;
	
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<Blurb> getBlurbs() {
		return blurbs;
	}
	public void setBlurbs(List<Blurb> blurbs) {
		this.blurbs = blurbs;
	}
    
    
}
