import React from "react";
import "./css/info-estadisticas-tienda.css";

const Info_estadisticas_tienda = () => {
  return (
    <>
      <div className="container-info-estadisticas">
        <div className="estadistica">
          <h1>125</h1>
          <h4>Total cupones</h4>
        </div>
        <div className="estadistica">
          <h1>87</h1>
          <h4>Cupones obtenidos</h4>
        </div>
        <div className="estadistica">
          <h1>1574</h1>
          <h4>Usuarios registrados</h4>
        </div>
      </div>
    </>
  );
};
export default Info_estadisticas_tienda;
