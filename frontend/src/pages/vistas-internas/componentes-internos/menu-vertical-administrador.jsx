import React from "react";
import "./css/menu-vertical-administrador.css";
const Menu_vertical_administrador = () => {
    return (
      <>
      <div className="menu-vertical">
        <a href="/panel-administrador"><button className="btn-menu-v"><i class="fa-solid fa-house"></i>Panel</button></a>
        <a href="/perfil-administrador"><button className="btn-menu-v"><i class="fa-solid fa-user"></i>Mi perfil</button></a>
        <a href="/estadisticas-administrador"><button className="btn-menu-v"><i class="fa-solid fa-chart-simple"></i>Estadisticas</button></a>
        <a href="/tiendas"><button className="btn-menu-v"><i class="fa-solid fa-cart-shopping"></i>Tiendas</button></a>
        <a href="/crear-tienda"><button className="btn-menu-v"><i class="fa-solid fa-shop"></i>Crear tienda</button></a>
        <a href="/cupones-administrador"><button className="btn-menu-v"><i class="fa-solid fa-ticket-simple"></i>Cupones</button></a>
        <a href="/crear-cupones-administrador"><button className="btn-menu-v"><i class="fa-solid fa-ticket"></i>Crear cupones</button></a>
        <a href="/cupones-obtenidos-administrador"><button className="btn-menu-v"><i class="fa-solid fa-tag"></i>Cupones obtenidos</button></a>
        <a href="/crear-categorias"><button className="btn-menu-v"><i class="fa-solid fa-list"></i>Crear categorías</button></a>
      </div>
      </>
    );
};
export default Menu_vertical_administrador;