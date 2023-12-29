import React from "react";
import "./css/menu-vertical-administrador.css";
const Menu_vertical_tienda = () => {
    return (
      <>
      <div className="menu-vertical">
        <a href="/tienda-panel"><button className="btn-menu-v"><i class="fa-solid fa-house"></i>Panel</button></a>
        <a href="/tienda-perfil"><button className="btn-menu-v"><i class="fa-solid fa-user"></i>Mi perfil</button></a>
        <a href="/tienda-estadisticas"><button className="btn-menu-v"><i class="fa-solid fa-chart-simple"></i>Ver estadisticas</button></a>
        <a href="/tienda-ver-cupones"><button className="btn-menu-v"><i class="fa-solid fa-ticket-simple"></i>Ver cupones</button></a>
        <a href="/tienda-crear-cupones"><button className="btn-menu-v"><i class="fa-solid fa-ticket"></i>Crear cupones</button></a>
      </div>
      </>
    );
};
export default Menu_vertical_tienda;