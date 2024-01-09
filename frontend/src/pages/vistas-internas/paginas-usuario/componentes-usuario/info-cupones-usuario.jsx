import React, { useState, useEffect } from "react";
import axios from "axios";
import "./css/info-cupones-usuario.css";
import Cupon from "../../../componentes/cupon";
const Info_cupones_usuario = () => {
  const [cupones, setCupones] = useState([]);

  useEffect(() => {
    // Obtener la lista de cupones
    axios.get("http://localhost:8000/admin/ver_cupones")
    .then((response) => {
      const dataCupones = response.data.result[0]; // Obtener la lista de clientes del resultado
      setCupones(dataCupones);
    })
    .catch((error) => {
      console.error("Error al obtener la lista de cupones", error);
    });
  }, []);

  return (
    <>
    <div className="container-cupones-usuario">
    {cupones.map((cupon) => (
          <Cupon key={cupon.cupones_id} object={cupon} />
        ))}
    </div>
    </>
  );
};
export default Info_cupones_usuario;