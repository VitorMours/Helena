from pydantic import BaseModel
from datetime import datetime
import uuid
from app.schemas.user import UserRead

class HabitRead(BaseModel):
    model_config = {"from_attributes": True}
    id: uuid.UUID
    name: str
    content: str
    conclusion: bool
    created_at: datetime
    updated_at: datetime
    user: UserRead

class HabitCreate(BaseModel):
    name: str
    content: str
    conclusion: bool
    user_id: uuid.UUID


class HabitUpdate(HabitCreate):
    pass