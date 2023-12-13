from fastapi import APIRouter, HTTPException

router = APIRouter()

# Simulación de una lista de tiendas (reemplazar con base de datos)
stores_db = [
    {"id": 1, "name": "Tienda A", "location": "Ciudad X"},
    {"id": 2, "name": "Tienda B", "location": "Ciudad Y"},
    # Otros registros de tiendas...
]

# Obtener todas las tiendas
@router.get("/stores/", tags=["stores"])
async def get_stores():
    return stores_db

# Obtener una tienda por su ID
@router.get("/stores/{store_id}", tags=["stores"])
async def get_store_by_id(store_id: int):
    for store in stores_db:
        if store["id"] == store_id:
            return store
    raise HTTPException(status_code=404, detail="Tienda no encontrada")

# Crear una nueva tienda
@router.post("/stores/", tags=["stores"])
async def create_store(name: str, location: str):
    new_store = {"id": len(stores_db) + 1, "name": name, "location": location}
    stores_db.append(new_store)
    return new_store

# Actualizar los datos de una tienda por su ID
@router.put("/stores/{store_id}", tags=["stores"])
async def update_store(store_id: int, name: str, location: str):
    for store in stores_db:
        if store["id"] == store_id:
            store["name"] = name
            store["location"] = location
            return store
    raise HTTPException(status_code=404, detail="Tienda no encontrada")

# Eliminar una tienda por su ID
@router.delete("/stores/{store_id}", tags=["stores"])
async def delete_store(store_id: int):
    for i, store in enumerate(stores_db):
        if store["id"] == store_id:
            del stores_db[i]
            return {"message": "Tienda eliminada"}
    raise HTTPException(status_code=404, detail="Tienda no encontrada")
