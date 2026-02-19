import pytest 
import importlib 
import inspect  
from pydantic import BaseModel

class TestHabitSchema:
  def test_if_can_import_the_module(self) -> None:
    try:
      from app.schemas import habit
      assert habit is not None
      
    except ImportError:
      raise ImportError("Was not possible to import the habit schema module")
    
    
  def test_if_habit_schema_have_correct_contracts(self) -> None:
    try:
      from app.schemas.habit import HabitCreate, HabitRead, HabitUpdate
      assert HabitCreate is not None
      assert HabitRead is not None
      assert HabitUpdate is not None
    
      assert inspect.isclass(HabitCreate)
      assert inspect.isclass(HabitRead)
      assert inspect.isclass(HabitUpdate)
    except ImportError:
      raise ImportError("Was not possible to import the schemas contracts")
    
    
  def test_if_schemas_is_sub_class_from_correct_super_class(self) -> None:
    try:
      from app.schemas.habit import HabitCreate, HabitRead, HabitUpdate
      assert issubclass(HabitCreate, BaseModel)
      assert issubclass(HabitRead, BaseModel)
      assert issubclass(HabitUpdate, BaseModel)
    except ImportError:
      raise ImportError("Was not possible to import the classes to test the superclass")
    
  def test_if_habit_schemas_have_the_correct_fields(self) -> None:
    habit_create_fields = {"name","content","conclusion","user_id"}
    habit_read_fields = {"id","name","content","conclusion","created_at","updated_at","user"}
    habit_update_fields = {"name","content","conclusion","user_id"}
    module = importlib.import_module("app.schemas.habit")
    
    create_fields = module.HabitCreate.model_fields.keys()
    read_fields = module.HabitRead.model_fields.keys()
    update_fields = module.HabitUpdate.model_fields.keys()
    
    assert set(create_fields) == habit_create_fields 
    assert set(read_fields) == habit_read_fields 
    assert set(update_fields) == habit_update_fields 
    
  def test_if_habit_create_schema_have_correct_field_types(self) -> None:
    expected_fields_types = {"str","str","bool","UUID"}
    module = importlib.import_module("app.schemas.habit")
    field_types = {
      field.annotation.__name__ for field in module.HabitCreate.model_fields.values()
    }    
    assert field_types == expected_fields_types

  def test_if_habit_read_schema_have_correct_field_types(self) -> None:
    expected_fields_types = {"UUID","str","str","bool","datetime","datetime","UserRead"}
    module = importlib.import_module("app.schemas.habit")
    field_types = {
      field.annotation.__name__ for field in module.HabitRead.model_fields.values()
    }
    assert field_types == expected_fields_types
    
    


