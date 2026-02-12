from sqlalchemy import create_engine
from sqlalchemy.orm import DeclarativeBase, sessionmaker
from app.core.config import config
from app.models import * 

engine = create_engine(config.debug_db_url, connect_args={"check_same_thread":True})
SessionLocal = sessionmaker(bind=engine, autoflush=False, autocommit=False)

class Base(DeclarativeBase):
    pass

def create_tables():
    Base.metadata.create_all(bind=engine)