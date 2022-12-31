package com.codingdojo.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.repositories.LanguageRepository;


@Service
public class LanguageService {
private final LanguageRepository languageRepository;
	
	
	public LanguageService(LanguageRepository languageRepository) {
		this.languageRepository = languageRepository;
	} 
	
	// returns all the books
    public List<Language> allLanguages() {
        return languageRepository.findAll();
    } 
    // creates a book
    public Language createLanguage(Language l) {
        return languageRepository.save(l);
    }
    // retrieves a book
    public Language findLanguage(Long id) {
        Optional<Language> optionalLanguage = languageRepository.findById(id);
        if(optionalLanguage.isPresent()) {
            return optionalLanguage.get();
        } else {
            return null;
        }
    }
    //updates a book
    public Language updateLanguage(Language l) {
    	return languageRepository.save(l);

    }
    
    // Delete a book
    public void deleteLanguage(Long id) {
    	Optional<Language> optionalLanguage = languageRepository.findById(id);
    	if(optionalLanguage.isPresent()) {
    		 languageRepository.deleteById(id);
    	}
    	
    }
}
