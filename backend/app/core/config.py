from dotenv import load_dotenv 
from pydantic_settings import BaseSettings 





class Config(BaseSettings):
  app_name: str = "helena backend"
  debug: bool = True
  db_user: str = "helena_user"
  db_password: str = "helena_password"
  db_host: str = "localhost"
  db_name: str = "helena_db"
  
  @property 
  def debug_db_url(self):
    return f"sqlite:///{self.db_name}.sqlite3"
  
  # TODO: Fazer propertu para pegar url do banco de dados
  
config = Config()