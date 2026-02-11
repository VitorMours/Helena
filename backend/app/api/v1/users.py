from fastapi import APIRouter, Depends 
from app.db import SessionLocal
from app.services.auth import UserService

router = APIRouter()

def get_user_service(self) -> None:
  return UserService(session=SessionLocal())



@router.get("/")
async def get_all_users(service: UserService = Depends(get_user_service)):
  return service.get_all_users()