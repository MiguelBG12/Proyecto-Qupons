import React, { useState } from "react";
import axios from "axios";
import "./css/cupon.css";
//import promo3 from "../../assets/img/promo3.jpg";

const Cupon = ({ object }) => {
  const descuentoPorcentaje = (((object.precio_normal - object.precio_oferta) / object.precio_normal) * 100).toFixed(2);
  const [usuarioId, setUsuarioId] = useState(null);
  const [cuponAdquiridoExitoso, setCuponAdquiridoExitoso] = useState(false);

  const cuponAdquirido = () => {
    const storedToken = localStorage.getItem("access_token");
    const token = storedToken.split(".")[1];
    const payloadJson = JSON.parse(atob(token));
    const usuario_id = payloadJson.usuario_id;

    axios({
      method: "post",
      url: "http://localhost:8000/users/adquirir_cupon",
      headers: {
        Authorization: `Bearer ${storedToken}`,
      },
      data: {
        usuario_id: usuario_id,
        cupones_id: object.cupones_id,
      },
    })
      .then(function (response) {
        console.log(response);
        console.log("Cupón adquirido con éxito");
        console.log("Data en la respuesta:", response.data);

        // Mostrar mensaje de éxito
        setCuponAdquiridoExitoso(true);

        // Realizar acciones adicionales según la respuesta, si es necesario
      })
      .catch(function (error) {
        console.error("Error al adquirir el cupón", error);
        // Manejar errores
      });
  };

  return (
    <>
      <div className="base-cupon">
        <img src={object.disenno_oferta_foto} alt="cupon" />

        <br />
        <h3 className="titulo-cupon">{object.titulo}</h3>

        <p className="descripcion-cupon">{object.descripcion}</p>

        <h4 className="texto-descuento">
          <span className="porcentaje">{descuentoPorcentaje}%</span> de descuento
        </h4>

        <div className="container-precios">
          <div>
            <p className="ahora"> Ahora: </p>
            <h4 className="precio-ahora"> s/{object.precio_oferta.toFixed(2)}</h4>
          </div>

          <div>
            <p className="antes"> Antes:</p>
            <h4 className="precio-antes">s/{object.precio_normal.toFixed(2)}</h4>
          </div>
        </div>

        {cuponAdquiridoExitoso && <p className="cupon-adquirido-mensaje">¡Cupón adquirido con éxito!</p>}

        <button className="btn-obtener-cupon" onClick={cuponAdquirido}>
          Obtener cupón
        </button>
      </div>
    </>
  );
};

export default Cupon;
