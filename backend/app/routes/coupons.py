from fastapi import APIRouter, HTTPException

router = APIRouter()

# Simulación de una lista de cupones (reemplazar con base de datos)
coupons_db = [
    {"id": 1, "title": "Descuento en Producto A", "store": "Tienda X", "discount": 20},
    {"id": 2, "title": "Oferta especial en Producto B", "store": "Tienda Y", "discount": 15},
    # Otros cupones...
]

# Obtener todos los cupones
@router.get("/coupons/", tags=["coupons"])
async def get_coupons():
    return coupons_db

# Obtener un cupón por su ID
@router.get("/coupons/{coupon_id}", tags=["coupons"])
async def get_coupon_by_id(coupon_id: int):
    for coupon in coupons_db:
        if coupon["id"] == coupon_id:
            return coupon
    raise HTTPException(status_code=404, detail="Cupón no encontrado")

# Crear un nuevo cupón
@router.post("/coupons/", tags=["coupons"])
async def create_coupon(title: str, store: str, discount: float):
    new_coupon = {"id": len(coupons_db) + 1, "title": title, "store": store, "discount": discount}
    coupons_db.append(new_coupon)
    return new_coupon

# Actualizar los datos de un cupón por su ID
@router.put("/coupons/{coupon_id}", tags=["coupons"])
async def update_coupon(coupon_id: int, title: str, store: str, discount: float):
    for coupon in coupons_db:
        if coupon["id"] == coupon_id:
            coupon["title"] = title
            coupon["store"] = store
            coupon["discount"] = discount
            return coupon
    raise HTTPException(status_code=404, detail="Cupón no encontrado")

# Eliminar un cupón por su ID
@router.delete("/coupons/{coupon_id}", tags=["coupons"])
async def delete_coupon(coupon_id: int):
    for i, coupon in enumerate(coupons_db):
        if coupon["id"] == coupon_id:
            del coupons_db[i]
            return {"message": "Cupón eliminado"}
    raise HTTPException(status_code=404, detail="Cupón no encontrado")
