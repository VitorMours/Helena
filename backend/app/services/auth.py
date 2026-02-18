import jwt 
from pwdlib import PasswordHash

class AuthService:
  def __init__(self):
    self.password_hash = PasswordHash.recommended()
  
  def verify_password(self, password: str, hashed_password: str) -> bool:
    return self.password_hash.verify(password, hashed_password)
  
  def hash_password(self, password:str) -> str:
    return self.password_hash.hash(password)
  
  def verify_user(self) -> None:
    pass
  
   
  
  