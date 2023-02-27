package com.erictrudell.blurbbox.repositories;

import org.springframework.data.repository.CrudRepository;

import com.erictrudell.blurbbox.models.User;

public interface UserRepository extends CrudRepository<User, Long> {
    User findByUsername(String username);
}
