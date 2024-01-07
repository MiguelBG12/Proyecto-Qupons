import React, { useState } from "react";
import axios from "axios";
import "./css/info-crear-categoria.css";

const Info_crear_categoría = () => {
  const [datos, setDatos] = useState({
    nombre: "",
  });

  const [exitoMensaje, setExitoMensaje] = useState(null);

  const crearCategorias = () => {
    const storedToken = localStorage.getItem("access_token");
    axios({
      method: "post",
      url: "http://localhost:8000/admin/crear_categoria",
      headers: {
        Authorization: `Bearer ${storedToken}`,
      },
      data: datos,
    })
      .then(function (response) {
        console.log(response);
        console.log(response.data)
    
        // Mostrar mensaje de éxito
        setExitoMensaje("¡Se creó una nueva categoría con éxito!");
        setDatos({ nombre: "" });
      })
      .catch(function (error) {
        console.error("Error al crear categoría", error);
        if (error.response) {
          console.error("Detalles del error:", error.response.data);
        } else if (error.request) {
          console.error("No se recibió respuesta del servidor");
        } else {
          console.error("Error al configurar la solicitud", error.message);
        }
      });
  };

  return (
    <>
      <h1 className="titulo-formulario-crear-categoria">Crear categorías</h1>
      <form onSubmit={(e) =>{
        e.preventDefault();
        crearCategorias();
      }}>
        {exitoMensaje && <p className="mensaje-exito">{exitoMensaje}</p>}
        <input
          type="text"
          placeholder="Nombre de la categoría:"
          required
          value={datos.nombre}
          onChange={(e) => setDatos({ nombre: e.target.value })}
        />
        <button type="submit" className="btn-enviar" >
          Crear
        </button>
      </form>
    </>
  );
};

export default Info_crear_categoría;
