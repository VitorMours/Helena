from typing import List 
from sqlalchemy import String, Boolean, Integer, DateTime, func, UUID, ForeignKey
from sqlalchemy.orm import mapped_column, Mapped, relationship 
from datetime import datetime 
from app.db import Base
import uuid

class FirstLogin(Base):
  __tablename__ == "first_login"
  
  id: Mapped[uuid.UUID] = mapped_column(UUID, primary_key=True, index=True, default=uuid.uuid4)
  user: Mapped[uuid.UUID] = relationship(UUID, ForeignKey("tb_users.id"))
  first_login: Mapped[bool] = mapped_column(Boolean, default=False)
  