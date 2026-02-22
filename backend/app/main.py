from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse 
from app.core.config import config
from app.core.logging import setup_logging
from app.api.v1.users import router as user_router
from app.api.v1.habits import router as habit_router
from app.api.v1.auth import router as auth_router
from app.db import create_tables
from app.exceptions.user import UserAlreadyExists, IncorrectUserCredentials, UserDoesNotFound

setup_logging()
create_tables()

app = FastAPI(title = config.app_name)
origins = ['*']
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.exception_handler(UserAlreadyExists)
async def user_already_exists_error(request: Request, exc: UserAlreadyExists):
  return JSONResponse(
    status_code = 409,
    content={
      "error":"UserAlreadyExistsError",
      "message":str(exc),
      "path":request.url.path
    }
  )
  
@app.exception_handler(IncorrectUserCredentials)
async def incorrect_user_crendetials_error(request: Request, exc: IncorrectUserCredentials):
  return JSONResponse(
    status_code = 400,
    content = {
      "error":"IncorrectUserCredentialsError",
      "message":str(exc),
      "path":request.url.path,
    }
  )

@app.exception_handler(UserDoesNotFound)
async def user_does_not_found(request: Request, exc: UserDoesNotFound):
  return JSONResponse(
    status_code=404,
    content = {
      "error":"UserDoesNotFound",
      "message":str(exc),
      "path":request.url.path
    }
  )



app.include_router(user_router)
app.include_router(habit_router)
app.include_router(auth_router)