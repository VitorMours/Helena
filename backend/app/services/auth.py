from sqlalchemy.orm import Session 
from app.models import User

class UserService:
  def __init__(self, session: Session) -> None:
    self._db = session