from fastapi import APIRouter, Path, Request

from fruityvice_client import get_all_fruits
from models import Fruit

router = APIRouter()


@router.get("/api/calories/{max}", response_model=list[Fruit])
def get_fruits_by_calories(request: Request, max: int = Path(ge=0)):
    fruits = []
    for fruit in get_all_fruits():
        # הקלוריות נמצאות בתוך האובייקט הפנימי nutritions
        if fruit["nutritions"]["calories"] <= max:
            fruits.append(fruit)

    request.state.total_results = len(fruits)
    return fruits
