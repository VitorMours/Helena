from fastapi import APIRouter, Depends
from app.db import SessionLocal 
from app.services.habit import HabitService
from app.schemas.habit import *


router = APIRouter(prefix="habits", tags=["Habit"])

def get_habit_service() -> None:
    return HabitService(session=SessionLocal())


# TODO: Criar rotas