package com.helena_app.backend.models;

import java.io.Serializable;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Table; 
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.GenerationType;

@Entity
@Table(name="tb_habits")
public class Habit implements Serializable{

    private static final long serialVersionUID = 1L;
 
    @Id 
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;

    @Column(nullable=false)
    private String title;

    @Column
    private String description; 
    
    @Column(nullable=false)
    private boolean completed = false;
    
    @ManyToOne
    @JoinColumn(name="owner_id", nullable=false)
    private User owner; 

    public Habit(){}

    public Habit(String title, String description, boolean completed, User owner){
        this.title = title;
        this.description = description;
        this.completed = completed;
        this.owner = owner;
    }

    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }

    public void setOwner(User owner){
        this.owner = owner;
    }

    public User getOwner(){
        return this.owner;
    }

    public boolean isCompleted() {
        return completed;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
    }

    @Override
    public String toString(){
        StringBuilder builder = new StringBuilder(); 
        return builder.toString();
    }
}
