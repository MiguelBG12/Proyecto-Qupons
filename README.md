# PROYECTO QUPONS💲
![readme-imagen-2](https://github.com/MiguelBG12/Proyecto-Qupons/assets/135359331/8cb7748a-1bcb-4f26-a1d9-8d53e552ca13)

## **Concept:** 
**QUPONS** is a platform dedicated to the generation of digital discount coupons, with the aim of providing users with an online space where they can easily access the most outstanding offers from the most recognized stores in the city.

## **Project Beneficiaries:**
**QUPONS** It focuses on benefiting both stores (large companies and entrepreneurs that offer products and services) and users with purchase intentions.

### **Stores:**
We provide stores with an exclusive space on the Internet to showcase their best offers. Each visitor to the QUPONS platform will be able to quickly identify that only promotions are shown, thus facilitating their purchase decision.

### **Users:**
En **QUPONS**, Users find a valuable resource when searching for products or services, since we concentrate the best offers from stores in various categories. We provide a place where searching for deals is simplified, allowing users to optimize their budget.

## **Problem solved:**
The project addresses the difficulty that users face when trying to find deals while browsing the Internet. The solution is **QUPONS**, a specialized platform that centralizes offers from all categories, providing an effective answer to this common problem.

## **Structure of the Web Application**
![estructura-del-proyecto](https://github.com/MiguelBG12/Proyecto-Qupons/assets/135359331/02bda60d-aefb-4fcd-863b-8d521b66cc28)

Below we have the steps to install and run the project:

# 1. Clone this repository to your computer**


    # Command
    git clone <repository_URL>


# 2. Install Python 
**2.1 Download it from the official website: (https://www.python.org/downloads/)**

# 3. MySQL database:

**3.1 Installing MySQL on Windows:**
- Download the MySQL MSI installer from the official site: MySQL Community Downloads.
- Run the downloaded installer and follow the wizard instructions.
- During installation, you will be asked to set the MySQL root user password.
- Add the path of the MySQL binary directory to the system to the PATH environment variable to make it easier to use commands from the terminal.

**3.2 Installing MySQL on Linux:**


    # Update the package index
    sudo apt update
    
    # Install MySQL server
    sudo apt install mysql-server
    
    # Start the MySQL service
    sudo service mysql start
    
    # Set the MySQL root user password
     sudo mysql_secure_installation


**3.3 Installing MySQL on MacOS:**

- Install Homebrew if you don't have it already:


    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Install MySQL with Homebrew:
        brew install mysql
        
        # Start the MySQL service
        brew services start mysql
        
        # Set the MySQL root user password
        mysql_secure_installation


- These commands should give you a basic installation of MySQL on each operating system. Be sure to check out the official MySQL documentation for additional information on setting up and using MySQL Server: MySQL Documentation.

**3.4 Place the MySQL username and password in the "backend/.env" file for the application to function correctly.**

**3.5 Login to MySQL from terminal:**


        sudo mysql -u <Enter your username> -p
        Enter password: <Enter your password>
		
**3.6 View list of existing users in MySQL**

        mysql> SELECT user FROM mysql.user;

**3.7 User privileges**

        GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost';

**3.8 To create the data base:**

- In the MySQL session in the terminal, copy the code "database/scripts/database_full.sql" this will create the database "db_webcuponera" with their respective tables.
```bash
mysql> SHOW TABLES;
____________________________
| Tables_in_db_webcuponera |
|--------------------------|
| administradores          |
| categorias               |
| cliente_tienda           |
| cupon_comprado           |
| cupones                  |
| usuario                  |
|__________________________|
```

- Copy the code "database/scripts/procedures.sql" This will create the stored procedures that the application uses.

# 4. Backend:

**4.1 Create the virtual environment in WINDOWS:**

        # Install virtualenv from terminal
        pip install virtualenv

        # Navigate to the directory
        > cd Proyecto-qupons/backend

        # Create the virtual environment
        > py -3 -m venv venv

        # Activate the virtual environment
        > venv\Scripts\activate

        # Install the dependencies
        > pip install -r requirements.txt

**4.2 Create the virtual environment in LINUX:**

        # Install virtualenv from terminal
        $ pip install virtualenv

        # Navega al directorio
        $ cd Proyecto-qupons/backend

        # Create the virtual environment
        $ python3 -m venv venv

        # Activate the virtual environment
        $ source venv/bin/activate

        # Install the dependencies
        $ pip install -r requirements.txt

**4.3 Create the virtual environment in MacOS:**

        # Install virtualenv from terminal
        $ pip install virtualenv

        # Navigate to the directory
        $ cd Proyecto-qupons/backend

        # Create the virtual environment
        $ python3 -m venv venv

        # Activate the virtual environment
        $ source venv/bin/activate

        # Install the dependencies
        $ pip install -r requirements.txt

**4.4 Start the Backend (FastAPI):**

        # Root: "backend/"
        uvicorn app.main:app --reload

# 5. Frontend:

**5.1 From the terminal navigate to "Proyecto-Qupons/frontend/src"**

        # Install file dependencies "package.json"
        npm install

**5.2 Frontend execution "Proyecto-Qupons/frontend/src"**

        npm run dev

# 6. Use:
## **Step 1: Register Administrator** 
Start by registering an administrator, in your terminal within the mysql session, use the file "databases/scripts/tests_procedures.sql".
You can use any administrator from the first group since they execute the stored procedure "sp_crear_admin" to generate the record.

## **Step 2: Create categories**
In order for stores to create their coupons, the administrator needs to create categories. for example: Fashion, Gastronomy, Entertainment, Appliances, etc.
![crear-categorias](https://github.com/MiguelBG12/Proyecto-Qupons/assets/135359331/c620230e-8434-458c-8efc-4d127c263e80)

## **Step 3: Register a store**
From the Frontend "http://localhost:5173/registrar-tienda" fill out the form with your store data.
![registro-tienda](https://github.com/MiguelBG12/Proyecto-Qupons/assets/135359331/82e63b97-bff7-45cf-8dfd-d715fe66e043)

## **Step 4: Create coupon**
From the create coupon section "http://localhost:5173/tienda-crear-coupons" personalize the coupon by filling in the required information.
![crear-cupon](https://github.com/MiguelBG12/Proyecto-Qupons/assets/135359331/9d047b6d-43f5-4557-82ac-5c7ddf635308)

## **Step 5: Register user**
From the Frontend "http://localhost:5173/registrar-usuario" fill out the form with the user's data.
![registro-usuario](https://github.com/MiguelBG12/Proyecto-Qupons/assets/135359331/951c8ee9-b9d7-4096-a2e4-e9958f6c2fb4)

## **Step 6: Get coupon**
The user has a section available "http://localhost:5173/usuario-cupones-obtenidos" where they can see the coupons obtained and be able to download them in a pdf file.
![cupone otenidos](https://github.com/MiguelBG12/Proyecto-Qupons/assets/135359331/75c2dbda-9878-4a8a-a1d4-1bda05a9d80a)

# Authors👨‍🎓👩‍🎓:
#### Marirosa Vilcherrez: https://www.linkedin.com/in/marirosavilcherrez/
#### Miguel Bautista: https://www.linkedin.com/in/miguelbautistag/
#### Denzel Romero : https://www.linkedin.com/in/denzel-rb/
#### Pablo Bautista: https://www.linkedin.com/in/pablobautistagoyoneche/
