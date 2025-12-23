from fastapi import APIRouter 

router = APIRouter(prefix="/users")

@router.get("/")
async def get_all_users():
    pass 


@router.get("/{id}")
async def get_user_by_id(id: int):
    pass