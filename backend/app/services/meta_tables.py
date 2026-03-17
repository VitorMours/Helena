from sqlalchemy.orm import Session
from app.models.meta_tables import FirstLogin
from app.schemas.user import UserRead

class FirstLoginService:
  def __init__(self, session: Session) -> None:
    self._db = session
    
  def check_if_user_have_account(self, user: UserRead) -> None:
    return self._db.query(FirstLogin).filter(user.id == user).first()
  
  def check_if_user_have_done_first_login(self, user: UserRead) -> bool | ValueError:
    """Se o usuario tiver feito o primeiro login, nao vai passar pelo fluxo de iniciacao"""
    if (account_exists := self.check_if_user_have_account(user)):
      return account_exists.first_login
    else:
      raise ValueError("Nao existe nenhum usuario com conta criada, que tenha feito seu primeiro login dentro dessa base de dados")
    
  