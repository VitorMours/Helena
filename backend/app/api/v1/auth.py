from fastapi import APIRouter, Depends 
from app.services.auth import AuthService 
from app.schemas.auth import Token, Login
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm

router = APIRouter(prefix="/auth", tags=["Auth"])


def get_auth_service() -> AuthService:
  return AuthService()

@router.post("/token", response_model = Token)
async def generate_token(login: Login, auth_service: AuthService = Depends(get_auth_service)):
  pass  
  
@router.post("/token/verify")
async def verify_token():
  pass

@router.post("/token/reset")
async def reset_token():
  pass