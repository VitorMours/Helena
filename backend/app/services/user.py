from typing import List
from sqlalchemy.orm import Session 
from app.models import User

class UserService:
  def __init__(self, session: Session) -> None:
    self._db = session
    
  def get_all_users(self) -> List[User]:
    return self._db.query(User).all()
    