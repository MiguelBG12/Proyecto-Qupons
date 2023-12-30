import React from "react";
import "./css/info-cupones-usuario.css";
import Cupon from "../../../componentes/cupon";
const Info_cupones_usuario = () => {
  return (
    <>
    <div className="container-cupones-usuario">
    <Cupon/>
    <Cupon/>
    <Cupon/>
    </div>
    </>
  );
};
export default Info_cupones_usuario;