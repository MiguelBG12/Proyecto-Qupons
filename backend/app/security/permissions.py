from enum import Enum
from fastapi import Depends, HTTPException, status
from app.security.auth_user import decode_token

class UserRole(str, Enum):
    admin = "admin"
    user = "user"

def get_current_user(token: str = Depends(decode_token)):
    if token.get("role") != UserRole.admin:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="You do not have the necessary permissions",
        )
    return token
