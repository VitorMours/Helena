from typing import List 
from sqlalchemy.orm import Session 
from app.models.habit import Habit 
import uuid
from app.schemas.habit import HabitCreate, HabitRead, HabitUpdate

class HabitService:
    def __init__(self, session: Session) -> None:
        self._db = session

    def create_habit(self, habit: HabitCreate) -> None:
        habit_data = habit.model_dump() 
        new_habit = Habit(**habit_data)
        self._db.add(new_habit)
        self._db.commit()
        self._db.refresh(new_habit)
        return new_habit
        
    def get_all_habits(self) -> List[Habit]:
        return self._db.query(Habit).all()
    
    def get_habit_by_id(self, habit_id: uuid.UUID) -> None:
        return self._db.query(Habit).filter(Habit.id == habit_id).first()
    
    def update_habit(self, habit_id: uuid.UUID, habit_update: HabitUpdate) -> None | Habit:
        habit = self.get_habit_by_id(habit_id)
        if not habit:
            return None 
    
        update_data = habit_update.model_dump(exclude_unset=True)
    
        for k, v in update_data.items():
            setattr(habit, k, v)
    
        self._db.commit()
        self._db.refresh(habit)
        return habit
    
    def deactivate_habit(self) -> None:
        pass 

    def delete_habit(self, habit_id: uuid.UUID) -> None:
        habit = self.get_habit_by_id(habit_id)
        if not habit:
            return None 
        self._db.delete(habit)
        self._db.commit()
        return True
