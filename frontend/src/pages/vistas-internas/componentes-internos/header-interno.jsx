import React from "react";
import "./css/header-interno.css";
const Header_interno = () => {
    return (
      <>
      <header className="header-interno">
        <div className="container">
          <div className="contenedor-nav">
            <div className="logo-header-interno">
              <h1>QUPONS</h1>
            </div>
            <nav>
              <div className="menu">
                <a href="/iniciar-sesion" className="btn-header-interno">CERRAR SESIÓN</a>
              </div>
            </nav>
          </div>
        </div>
      </header>
      </>
    );
};
export default Header_interno;