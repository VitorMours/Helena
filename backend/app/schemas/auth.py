from pydantic import BaseModel 

class Token(BaseModel):
  access_token: str 
  token_type: str

class TokenData(BaseModel):
  pass

class Login(BaseModel):
  email: str
  password: str
  
  
class Signin(BaseModel):
  first_name: str
  last_name: str
  email: str 
  password: str