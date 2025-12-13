package com.helena_app.backend.services;

import com.helena_app.backend.models.User;
import com.helena_app.backend.repositories.UserRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author anton
 */
@Service
public class UserService {

    @Autowired
    public UserRepository userRepository;

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public User findById(long id) {
        return userRepository.findById(id).orElseThrow();
    }

    public User createUser(User newUser) {
        User createdUser = userRepository.save(newUser);
        return createdUser;
    }

    public User updateUser(Long id, User newUser) {
        User user = userRepository.findById(id).orElseThrow();
        user.setEmail(newUser.getEmail());
        user.setPassword(newUser.getPassword());
        user.setName(newUser.getName());

        return user;
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }
}
