import React, { useState, useEffect } from "react";
import axios from "axios";
import "./css/seccion-cupones.css";
import Cupon from "./cupon";

const Seccion_cupones = () => {
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
      <section className="seccion-cupones">
        <div className="container">
          <h1>¡Todos los descuentos estan aquí!</h1>
          <div className="container-cupones-condicional">
          {cupones.map((cupon) => (
          <Cupon key={cupon.cupones_id} object={cupon} />
        ))}
          </div>
        </div>
      </section>
    </>
  );
};

export default Seccion_cupones;
