from pydantic import BaseModel 
from datetime import datetime 
import uuid
from app.models.user import User 

class HabitRead(BaseModel):
    id: uuid.UUID
    name: str
    content: str
    conclusion: bool
    created_at: datetime 
    updated_at: datetime
    user: User
    
class HabitCreate(BaseModel): 
    name: str
    content: str
    conclusion: bool
    user: User
