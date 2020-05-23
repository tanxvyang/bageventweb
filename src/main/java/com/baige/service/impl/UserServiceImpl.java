package com.baige.service.impl;

import com.baige.entity.User;
import com.baige.repository.PersonRepository;
import com.baige.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
     @Autowired
     private PersonRepository personRepository;
    public String test(){
        return "test";

    }

    @Override
    public Long saveUser() {
        User person = new User();
        person.setUsername("XRog");
        person.setPhone("18381005946");
        person.setAddress("chenDu");
        person.setRemark("this is XRog");
        return personRepository.save(person);
    }
}
