import pytest 
import importlib 
import inspect 
from pydantic import BaseModel 

class TestUserSchema:
    """Testes dos schemas de usuario"""

    def test_if_user_schema_classes_exists(self) -> None:
        """Test if user classes for schemas actually exists"""
        try:
            from app.schemas.user import UserCreate, UserRead, UserUpdate
            assert UserCreate is not None
            assert UserRead is not None
            assert UserUpdate is not None
            assert inspect.isclass(UserCreate)
            assert inspect.isclass(UserRead)
            assert inspect.isclass(UserUpdate)

        except ImportError:
            raise ImportError("Was not possible to import the user schema from the module")

    def test_if_user_schema_classes_super_classes_are_correct(self) -> None:
        """Test if the classes have the correct inherantece from superclass"""
        try: 
            from app.schemas.user import UserCreate, UserRead, UserUpdate 
            assert issubclass(UserCreate, BaseModel)
            assert issubclass(UserRead, BaseModel)
            assert issubclass(UserUpdate, BaseModel)
        except ImportError:
            raise ImportError("Was not possible to import the user schemas classes")

    def test_if_user_create_schema_have_correct_fields_and_correct_types(self) -> None:
        """Test if the class to create users in the database have the correct fields types"""
        module = importlib.import_module("app.schemas.user")
        class_ = module.UserCreate
    
