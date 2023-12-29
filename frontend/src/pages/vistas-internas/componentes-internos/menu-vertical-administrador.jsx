import React from "react";
import "./css/menu-vertical-administrador.css";
const Menu_vertical_administrador = () => {
    return (
      <>
      <div className="menu-vertical">
        <a href="/adminitrador-panel"><button className="btn-menu-v"><i class="fa-solid fa-house"></i>Panel</button></a>
        <a href="/adminitrador-perfil"><button className="btn-menu-v"><i class="fa-solid fa-user"></i>Mi perfil</button></a>
        <a href="/adminitrador-estadisticas"><button className="btn-menu-v"><i class="fa-solid fa-chart-simple"></i>Estadisticas</button></a>
        <a href="/adminitrador-ver-tiendas"><button className="btn-menu-v"><i class="fa-solid fa-cart-shopping"></i>Ver tiendas</button></a>
        <a href="/adminitrador-crear-tienda"><button className="btn-menu-v"><i class="fa-solid fa-shop"></i>Crear tienda</button></a>
        <a href="/adminitrador-ver-cupones"><button className="btn-menu-v"><i class="fa-solid fa-ticket-simple"></i>Ver cupones</button></a>
        <a href="/adminitrador-crear-cupones"><button className="btn-menu-v"><i class="fa-solid fa-ticket"></i>Crear cupones</button></a>
        <a href="/adminitrador-cupones-obtenidos"><button className="btn-menu-v"><i class="fa-solid fa-tag"></i>Cupones obtenidos</button></a>
        <a href="/adminitrador-crear-categorias"><button className="btn-menu-v"><i class="fa-solid fa-list"></i>Crear categorías</button></a>
      </div>
      </>
    );
};
export default Menu_vertical_administrador;