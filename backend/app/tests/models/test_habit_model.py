import pytest 
import importlib
import inspect 
from app.db import Base
from app.models.user import User
from typing import get_type_hints
import uuid
from datetime import datetime
from sqlalchemy import inspect as sa_inspect

class TestHabitModel:
  """Teste para os models de habito"""
  
  def test_if_can_import_the_habit_model_module(self) -> None:
    try:
      from app.models.habit import Habit
      assert Habit is not None 
      assert inspect.isclass(Habit)
    except ImportError:
      raise ImportError("Was not possible to import the habit model")
    
  def test_if_habit_model_have_correct_superclass(self) -> None:
    try:
      from app.models.habit import Habit 
      assert issubclass(Habit, Base)
    except ImportError:
      raise ImportError("Was not possible to check habit superclass")
    
  def test_if_models_have_correct_tablename_fields(self) -> None:
    module = importlib.import_module("app.models.habit")
    class_ = module.Habit
    assert class_.__tablename__ == "tb_habits"
    
  def test_if_habit_model_have_correct_fields(self) -> None:
    expected_fields = {"id","name","content","conclusion","created_at","updated_at","user_id","user"}
    module = importlib.import_module("app.models.habit")
    fields = set(module.Habit.__annotations__.keys())
    assert fields == expected_fields
    
  def test_if_habit_model_have_correct_types(self) -> None:
    module = importlib.import_module("app.models.habit")
    annotations = module.Habit.__annotations__
    
    assert "Mapped" in str(annotations["id"])
    assert "UUID" in str(annotations["id"])
    
    assert "Mapped" in str(annotations["name"])
    assert "str" in str(annotations["name"])
    
    assert "Mapped" in str(annotations["content"])
    assert "str" in str(annotations["content"])
    
    assert "Mapped" in str(annotations["conclusion"])
    assert "bool" in str(annotations["conclusion"])
    
    assert "Mapped" in str(annotations["created_at"])
    assert "datetime" in str(annotations["created_at"])
    
    assert "Mapped" in str(annotations["updated_at"])
    assert "datetime" in str(annotations["updated_at"])
    
    assert "Mapped" in str(annotations["user_id"])
    assert "UUID" in str(annotations["user_id"])
    
  def test_if_all_fields_have_correct_constraints(self) -> None:
    pass 
    
  def test_if_can_instantiate_the_habit_model(self) -> None:
    pass