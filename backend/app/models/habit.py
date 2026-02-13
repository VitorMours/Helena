from sqlalchemy import String, Integer, Boolean, UUID 
from app.db import Base 
from sqlalchemy.orm import mapped_column, Mapped
import uuid


class Habit(Base):
    __tablename__ = "tb_habits"

    id: Mapped[uuid.UUID] = mapped_column(UUID, primary_key = True, index=True)
    name: Mapped[str] = mapped_column(String)
    content
    conclusion
    #owner