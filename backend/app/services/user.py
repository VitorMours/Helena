from typing import List
from sqlalchemy.orm import Session 
from app.models.user import User
from app.schemas.user import UserCreate, UserRead, UserUpdate
from app.exceptions.user import UserAlreadyExists, UserDoesNotExists
import uuid

class UserService:
  def __init__(self, session: Session) -> None:
    self._db = session
    
  def get_all_users(self) -> List[User]:
    return self._db.query(User).all()
  
  def get_user_by_id(self, user_id: int) -> User:
    if user_searched := self._db.query(User).filter(User.id == user_id).first():
      return user_searched
    else:
      raise UserDoesNotExists("Does not exists a user with this id in the database.")    
  
  def get_user_by_email(self, email: str) -> User:
    if user_searched := self._db.query(User).filter(User.email == email).first():
      return user_searched 
    else:
      raise UserDoesNotExists("Does not exists a user with this email in the database.")
      
  def create_user(self, user: UserCreate) -> User:
    user_data = user.model_dump()
    check_user = self._db.query(User).filter(User.email == user_data["email"]).first()

    if check_user:
      print(check_user)
      raise UserAlreadyExists("User already exists in the database, try to login.")
    else:
      new_user = User(**user_data)
      self._db.add(new_user)
      self._db.commit()
      self._db.refresh(new_user)
      return new_user
  
  def update_user(self, user_id: uuid, user: UserUpdate) -> User | None:
    if not (searched_user := self.get_user_by_id(user_id)):
      raise UserDoesNotExists("Does not exists this user in the database.")

    # TODO: A senha nao vai ser mudada aqui, entao verificar se a senha ta igual se nao, levantar o erro de credenciais invalidas / erradas

    user_data = user.model_dump(exclude_unset=True)
    
    for k, v in user_data.items():
      setattr(searched_user, k, v)

    self._db.add(searched_user)
    self._db.commit()
    self._db.refresh(searched_user)
    
    return searched_user

  def delete_user(self, user_id: uuid) -> User | None:
    """Nunca sera feito o delete verdadeiro, sendo feito um soft_delete"""
    searched_user = self.get_user_by_id(user_id)
    
    if not searched_user:
      return None
    
    setattr(searched_user, "is_active", False)

    self._db.add(searched_user)
    self._db.commit()
    self._db.refresh(searched_user)
    
    return searched_user
