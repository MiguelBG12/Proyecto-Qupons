import React from "react";
import "./css/menu-vertical-administrador.css";
const Menu_vertical_tienda = () => {
    return (
      <>
      <div className="menu-vertical">
        <a href="/panel-tienda"><button className="btn-menu-v"><i class="fa-solid fa-house"></i>Panel</button></a>
        <a href="/perfil-tienda"><button className="btn-menu-v"><i class="fa-solid fa-user"></i>Mi perfil</button></a>
        <a href="/estadisticas-tienda"><button className="btn-menu-v"><i class="fa-solid fa-chart-simple"></i>Estadisticas</button></a>
        <a href="/cupones-tienda"><button className="btn-menu-v"><i class="fa-solid fa-ticket-simple"></i>Cupones</button></a>
        <a href="/crear-cupones-tienda"><button className="btn-menu-v"><i class="fa-solid fa-ticket"></i>Crear cupones</button></a>
      </div>
      </>
    );
};
export default Menu_vertical_tienda;