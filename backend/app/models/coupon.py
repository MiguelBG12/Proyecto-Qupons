from pydantic import BaseModel

class Coupon(BaseModel):
    id: int
    title: str
    store: str
    discount: float