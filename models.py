from pydantic import BaseModel, ConfigDict


class Nutritions(BaseModel):
    # שומרים גם שדות חדשים שה-API החיצוני עשוי להוסיף
    model_config = ConfigDict(extra="allow")

    calories: int
    fat: float
    sugar: float
    carbohydrates: float
    protein: float


class Fruit(BaseModel):
    model_config = ConfigDict(extra="allow")

    name: str
    id: int
    family: str
    order: str
    genus: str
    nutritions: Nutritions
