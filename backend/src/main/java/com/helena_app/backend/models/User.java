package com.helena_app.backend.models;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Column; 
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import java.util.Date;
import java.util.List;


@Entity
@Table(name="tb_users")
public class User implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    
    @Column
    private String name;
    @Column
    private String email;
    @Column
    private Date dateJoined;

    @Column
    private String password;

    @OneToMany(mappedBy="owner")
    private List<Habit> habits; 


    public User(){}

    public User(String name, String email, String password){
        this.name = name;
        this.password = password; 
        this.email = email; 
        this.dateJoined = new Date();
    }

    // Getters and Setters
    public String getName(){
        return this.name;
    }
    
    public String getEmail(){
        return this.email;
    }
    
    public Date getDateJoined(){
        return this.dateJoined;
    }
    
    public String getPassword(){
        return this.password;
    }

    public void setName(String newName){
        this.name = newName;
    }
    
    public void setEmail(String newEmail){
        this.email = newEmail;
    }
    
    public void setPassword(String newPassword){
        this.password = newPassword;
    }
    
    @Override 
    public String toString(){
        StringBuilder builder = new StringBuilder(); 
        return builder.toString();
    }
}
