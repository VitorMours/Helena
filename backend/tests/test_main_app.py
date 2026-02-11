from fastapi import FastAPI
import pytest 
import importlib 
import inspect 

class TestApp:
  def test_if_app_exists(self) -> None:
    try:
      from app.main import app
    except ImportError: 
      raise ImportError("Was not possible to impor the app object")
    
  def test_if_app_instance_its_a_fastapi_server(self) -> None:
    try:
      from app.main import app 
      assert type(app) == FastAPI
    except ImportError:  
      raise ImportError("Was not possible to test the app type in tests")
    