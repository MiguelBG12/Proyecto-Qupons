import React from "react";
import "./css/info-cupones-administrador.css";
import Cupon from "../../../componentes/cupon";
const Info_cupones_administrador = () => {
  return (
    <>
    <div className="container-cupones">
    <Cupon/>
    <Cupon/>
    <Cupon/>
    </div>
    </>
  );
};
export default Info_cupones_administrador;