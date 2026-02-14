# O schema serve para devifir os dados que transitam
from datetime import datetime
from pydantic import BaseModel 
import uuid

class UserCreate(BaseModel):
  first_name: str
  last_name: str
  email: str
  password: str
    
class UserRead(BaseModel):
  id: uuid.UUID 
  first_name: str
  last_name: str
  email: str
  is_active: bool
  created_at: datetime 
  updated_at: datetime
  
class UserUpdate(BaseModel):
  first_name: str
  last_name: str
  email: str
<<<<<<< HEAD
  password: str 
  is_active: bool
  
  
=======
  password: str
  is_active: bool
>>>>>>> 01b2d26929458167f9c266d208b9fd2e3c8e3bb7
  