This proyect is about cupons

PROCEDIMIENTOS DE INSTALACIÓN:

Instalación de dependencias del python, backend:

clone repositorio
cd backend
python -m venv venv
venv\scripts\activate
pip install -r requirements.txt
modificar según tus credenciales el archivo .env (entorno virtual)

Instalación de dependencias del frontend:

npm install

Inicializar proyecto:

Iniciar el Backend (FastAPI):
Desde el directorio raíz del proyecto (donde se encuentra el archivo main.py), ejecuta:
uvicorn main:app --reload

Iniciar el Frontend (Vite con React):
Desde el directorio frontend, ejecuta:
Comando: npm run dev
