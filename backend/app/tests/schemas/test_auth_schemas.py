import pytest 
import importlib 
import inspect 
from pydantic import BaseModel 

class TestAuthSchema:
    """Class to test if the auth schemas works"""

    def test_if_can_import_the_auth_schemas_module(self) -> None:
        try:
            from app.schemas import auth 
            assert True 
            assert auth is not None
        except ImportError:
            raise ImportError("Was not possible to import the auth schemas module ")


    def test_if_can_import_the_schemas_from_the_module(self) -> None:
        try:
            from app.schemas.auth import Login, Token, TokenData

            assert True 
            assert inspect.isclass(Login)
            assert inspect.isclass(Token)
            assert inspect.isclass(TokenData)
        except ImportError: 
            raise ImportError("Was not possible to import the auth classes in the module")


    def test_if_schemas_have_correct_superclass(self) -> None:
        try:
            from app.schemas.auth import Login, Token, TokenData 

            assert issubclass(Login, BaseModel)
            assert issubclass(Token, BaseModel)
            assert issubclass(TokenData, BaseModel)
        except ImportError as e:     
            raise ImportError(f"Was not possible to import the {e} schema")


    def test_if_login_schema_have_correct_fields_and_types(self) -> None:
        
        login_schema_fields = {"email", "password"}
        login_schema_fields_types = {"str", "str"}

        module = importlib.import_module("app.schemas.auth")
        fields = module.Login.model_fields.keys()
        assert set(fields) == login_schema_fields
        field_types = {
            field.annotation.__name__ for field in module.Login.model_fields.values()
        }
        assert field_types == login_schema_fields_types


    def test_if_token_schema_have_correct_fields_and_types(self) -> None:
        
        token_schema_fields = {"access_token", "token_type"}
        token_schema_fields_types = {"str", "str"} 
        
        module = importlib.import_module("app.schemas.auth")
        fields = module.Token.model_fields.keys()
        assert set(fields) == token_schema_fields 
        field_types = {
            field.annotation.__name__ for field in module.Token.model_fields.values()
        }
        assert field_types == token_schema_fields_types
