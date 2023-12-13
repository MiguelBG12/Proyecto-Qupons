from fastapi import APIRouter, HTTPException

router = APIRouter()

# Simulación de una lista de categorías (reemplazar con base de datos)
categories_db = [
    {"id": 1, "name": "Electrónicos"},
    {"id": 2, "name": "Ropa"},
    # Otras categorías...
]

# Obtener todas las categorías
@router.get("/categories/", tags=["categories"])
async def get_categories():
    return categories_db

# Obtener una categoría por su ID
@router.get("/categories/{category_id}", tags=["categories"])
async def get_category_by_id(category_id: int):
    for category in categories_db:
        if category["id"] == category_id:
            return category
    raise HTTPException(status_code=404, detail="Categoría no encontrada")

# Crear una nueva categoría
@router.post("/categories/", tags=["categories"])
async def create_category(name: str):
    new_category = {"id": len(categories_db) + 1, "name": name}
    categories_db.append(new_category)
    return new_category

# Actualizar los datos de una categoría por su ID
@router.put("/categories/{category_id}", tags=["categories"])
async def update_category(category_id: int, name: str):
    for category in categories_db:
        if category["id"] == category_id:
            category["name"] = name
            return category
    raise HTTPException(status_code=404, detail="Categoría no encontrada")

# Eliminar una categoría por su ID
@router.delete("/categories/{category_id}", tags=["categories"])
async def delete_category(category_id: int):
    for i, category in enumerate(categories_db):
        if category["id"] == category_id:
            del categories_db[i]
            return {"message": "Categoría eliminada"}
    raise HTTPException(status_code=404, detail="Categoría no encontrada")
