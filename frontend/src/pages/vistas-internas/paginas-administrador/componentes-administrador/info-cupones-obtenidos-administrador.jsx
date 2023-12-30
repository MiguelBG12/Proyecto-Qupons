import React from "react";
import "./css/info-cupones-obtenidos-administrador.css";
import Cupon_obtenido from "../../../componentes/cupon-obtenido";
const Info_cupones_obtenidos_administrador = () => {
  return (
    <>
    <div className="container-cupones">
        <Cupon_obtenido/>
        <Cupon_obtenido/>
        <Cupon_obtenido/>
    </div>
    </>
  );
};
export default Info_cupones_obtenidos_administrador;