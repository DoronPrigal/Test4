from fastapi import APIRouter, Request

from fruityvice_client import get_all_fruits
from models import Fruit

router = APIRouter()


@router.get("/api/search/{text}", response_model=list[Fruit])
def search_fruits(text: str, request: Request):
    fruits = []
    for fruit in get_all_fruits():
        if text.lower() in fruit["name"].lower():
            fruits.append(fruit)

    request.state.total_results = len(fruits)
    return fruits
