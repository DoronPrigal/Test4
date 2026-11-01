from fastapi import FastAPI

from logging_middleware import log_requests
from routes import fruits

app = FastAPI(title="Fruits REST API")

app.middleware("http")(log_requests)

app.include_router(fruits.router)
