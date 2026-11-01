from fastapi import APIRouter, Request

from fruityvice_client import get_all_fruits
from models import Fruit

router = APIRouter()


@router.get("/api/fruits", response_model=list[Fruit])
def get_fruits(request: Request):
    fruits = get_all_fruits()
    request.state.total_results = len(fruits)
    return fruits
