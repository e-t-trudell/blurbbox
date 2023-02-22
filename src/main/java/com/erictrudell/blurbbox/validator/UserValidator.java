package com.erictrudell.blurbbox.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.erictrudell.blurbbox.models.User;

@Component
public class UserValidator implements Validator {
    
    //    1
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }
    
    // 2
    @Override
    public void validate(Object object, Errors errors) {
        User user = (User) object;
//        does this still work with bCrypt being used?
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            // 3
            errors.rejectValue("passwordConfirmation", "Match", "Passwords must match!");
        }         
    }
}
//NOTES
//supports(Class<?>): Specifies that a instance of the User Domain Model can be validated with this custom validator
//validate(Object, Errors): Creating our custom validation. We can add errors via .rejectValue(String, String).
//.rejectValue(String, String): the first argument is the member variable of our Domain model that we are validating. The second argument is a code for us to use to set an error message.
