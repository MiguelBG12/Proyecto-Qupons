import React, { useState, useEffect } from "react";
import axios from "axios";
import "./css/info-cupones-tienda.css";
//import promo6 from "../../../../assets/img/promo6.jpg";

const Info_cupones_tienda = () => {
  const [cupones, setCupones] = useState([]);
  const storedToken = localStorage.getItem("access_token");

  useEffect(() => {
  
    axios({
      method: "get",
      url: `http://localhost:8000/stores/ver_cupones_en_tienda`,
      headers: {
        Authorization: `Bearer ${storedToken}`,
      }
    })
      .then(function (response) {
        console.log("API response:", response.data);
        const cuponesData = response.data.result[0];
        console.log(cuponesData)

        if (cuponesData && cuponesData.length > 0) {
          console.log("Data de la imagen:", cuponesData[0].disenno_oferta_foto);
          const mappedCupones = cuponesData.map((cuponData) => ({
            cupones_id: cuponData.cupones_id,
            titulo: cuponData.titulo,
            descripcion: cuponData.descripcion,
            disenno_oferta_foto: cuponData.disenno_oferta_foto,
            precio_normal: cuponData.precio_normal,
            precio_oferta: cuponData.precio_oferta,
            
          }));

          setCupones(mappedCupones);
        } else {
          console.error("La respuesta del servidor no contiene cupones para el usuario.");
        }
      })
      .catch(function (error) {
        alert("Error al consultar los datos");
        console.log("Error al consultar los datos", error);
      });
  }, []);

  return (
    <>
      <div className="container-cupones-tienda">
        {cupones.map((cupon, index) => (
          <div className="base-cupon" key={index} id={`cupon-${cupon.cupones_id}`}>
            <img
              src={cupon.disenno_oferta_foto}
              alt="Imagen"
            />
            <br />
            <h3 className="titulo-cupon">{cupon.titulo}</h3>
            <p className="descripcion-cupon">{cupon.descripcion} </p>

            <h4 className="texto-descuento">
              <span className="porcentaje">
                {(((cupon.precio_normal - cupon.precio_oferta) /
                  cupon.precio_normal) * 100).toFixed(2)}%
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
          </div>
        ))}
      </div>
    </>
  );
};

export default Info_cupones_tienda;
