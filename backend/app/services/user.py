from typing import List
from sqlalchemy.orm import Session 
from app.models.user import User
from app.schemas.user import UserCreate, UserRead, UserUpdate
import uuid

class UserService:
  def __init__(self, session: Session) -> None:
    self._db = session
    
  def get_all_users(self) -> List[User]:
    return self._db.query(User).all()
  
  def get_user_by_id(self, user_id: int) -> User:
    return self._db.query(User).filter(User.id == user_id).first()    
  
  def get_user_by_email(self, email: str) -> User:
    return self._db.query(User).filter(User.email == email).first()
  
  def create_user(self, user: UserCreate) -> User:
    user_data = user.model_dump()
    new_user = User(**user_data)
    self._db.add(new_user)
    self._db.commit()
    self._db.refresh(new_user)
    return new_user
  

  def update_user(self, user: UserUpdate) -> User:
    pass 


  def delete_user(self, uuid: uuid.UUID) -> None:
    pass