from fastapi import FastAPI 
from fastapi.middleware.cors import CORSMiddleware 


app = FastAPI()


@app.get("/")
async def healthcheck():
    return {"status":"ok"}