import React from "react";
import "./css/menu-vertical-administrador.css";
const Menu_vertical_usuario = () => {
    return (
      <>
      <div className="menu-vertical">
        <a href="/usuario-panel"><button className="btn-menu-v"><i class="fa-solid fa-house"></i>Panel</button></a>
        <a href="/usuario-perfil"><button className="btn-menu-v"><i class="fa-solid fa-user"></i>Mi perfil</button></a>
        <a href="/usuario-ver-cupones"><button className="btn-menu-v"><i class="fa-solid fa-ticket-simple"></i>Ver cupones</button></a>
        <a href="/usuario-cupones-obtenidos"><button className="btn-menu-v"><i class="fa-solid fa-ticket"></i>Cupones obtenidos</button></a>
      </div>
      </>
    );
};
export default Menu_vertical_usuario;