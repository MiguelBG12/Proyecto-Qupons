import React, { useState } from "react";
import axios from "axios";
import "./css/seccion-formulario-tienda.css";

const Seccion_formulario_tienda = () => {
  const [datos, setDatos] = useState({
    nombre_empresa: "",
    nombre_contacto: "",
    telefono: "",
    correo: "",
    ruc: "",
    razon_social: "",
    direccion: "",
    logo_tienda: "",
    contrasenna: "",
    repetircontrasenna: "",
    
  });

  const [exitoMensaje, setExitoMensaje] = useState(null);

  const crearTienda = () => {
    console.log("Datos enviados al servidor:", datos)
    axios({
      method: "post",
      url: "http://localhost:8000/registrar-tienda",
      data: datos,
    })
      .then(function (response) {
        console.log(response);
        console.log(response.data);

        if (datos.contrasenna !== datos.repetircontrasenna) {
          console.error("La contraseña no coincide");
        }

        setExitoMensaje("¡Se creó tu tienda con éxito!");
      })
      .catch(function (error) {
        console.error("Error al crear tienda", error);
        if (error.response) {
          console.error("Detalles del error:", error.response.data);
        } else if (error.request) {
          console.error("No se recibió respuesta del servidor");
        } else {
          console.error("Error al configurar la solicitud", error.message);
        }
      });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log("Datos antes de enviar",)
    crearTienda();
  };

  return (
    <>
      <div className="fondo-seccion-formulario-verde"></div>
      <div className="fondo-seccion-formulario-blanco">
        <div className="contenedor-formulario"></div>
      </div>

      <section className="seccion-verde-formulario"></section>
      <section className="seccion-blanca-formulario">
        <div className="contenedor-formulario">
          <h1>Registre su tienda</h1>

          <form onSubmit={handleSubmit}>
            {exitoMensaje && <p className="mensaje-exito">{exitoMensaje}</p>}
            <input
              type="text"
              placeholder="Nombre de la tienda:"
              required
              value={datos.nombre_empresa}
              onChange={(e) => setDatos({ ...datos, nombre_empresa: e.target.value })}
            />
            <input
              type="text"
              placeholder="Nombre del contacto:"
              required
              value={datos.nombre_contacto}
              onChange={(e) => setDatos({ ...datos, nombre_contacto: e.target.value })}
            />
            <input
              type="tel"
              placeholder="Telefono:"
              required
              value={datos.telefono}
              onChange={(e) => setDatos({ ...datos, telefono: e.target.value })}
            />
            <input
              type="email"
              placeholder="Correo electronico:"
              required
              value={datos.correo}
              onChange={(e) => setDatos({ ...datos, correo: e.target.value })}
            />
            <input
              type="text"
              placeholder="RUC:"
              required
              value={datos.ruc}
              onChange={(e) => setDatos({ ...datos, ruc: e.target.value })}
            />
            <input
              type="text"
              placeholder="Razón social:"
              required
              value={datos.razon_social}
              onChange={(e) => setDatos({ ...datos, razon_social: e.target.value })}
            />
            <input
              type="text"
              placeholder="Dirección:"
              required
              value={datos.direccion}
              onChange={(e) => setDatos({ ...datos, direccion: e.target.value })}
            />
            <br />
            <br />
            <label htmlFor="">Logo de la tienda</label>
            <input
              type="file"
              id= "archivo"
              name="archivo"
              accept=".jpg, .jpeg, .png"
              value={datos.logo_tienda}
              onChange={(e) => setDatos({ ...datos, logo_tienda: e.target.value })}
            />
            <br />
            <input
              type="password"
              placeholder="Contraseña:"
              required
              value={datos.contrasenna}
              onChange={(e) => setDatos({ ...datos, contrasenna: e.target.value })}
            />
            <input
              type="password"
              placeholder="Repetir contraseña:"
              required
              value={datos.repetircontrasenna}
              onChange={(e) => setDatos({ ...datos, repetircontrasenna: e.target.value })}
            />
            
            <br />
            <button type="submit" className="btn-enviar">
              Registrar
            </button>
          </form>
        </div>
      </section>
      <section className="top-para-footer-tienda"></section>
    </>
  );
};

export default Seccion_formulario_tienda;
