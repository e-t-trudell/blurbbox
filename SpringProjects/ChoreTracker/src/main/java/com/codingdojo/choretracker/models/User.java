package com.codingdojo.choretracker.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;




@Entity
@Table(name="users")
public class User {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty(message="First name is required!")
    @Size(min=3, max=30, message="Name must be between 3 and 30 characters")
    private String firstName;
    
    @NotEmpty(message="last name is required!")
    @Size(min=3, max=30, message="Name must be between 3 and 30 characters")
    private String lastName;
    
    @NotEmpty(message="Email is required!")
    @Email(message="Please enter a valid email!")
    private String email;
    
    @NotEmpty(message="Password is required!")
    @Size(min=8, max=128, message="Password must be between 8 and 128 characters")
    private String password;
    
    @Transient
    @NotEmpty(message="Confirm Password is required!")
    @Size(min=8, max=128, message="Confirm Password must be between 8 and 128 characters")
    private String confirm;
    
    @OneToMany(mappedBy="user", cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Chore> chores;
    
    
    @Column(updatable=false)
    @OneToMany(mappedBy="creator", cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Chore> choresLed;
  
    public List<Chore> getChoresLed() {
		return choresLed;
	}

	public void setChoresLed(List<Chore> choresLed) {
		this.choresLed = choresLed;
	}
    
    public User() {
    	
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public List<Chore> getChores() {
		return chores;
	}

	public void setChores(List<Chore> chores) {
		this.chores = chores;
	}

    
}


