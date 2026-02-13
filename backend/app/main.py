from fastapi import FastAPI 
from app.core.config import config
from app.core.logging import setup_logging
from app.api.v1.users import router as user_router
from app.db import create_tables

setup_logging()
create_tables()

app = FastAPI(title = config.app_name)


app.include_router(user_router)