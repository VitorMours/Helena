package com.helena_app.backend.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.helena_app.backend.models.Habit;

public interface HabitRepository extends JpaRepository<Habit, Long>{
    
}
