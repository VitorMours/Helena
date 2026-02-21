import jwt 
from app.exceptions.user import UserDoesNotFound
from app.schemas.auth import Login
from pwdlib import PasswordHash
from sqlalchemy.orm import Session 
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from app.services.user import UserService # Só importa para fins de "IDE"
    
class AuthService:
  def __init__(self, session: Session):
    self.password_hash = PasswordHash.recommended()
    self._db = session
  
  def authenticate(self, credentials: Login, user_service: "UserService") -> bool:
    login_data = credentials.model_dump()
    
    if not (user := user_service.get_user_by_email(login_data["email"])):
      raise UserDoesNotFound("This user was not found in the database.")
    
    access_token = self.password_hash.verify(login_data["password"], user.password)
    return {
      "access_token": access_token,
      "token_type": "bearer"
    }

  def hash_password(self, password:str) -> str:
    return self.password_hash.hash(password)
  
  def verify_user(self) -> None:
    pass
  
   
  
  