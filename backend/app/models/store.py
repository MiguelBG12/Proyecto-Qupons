from pydantic import BaseModel

class Store(BaseModel):
    id: int
    name: str
    location: str