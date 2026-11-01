import requests
from fastapi import HTTPException

FRUITS_URL = "https://www.fruityvice.com/api/fruit/all"


def get_all_fruits():
    try:
        response = requests.get(FRUITS_URL, timeout=10)
        response.raise_for_status()
        return response.json()
    except requests.RequestException:
        raise HTTPException(status_code=502, detail="Fruityvice API is unavailable")
