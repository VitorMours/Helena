package com.helena_app.backend.controllers;

import java.util.List;
import com.helena_app.backend.models.Habit;
import com.helena_app.backend.services.HabitService;

import io.swagger.v3.oas.annotations.parameters.RequestBody;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping; 
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;

@RestController
@RequestMapping("/habits")
public class HabitController {
    
    @Autowired 
    private HabitService habitService;

    @GetMapping 
    public ResponseEntity<List<Habit>> getHabits() {
        List<Habit> habits = habitService.findAllHabits();
        return ResponseEntity.ok().body(habits);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Habit> gethabitById(@PathVariable Long id){
        Habit habit = habitService.findHabitById(id);
        return ResponseEntity.ok().body(habit);
    }

    @PostMapping 
    public ResponseEntity<Habit> createHabit(@RequestBody Habit newHabit){
        Habit createdHabit = habitService.createHabit(newHabit);
        return ResponseEntity.status(201).body(createdHabit);
    }






}
