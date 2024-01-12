import React, { useState, useEffect } from "react";
import axios from "axios";
import "./css/cupon.css";
import jsPDF from "jspdf";
import html2canvas from "html2canvas";
import promo13 from "../../assets/img/promo13.jpg";

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
            disenno_oferta_foto: cuponData.disenno_oferta_foto,
            fecha_vencimiento: cuponData.fecha_vencimiento,
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

  const handleDownloadPDF = (cupon) => {
    const storedToken = localStorage.getItem("access_token");
    const token = storedToken.split(".")[1];
    const payloadJson = JSON.parse(atob(token));
    const nombres_completos = payloadJson.nombres_completos;
    console.log(nombres_completos)
    const dni = payloadJson.dni;
    console.log(dni)

    const pdfWidth = 110; // Tamaño en milímetros (A4)
    const pdfHeight = 210; // Tamaño en milímetros (A4)
  
    const pdf = new jsPDF({
      unit: 'mm',
      format: [pdfWidth, pdfHeight],
    });
  
    const cuponContainer = document.getElementById(`cupon-${cupon.cupones_id}`);
  
    if (cuponContainer) {
      const { fecha_vencimiento } = cupon;
  
      html2canvas(cuponContainer).then((canvas) => {
        const imageData = canvas.toDataURL("image/png");
  
        // Agregar imagen al PDF
        pdf.addImage(imageData, "PNG", 10, 10, pdfWidth - 20, pdfHeight - 40);
  
        pdf.setFontSize(10);
        pdf.text(`Fecha de Vencimiento: ${fecha_vencimiento}`, 15, pdfHeight - 25);
        pdf.text(`Nombres Completos: ${nombres_completos}`, 15, pdfHeight - 20);
        pdf.text(`DNI: ${dni}`, 15, pdfHeight - 15);
  
        // Guardar el PDF
        pdf.save(`${cupon.titulo}.pdf`);
      });
    }
  };  

  return (
    <>
      {cupones.map((cupon, index) => (
        <div className="base-cupon" key={index} id={`cupon-${cupon.cupones_id}`}>
          <img src={(cupon.cupones_id && cupon.cupones_id >= 6) ? promo13 : (cupon.logo_tienda || promo13)} alt="Logo de tienda" />
          <br />
          <h3 className="titulo-cupon">{cupon.titulo}</h3>
          <p className="descripcion-cupon">{cupon.descripcion} </p>

          <h4 className="texto-descuento">
            <span className="porcentaje">
              {(((cupon.precio_normal - cupon.precio_oferta) /
                cupon.precio_normal) *
                100).toFixed(0)}%
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

          <button
            className="btn-obtener-cupon"
            onClick={() => handleDownloadPDF(cupon)}
          >
            Descargar PDF
          </button>
        </div>
      ))}
    </>
  );
};

export default Cupon_obtenido;
