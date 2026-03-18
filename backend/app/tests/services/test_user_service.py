import pytest 
import importlib 
import inspect 


class TestUserService:
    def test_if_user_service_exists(self) -> None:
        try:
            from app.services import user
            assert user is not None

        except ImportError:
            raise ImportError("Was not possible to import the user service")

    def test_if_can_import_the_service(self) -> None:
        try:
            from app.services.user import UserService
            assert UserService is not None
            assert inspect.isclass(UserService)
        except ImportError:
            raise ImportError("Was not possible to import the user service")