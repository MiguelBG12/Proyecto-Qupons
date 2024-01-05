import React, { useState, useEffect } from "react";
import axios from "axios";
import "./css/info-cupones-administrador.css";
import Cupon from "../../../componentes/cupon";

const Info_cupones_administrador = () => {
  const [cupones, setCupones] = useState([]);

  useEffect(() => {
    // Obtener la lista de cupones al cargar la página
    obtenerCupones();
  }, []);

  const obtenerCupones = async () => {
    try {
      const response = await axios.get("http://localhost:8000/admin/ver_cupones");
      const data = response.data.result[0]; // Obtener la lista de cupones del resultado
      setCupones(data);
    } catch (error) {
      console.error("Error al obtener la lista de cupones", error);
      // Manejar el error de alguna manera (por ejemplo, mostrar un mensaje de error)
    }
  };

  return (
    <>
      <div className="container-cupones">
        {cupones.map((cupon) => (
          <Cupon key={cupon.cupones_id} object={cupon} />
        ))}
      </div>
    </>
  );
};

export default Info_cupones_administrador;
