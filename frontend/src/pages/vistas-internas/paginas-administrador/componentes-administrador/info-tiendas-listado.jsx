import React from "react";
import "./css/info-tiendas-listado.css";
import Logo_tienda from "../../../../assets/img/Logo-tienda.png";

const Info_tiendas_listado = () => {
  return (
    <>
    <div className="tienda-listado">
        <div className="logo-tienda">
            <img src={Logo_tienda} />
        </div>
        <div className="Datos-tienda-listado">
            <h4>Nombre tienda</h4>
            <p>Categoria tienda</p>
        </div>
        <div className="botones-tienda-listado">
            <button className="btn-editar"><i class="fa-solid fa-pen"></i>Editar</button>
            <button className="btn-eliminar"><i class="fa-solid fa-trash"></i>Eliminar</button>
        </div>
    </div>
    </>
  );
};
export default Info_tiendas_listado;