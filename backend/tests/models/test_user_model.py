import pytest 
import importlib
import inspect 
from app.db import Base
from app.models.user import User
from typing import get_type_hints
import uuid
from datetime import datetime
from sqlalchemy import inspect as sa_inspect


class TestUserModel:
  """Testes para o modelo de usuário"""
  
  def test_if_user_model_exists(self) -> None:
    """Testa se o modelo User pode ser importado"""
    try: 
      assert User is not None
      assert inspect.isclass(User)
    except ImportError:
      raise ImportError("Was not possible to import the User Model")
    
  def test_if_user_model_is_correct_sub_class(self) -> None:
    """Testa se User é subclasse de Base"""
    assert inspect.isclass(User) and issubclass(User, Base)
    
  def test_user_model_tablename(self) -> None:
    """Testa se a tabela tem o nome correto"""
    assert User.__tablename__ == "tb_users"
    
  def test_if_user_model_have_correct_fields(self) -> None:
    """Testa se o modelo possui todos os campos necessários"""
    expected_fields = {"id", "first_name", "last_name", "email", "password", "is_active", "created_at", "updated_at"}
    class_fields = set(User.__annotations__.keys())
    assert expected_fields == class_fields
    
    
  def test_if_user_model_have_correct_field_types(self) -> None:
    """Testa se os campos têm os tipos corretos"""
    annotations = User.__annotations__
    
    assert "Mapped" in str(annotations["id"])
    assert "UUID" in str(annotations["id"])
    
    assert "Mapped" in str(annotations["first_name"])
    assert "str" in str(annotations["first_name"])
    
    assert "Mapped" in str(annotations["last_name"])
    assert "str" in str(annotations["last_name"])
    
    assert "Mapped" in str(annotations["email"])
    assert "str" in str(annotations["email"])
    
    assert "Mapped" in str(annotations["password"])
    assert "str" in str(annotations["password"])
    
    assert "Mapped" in str(annotations["is_active"])
    assert "bool" in str(annotations["is_active"])
    
    assert "Mapped" in str(annotations["created_at"])
    assert "datetime" in str(annotations["created_at"])
    
    assert "Mapped" in str(annotations["updated_at"])
    assert "datetime" in str(annotations["updated_at"])
    
    
  def test_if_user_model_fields_have_correct_constraints(self) -> None:
    """Testa se os campos possuem as restrições corretas"""
    mapper = sa_inspect(User)
    columns = mapper.columns
    
    # Teste ID
    assert columns["id"].primary_key is True
    assert columns["id"].index is True
    
    # Teste first_name
    assert columns["first_name"].nullable is False
    assert columns["first_name"].type.length == 50
    
    # Teste last_name
    assert columns["last_name"].nullable is False
    assert columns["last_name"].type.length == 50
    
    # Teste email
    assert columns["email"].nullable is False
    assert columns["email"].index is True
    assert columns["email"].unique is True
    
    # Teste password
    assert columns["password"].nullable is False
    
    # Teste is_active
    assert columns["is_active"].nullable is False
    assert columns["is_active"].default is not None
    
    # Teste created_at
    assert columns["created_at"].nullable is False
    
    # Teste updated_at
    assert columns["updated_at"].nullable is False
    
  def test_user_model_id_default_value(self) -> None:
    """Testa se o ID possui um valor padrão gerado corretamente"""
    mapper = sa_inspect(User)
    id_column = mapper.columns["id"]
    assert id_column.default is not None
    
  def test_user_model_is_active_default_value(self) -> None:
    """Testa se is_active tem o valor padrão True"""
    mapper = sa_inspect(User)
    is_active_column = mapper.columns["is_active"]
    assert is_active_column.default is not None
    
  def test_user_model_created_at_default_value(self) -> None:
    """Testa se created_at tem um valor padrão"""
    mapper = sa_inspect(User)
    created_at_column = mapper.columns["created_at"]
    assert created_at_column.default is not None
    
  def test_user_model_updated_at_has_onupdate(self) -> None:
    """Testa se updated_at possui onupdate configurado"""
    mapper = sa_inspect(User)
    updated_at_column = mapper.columns["updated_at"]
    assert updated_at_column.default is not None
    assert updated_at_column.onupdate is not None
    
  def test_user_model_instantiation(self) -> None:
    """Testa a instanciação básica do modelo"""
    user = User(
      id=uuid.uuid4(),
      first_name="João",
      last_name="Silva",
      email="joao@example.com",
      password="hashed_password",
      is_active=True,
      created_at=datetime.now(),
      updated_at=datetime.now()
    )
    
    assert user.first_name == "João"
    assert user.last_name == "Silva"
    assert user.email == "joao@example.com"
    assert user.password == "hashed_password"
    assert user.is_active is True
    assert isinstance(user.id, uuid.UUID)
    assert isinstance(user.created_at, datetime)
    assert isinstance(user.updated_at, datetime)
    
  def test_user_model_has_all_required_columns(self) -> None:
    """Testa se todas as colunas esperadas existem"""
    mapper = sa_inspect(User)
    expected_columns = {"id", "first_name", "last_name", "email", "password", "is_active", "created_at", "updated_at"}
    actual_columns = {col.name for col in mapper.columns}
    assert expected_columns == actual_columns