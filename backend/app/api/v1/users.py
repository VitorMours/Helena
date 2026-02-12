from fastapi import APIRouter, Depends 
from app.db import SessionLocal
from app.services.user import UserService
from app.schemas.user import UserCreate, UserRead
import uuid
router = APIRouter(prefix="/users", tags=["Users"])

def get_user_service() -> UserService:
  return UserService(session=SessionLocal())

@router.get("/", response_model=list[UserRead])
async def get_all_users(service: UserService = Depends(get_user_service)):
  return service.get_all_users()

@router.get("/{id}", response_model = UserRead)
async def get_user_by_id(id: uuid.UUID, service: UserService = Depends(get_user_service)):
  return service.get_user_by_id(id)

@router.post("/", response_model=UserRead)
async def create_user(user: UserCreate, service: UserService = Depends(get_user_service)):
  return service.create_user(user)