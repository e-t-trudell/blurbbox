//package com.codingdojo.renderingbooks.controllers;
//
//import java.util.List;
//
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.codingdojo.renderingbooks.models.Book;
//import com.codingdojo.renderingbooks.services.BookService;
//
//@RestController
//public class BooksApi {
//	private final BookService bookService;
//	
//	public BooksApi(BookService bookService) {
//		this.bookService = bookService;
//	}
//	//display the books
//	@RequestMapping("/api/books")
//	public List<Book> index() {
//		return bookService.allBooks();
//	}
//	
//	//Create a book
//	@RequestMapping(value="/api/books", method=RequestMethod.POST)
//	 public Book create(@RequestParam(value="title") String title, @RequestParam(value="description") String desc, @RequestParam(value="language") String lang, @RequestParam(value="pages") Integer numOfPages) {
//	     Book book = new Book(title, desc, lang, numOfPages);
//	     return bookService.createBook(book);
//	}
//	
//	//Display One specific book
//	@RequestMapping("/api/books/{id}")
//	public Book show(@PathVariable("id") Long id) {
//		Book book = bookService.findBook(id);
//		return book;
//	}
//	
//	// Update a specific book
//	@RequestMapping(value="/api/books/{id}", method=RequestMethod.PUT)
//	 public Book update(@PathVariable("id") Long id, @RequestParam(value="title") String title, @RequestParam(value="description") String desc, @RequestParam(value="language") String lang, @RequestParam(value="pages") Integer numOfPages) {
//	     Book book = new Book( title, desc, lang, numOfPages); // turns out the code in the platform was a bit weird until I looked at
//	     // some other resources. Then it all clicked together
//	     book.setId(id);
//	     Book updateBook = bookService.updateBook(book); //why is this set up like this???
//	     return updateBook;
//	 }
//	
//	// Delete a specific book
//	@RequestMapping(value="/api/books/{id}", method=RequestMethod.DELETE)
//	 public void destroy(@PathVariable("id") Long id) {
//	     bookService.deleteBook(id);
//	 }
//}
