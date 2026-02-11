# o model define a conexao com o banco de dados
from api.db import Base 
from sqlalchemy import String, Integer, Boolean
from sqlalchemy.orm import Mapped, mapped_column

class User(Base):
  __tablename__ = "tb_users"
  