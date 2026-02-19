class UserGeneralException(Exception):
  def __init__(self, name: str):
    self.name = name
    
class UserAlreadyExists(UserGeneralException):
  pass
    
class UserDoesNotExists(UserGeneralException):
  pass

class IncorrectUserCredentials(UserGeneralException):
  pass
