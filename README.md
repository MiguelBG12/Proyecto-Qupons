# PROYECTO QUPONS

## **Concepto:** 
**QUPONS** es una plataforma dedicada a la generación de cupones de descuento digitales, con el objetivo de proporcionar a los usuarios un espacio en línea donde puedan acceder fácilmente a las ofertas más destacadas de las tiendas más reconocidas en la ciudad.

## **Beneficiarios del Proyecto:**
**QUPONS** se enfoca en beneficiar tanto a las tiendas (grandes empresas y emprendedores que ofrecen productos y servicios) como a los usuarios con intenciones de compra.

### **Tiendas:**
Proporcionamos a las tiendas un espacio exclusivo en Internet para exhibir sus mejores ofertas. Cada visitante a la plataforma QUPONS podrá identificar de manera rápida que solo se muestran promociones, facilitando así su decisión de compra.

### **Usuarios:**
En **QUPONS**, los usuarios encuentran un recurso valioso al buscar productos o servicios, ya que concentramos las mejores ofertas de las tiendas en diversas categorías. Brindamos un lugar donde la búsqueda de ofertas se simplifica, permitiendo a los usuarios optimizar su presupuesto.

## **Problema Resuelto:**
El proyecto aborda la dificultad que enfrentan los usuarios al intentar encontrar ofertas navegando por Internet. La solución es **QUPONS**, una plataforma especializada que centraliza ofertas de todas las categorías, proporcionando una respuesta eficaz a este problema común.

A continuación tenemos los pasos para instalar y ejecutar el proyecto:

# 1. Clona este repositorio en tu computadora**


    # Comando
    git clone <URL_del_repositorio>


# 2. Instalar Python 
**2.1 Descargalo desde la pagina oficial: (https://www.python.org/downloads/)**

# 3. Base de datos MySQL:

**3.1 Instalación de MySQL en Windows:**
- Descarga el instalador MSI de MySQL desde el sitio oficial: MySQL Community 	Downloads.
- Ejecuta el instalador descargado y sigue las instrucciones del asistente.
- Durante la instalación, se te pedirá configurar la contraseña del usuario root de MySQL.
- Agrega la ruta del directorio binario de MySQL al sistema a la variable de entorno PATH para facilitar el uso de comandos desde la terminal.

**3.2 Instalación de MySQL en Linux:**


    # Actualiza el índice de paquetes
    sudo apt update
    
    # Instala el servidor MySQL
    sudo apt install mysql-server
    
    # Inicia el servicio MySQL
    sudo service mysql start
    
    # Configura la contraseña del usuario root de MySQL
     sudo mysql_secure_installation


**3.3 Instalación de MySQL en MacOS:**

- Instala Homebrew si aún no lo tienes:


    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Instala MySQL con Homebrew:
        brew install mysql
        
        # Inicia el servicio MySQL
        brew services start mysql
        
        # Configura la contraseña del usuario root de MySQL
        mysql_secure_installation


- Estos comandos deberían proporcionarte una instalación básica de MySQL en cada sistema operativo. Asegúrate de consultar la documentación oficial de MySQL para obtener información adicional sobre la configuración y el uso del servidor MySQL: MySQL Documentation.

**3.4 Coloca el usuario y contraseña de MySQL en el archivo "backend/.env" para el correcto funcionamiento de la aplicación.**

**3.5 Iniciar sesion en MySQL desde la terminal:**


        sudo mysql -u <Coloca tu usuario> -p
        Enter password: <Coloca tu contraseña>
		
**3.6 Ver lista usuarios existentes en MySQL**

        mysql> SELECT user FROM mysql.user;

**3.7 Privilegios de usuario**

        GRANT ALL PRIVILEGES ON *.* TO 'nombre_usuario'@'localhost';

**3.8 Crear la base de datos:**

- En la sesion de MySQL en la terminal, copia el codigo de "database/scripts/database_full.sql" esto creará la base de datos "db_webcuponera" y sus tablas.

- Copia el codigo de "database/scripts/procedures.sql" esto creara los procedimientos almacenados que usa la aplicación.

# 4. Backend:

**4.1 Crear el entorno virtual en WINDOWS:**

        # Instalar virtualenv desde la terminal
        pip install virtualenv

        # Navega al directorio
        > cd Proyecto-qupons/backend

        # Crea el entorno virtual
        > py -3 -m venv venv

        # Activa el entorno virtual
        > venv\Scripts\activate

        # Instala las dependencias
        > pip install -r requirements.txt

**4.2 Crear el entorno virtual en LINUX:**

        # Instalar virtualenv desde la terminal
        $ pip install virtualenv

        # Navega al directorio
        $ cd Proyecto-qupons/backend

        # Crea el entorno virtual
        $ python3 -m venv venv

        # Activa el entorno virtual
        $ source venv/bin/activate

        # Instala las dependencias
        $ pip install -r requirements.txt

**4.3 Crear el entorno virtual en MacOS:**

        # Instalar virtualenv desde la terminal
        $ pip install virtualenv

        # Navega al directorio
        $ cd Proyecto-qupons/backend

        # Crea el entorno virtual
        $ python3 -m venv venv

        # Activa el entorno virtual
        $ source venv/bin/activate

        # Instala las dependencias
        $ pip install -r requirements.txt

**4.4 Iniciar el Backend (FastAPI):**

        # Raíz: "backend/"
        uvicorn app.main:app --reload

# 5. Frontend:

**5.1 Desde la terrminal navega hasta "Proyecto-Qupons/frontend/src"**

        # Instala las dependencias del archivo "package.json"
        npm install

**5.2 Ejecución del frontend "Proyecto-Qupons/frontend/src"**

        npm run dev