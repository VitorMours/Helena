from fastapi import APIRouter, Depends
from app.db import SessionLocal 
from app.services.habit import HabitService
from app.schemas.habit import *
from typing import List

router = APIRouter(prefix="/habits", tags=["Habit"])

def get_habit_service() -> None:
    return HabitService(session=SessionLocal())


@router.get("/", response_model=List[HabitRead])
async def get_all_habits(habit_service: HabitService = Depends(get_habit_service)) -> list[HabitRead]:
    return habit_service.get_all_habits()

@router.get("/{habit_id}", response_model=HabitRead)
async def get_habit_by_id(habit_id: uuid.UUID, habit_service: HabitService = Depends(get_habit_service)) -> HabitRead:
    return habit_service.get_habit_by_id(habit_id)

@router.post("/", response_model=HabitRead)
async def create_habit(habit: HabitCreate, habit_service: HabitService = Depends(get_habit_service)) -> HabitRead:
    return habit_service.create_habit(habit)
