from sqlalchemy import UUID, Integer, String, Boolean, DateTime
from app.models.user import User 
from sqlalchemy.orm import mapped_column, Mapped
from sqlalchemy import func
from app.db import Base 
import uuid
from datetime import datetime
class Habit(Base):
  id: Mapped[uuid.UUID] = mapped_column(UUID, primary_key=True, index=True, default=uuid.uuid4) 
  name: Mapped[str] = mapped_column(String(100), nullable=False)
  description: Mapped[str] = mapped_column(String(255), nullable=False)
  status: Mapped[bool] = mapped_column(Boolean, default=False)
  #owner 
  created_at: Mapped[datetime] = mapped_column(DateTime, default=func.now())
  updated_at: Mapped[datetime] = mapped_column(DateTime, default=func.now(), onupdate=func.now())
  