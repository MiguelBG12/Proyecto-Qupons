import React, { useState, useEffect } from "react";
import axios from "axios";
import "./css/cupon.css";
import promo4 from "../../assets/img/promo4.jpg";

const Cupon_obtenido = () => {
  const [cupones, setCupones] = useState([]);

  const storedToken = localStorage.getItem("access_token");

  useEffect(() => {
    axios({
      method: "get",
      url: "http://localhost:8000/users/ver_cupones_adquiridos",
      headers: {
        Authorization: `Bearer ${storedToken}`,
      },
    })
      .then(function (response) {
        console.log("API response:", response.data);
        const cuponesData = response.data.result[0];

        if (cuponesData && cuponesData.length > 0) {
          const mappedCupones = cuponesData.map((cuponData) => ({
            usuario_id: cuponData.usuario_id,
            cupones_id: cuponData.cupones_id,
            titulo: cuponData.titulo,
            descripcion: cuponData.descripcion,
            precio_normal: cuponData.precio_normal,
            precio_oferta: cuponData.precio_oferta,
          }));
          setCupones(mappedCupones);
        } else {
          console.error(
            "La respuesta del servidor no contiene cupones para el usuario."
          );
        }
      })
      .catch(function (error) {
        alert("Error al consultar los datos");
        console.log("Error al consultar los datos", error);
      });
  }, []);

  return (
    <>
      {cupones.map((cupon, index) => (
        <div className="base-cupon" key={index}>
          <img src={promo4} alt="Promo" />
          <br />
          <h3 className="titulo-cupon">{cupon.titulo}</h3>
          <p className="descripcion-cupon">{cupon.descripcion} </p>

          <h4 className="texto-descuento">
            <span className="porcentaje">
              S/{(((cupon.precio_normal - cupon.precio_oferta) /
                cupon.precio_normal) *
                100).toFixed(2)}
            </span>{" "}
            de descuento
          </h4>

          <div className="container-precios">
            <div>
              <p className="ahora"> Ahora:</p>
              <h4 className="precio-ahora">
                S/{cupon.precio_oferta && cupon.precio_oferta.toFixed(2)}
              </h4>
            </div>

            <div>
              <p className="antes"> Antes:</p>
              <h4 className="precio-antes">
                S/{cupon.precio_normal && cupon.precio_normal.toFixed(2)}
              </h4>
            </div>
          </div>

          <a href="#">
            <button className="btn-obtener-cupon">Descargar PDF</button>
          </a>
        </div>
      ))}
    </>
  );
};

export default Cupon_obtenido;
