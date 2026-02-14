from fastapi.testclient import TestClient 
from app.main import app 
import importlib 
import inspect 

client = TestClient(app)

class TestUserEndpoint:
  def test_if_endpoint_exists(self) -> None:
    pass    