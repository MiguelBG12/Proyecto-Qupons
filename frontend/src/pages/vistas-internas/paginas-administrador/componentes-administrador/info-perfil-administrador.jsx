import React, { useState } from "react";
import axios from "axios";
import "./css/info-perfil-administrador.css";

const InfoPerfilAdministrador = () => {
  const [datos, setDatos] = useState({
    nombre: "",
    cargo: "",
    correo: "",
    nuevaContrasenna: "",
    repetirContrasenna: "",
  });

  const handleInputChange = (e) => {
    const target = e.target;
    const value = target.type === "checkbox" ? target.checked : target.value;
    const name = target.name;

    setDatos({
      ...datos,
      [name]: value,
    });
  };

  const handleUpdate = (event) => {
    event.preventDefault();
    if (datos.nuevaContrasenna !== datos.repetirContrasenna) {
      console.error("La contraseña no coincide");
      return;
    }

    const storedToken = localStorage.getItem("access_token");

    // Obtener administrador_id del token
    const token = storedToken.split(".")[1];
    const payloadJson = JSON.parse(atob(token));
    const administrador_id = payloadJson.administrador_id;

    // Actualizar state con administrador_id
    setDatos({
      ...datos,
      administrador_id: administrador_id,
    });
    console.log(setDatos)

    axios({
      method: "put",
      url: "http://localhost:8000/admin/actualizar_admin",
      headers: {
        Authorization: `Bearer ${storedToken}`,
      },
      data: {
        admin_id: administrador_id,  // Agregar administrador_id al cuerpo de la solicitud
        ...datos,
      },
    })
      .then(function (response) {
        console.log(response);
        console.log("Perfil actualizado con éxito");
        console.log("Data en la respuesta:", response.data);
        
        // Resto del código...
      })
      .catch(function (error) {
        console.error("Error al actualizar el perfil", error);
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
      <h1 className="titulo-intranet">Mantén tus datos actualizados</h1>
      <section className="formulario">
        <form onSubmit={handleUpdate}>
          <input
            type="text"
            name="nombre"
            placeholder="Nombre Completo:"
            value={datos.nombre}
            onChange={handleInputChange}
          />
          <br />
          <input
            type="text"
            name="cargo"
            placeholder="Cargo:"
            value={datos.cargo}
            onChange={handleInputChange}
          />
          <br />
          <input
            type="email"
            name="correo"
            placeholder="Correo electrónico:"
            value={datos.correo}
            onChange={handleInputChange}
          />
          <br />
          <input
            type="password"
            name="nuevaContrasenna"
            placeholder="Nueva contraseña:"
            value={datos.nuevaContrasenna}
            onChange={handleInputChange}
          />
          <br />
          <input
            type="password"
            name="repetirContrasenna"
            placeholder="Repetir nueva contraseña:"
            value={datos.repetirContrasenna}
            onChange={handleInputChange}
          />
          <br />
          <button type="submit" className="btn-enviar">
            Actualizar
          </button>
        </form>
      </section>
    </>
  );
};

export default InfoPerfilAdministrador;
