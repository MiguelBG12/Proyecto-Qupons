import React from "react";
import "./css/menu-vertical-administrador.css";
const Menu_vertical_usuario = () => {
    return (
      <>
      <div className="menu-vertical">
        <a href="/panel-usuario"><button className="btn-menu-v"><i class="fa-solid fa-house"></i>Panel</button></a>
        <a href="/perfil-usuario"><button className="btn-menu-v"><i class="fa-solid fa-user"></i>Mi perfil</button></a>
        <a href="/cupones-usuario"><button className="btn-menu-v"><i class="fa-solid fa-ticket-simple"></i>Cupones</button></a>
        <a href="/cupones-obtenidos-usuario"><button className="btn-menu-v"><i class="fa-solid fa-ticket"></i>Cupones obtenidos</button></a>
      </div>
      </>
    );
};
export default Menu_vertical_usuario;