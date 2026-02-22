from fastapi import APIRouter, Depends 
from app.services.auth import AuthService 
from app.schemas.auth import Signin, Token, Login
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from app.services.user import UserService
from app.db import SessionLocal
from app.schemas.user import UserCreate

router = APIRouter(prefix="/auth", tags=["Auth"])


def get_auth_service() -> AuthService:
  return AuthService(session=SessionLocal())

def get_user_service() -> UserService:
  return UserService(session=SessionLocal())

@router.post("/login", response_model = Token)
async def login(login: Login, user_service:UserService = Depends(get_user_service), 
                              auth_service: AuthService = Depends(get_auth_service)
  ):
  token = auth_service.authenticate(login, user_service)
  return token
  
@router.post("/signin", response_model=UserCreate)
async def signin(signin: Signin, user_service: UserService = Depends(get_user_service),
                                 auth_service: AuthService = Depends(get_auth_service)
  ):
  user = auth_service.create_account(signin, user_service)
  return user
  
@router.post("/token/verify")
async def verify_token():
  pass

@router.post("/token/reset")
async def reset_token():
  pass