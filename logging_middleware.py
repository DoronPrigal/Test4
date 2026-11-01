from datetime import datetime

from fastapi import Request
from starlette.concurrency import run_in_threadpool

from database import save_log


async def log_requests(request: Request, call_next):
    # מתעדים רק בקשות ל-API, בלי Swagger
    if not request.url.path.startswith("/api"):
        return await call_next(request)

    created_at = datetime.now()
    response = await call_next(request)

    # ה-Route שומר כאן את מספר התוצאות. בבקשה שנכשלה הערך הוא 0
    total_results = getattr(request.state, "total_results", 0)
    await run_in_threadpool(
        save_log,
        request.method,
        request.url.path,
        total_results,
        request.client.host,
        created_at,
    )
    return response
