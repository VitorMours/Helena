package com.helena_app.backend.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helena_app.backend.models.Habit;
import com.helena_app.backend.repositories.HabitRepository;

@Service 
public class HabitService {
    
    @Autowired 
    public HabitRepository habitRepository; 

    public Habit createHabit(Habit newHabit){
        Habit createdHabit = habitRepository.save(newHabit);
        return createdHabit;
    }

    public List<Habit> findAllHabits() {
        List<Habit> habits = habitRepository.findAll();
        return habits;
    }

    public Habit findHabitById(Long id){
        Habit findedHabit = habitRepository.findById(id).orElseThrow();
        return findedHabit;
    }

    public Habit updateHabit(Long id, Habit newHabitData){
        Habit habit = habitRepository.findById(id).orElseThrow();
        habit.setTitle(newHabitData.getTitle());
        habit.setDescription(newHabitData.getDescription());
        habit.setOwner(newHabitData.getOwner());
        return habit;
    }

    public void deleteHabit(Long id){
        habitRepository.deleteById(id);
    }
}
