from datetime import datetime, timedelta, timezone
from http.client import HTTPException
import json
import jwt 
from app.exceptions.user import UserDoesNotFound
from app.schemas.auth import Login
from pwdlib import PasswordHash
from sqlalchemy.orm import Session 
from typing import TYPE_CHECKING
SECRET_KEY = "09d25e094faa6ca2556c818166b7a9563b93f7099f6f0f4caa6cf63b88e8d3e7"
ALGORITHM = "HS256"
if TYPE_CHECKING:
    from app.services.user import UserService # Só importa para fins de "IDE"
    
class AuthService:
  def __init__(self, session: Session):
    self.password_hash = PasswordHash.recommended()
    self._db = session
  
  def authenticate(self, credentials: Login, user_service: "UserService") -> json:
    login_data = credentials.model_dump()
    
    if not (user := user_service.get_user_by_email(login_data["email"])):
      raise UserDoesNotFound("This user was not found in the database.")
    
    is_valid = self.password_hash.verify(login_data["password"], user.password)
    
    if not is_valid:
      # Erro de credenciais costuma ser 401 Unauthorized
      raise HTTPException(status_code=401, detail="Invalid password")
    payload = {"email":login_data["email"],"full_name":f"{user.first_name} {user.last_name}"}
    access_token = self.create_access_token(payload)
    
    return {
      "access_token": access_token,
      "token_type": "bearer"
    }

  def hash_password(self, password:str) -> str:
    return self.password_hash.hash(password)
  
  def create_access_token(self, data: dict, expires_delta: timedelta | None = None) -> None:
    to_encode = data.copy()
    if expires_delta:
      expire = datetime.now(timezone.utc) + expires_delta
    else:
      expire = datetime.now(timezone.utc) + timedelta(minutes=15)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt
  
   
  
  