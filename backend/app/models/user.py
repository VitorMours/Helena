from typing import List

from sqlalchemy import String, Integer, Boolean, UUID, DateTime, func
from sqlalchemy.orm import Mapped, mapped_column, relationship
import uuid
from datetime import datetime
from app.db import Base

class User(Base):
  __tablename__ = "tb_users"
  
  id: Mapped[uuid.UUID] = mapped_column(UUID, primary_key=True, index=True, default=uuid.uuid4)
  first_name: Mapped[str] = mapped_column(String(50), nullable=False)
  last_name: Mapped[str] = mapped_column(String(50), nullable=False)
  email: Mapped[str] = mapped_column(String, unique=True, index=True, nullable=False)
  password: Mapped[str] = mapped_column(String, nullable=False)
  is_active: Mapped[bool] = mapped_column(Boolean, default=True)
  created_at: Mapped[datetime] = mapped_column(DateTime, default=func.now()) 
  updated_at: Mapped[datetime] = mapped_column(DateTime, default=func.now(), onupdate=func.now())
  habits: Mapped[List["Habit"]] = relationship("Habit", back_populates="user")
  