from ..db import Base 
from sqlalchemy import String, Boolean, UUID, Column 
import uuid 
import enum

class Permissions(enum.Enum):
    user = 1
    admin = 2
    owner = 3
    moderator = 5


class User(Base):
    __tablename__ = "tb_users"
    
    id = Column() 
    first_name = Column()
    last_name = Column()  
    email = Column()
    password = Column() 
    created_at = Column() 
    updated_at = Column()
    last_login = Column() 

