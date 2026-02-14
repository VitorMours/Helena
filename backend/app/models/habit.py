from sqlalchemy import DateTime, String, Integer, Boolean, UUID, func, ForeignKey
from app.db import Base 
from sqlalchemy.orm import mapped_column, Mapped, relationship
import uuid
from datetime import datetime

class Habit(Base):
    __tablename__ = "tb_habits"

    id: Mapped[uuid.UUID] = mapped_column(UUID, primary_key = True, index=True)
    name: Mapped[str] = mapped_column(String(50), nullable=False)
    content: Mapped[str] = mapped_column(String(125), nullable=False)
    conclusion: Mapped[bool] = mapped_column(Boolean, default=True)
    created_at: Mapped[datetime] = mapped_column(DateTime, default=func.now()) 
    updated_at: Mapped[datetime] = mapped_column(DateTime, default=func.now(), onupdate=func.now())
    user_id: Mapped[uuid.UUID] = mapped_column(UUID, ForeignKey("tb_users.id"))
    user: Mapped["User"] = relationship("User", back_populates="habits")
    