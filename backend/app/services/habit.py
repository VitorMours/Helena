from typing import List 
from sqlalchemy.orm import Session 
from app.models.habit import Habit 
import uuid

class HabitService:
    def __init__(self, session: Session) -> None:
        self._db = session

    def create_habit(self) -> None:
        pass 

    def update_habit(self) -> None:
        pass 

    def read_habit(self) -> None:
        pass 

    def deactivate_habit(self) -> None:
        pass 

    def delete_habit(self) -> None:
        pass