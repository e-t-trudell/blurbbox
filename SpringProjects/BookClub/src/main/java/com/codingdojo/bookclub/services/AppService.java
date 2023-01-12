package com.codingdojo.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.repositories.BookRepository;


@Service
public class AppService {
	@Autowired
	private BookRepository bookRepository;
	
	public Book findById(Long id) {
		Optional<Book> result = bookRepository.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public List<Book> allBooks() {
		return bookRepository.findAll();
	}
	
	public Book createBook(Book book) {
		return this.bookRepository.save(book);
	}
	
	
}
