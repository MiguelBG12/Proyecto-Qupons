import React, { useState, useEffect } from "react";
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

  const [perfilLoaded, setPerfilLoaded] = useState(false);
  const [exitoMensaje, setExitoMensaje] = useState(null);

  useEffect(() => {
    const obtenerDatosActuales = () => {
      const storedToken = localStorage.getItem("access_token");

      axios({
        method: "get",
        url: "http://localhost:8000/admin/ver_perfil_administrador",
        headers: {
          Authorization: `Bearer ${storedToken}`,
        },
      })
        .then(function (response) {
          const adminData = response.data.result[0][0];

          if (adminData && adminData.administrador_id) {
            setDatos({
              nombre: adminData.nombre,
              cargo: adminData.cargo,
              correo: adminData.correo,
            });
            setPerfilLoaded(true);
          } else {
            console.error(
              "La respuesta del servidor no contiene el administrador_id esperado."
            );
          }
        })
        .catch(function (error) {
          alert("Error al consultar los datos");
          console.log("Error al consultar los datos", error);
        });
    };

    obtenerDatosActuales();
  }, []);

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
    const token = storedToken.split(".")[1];
    const payloadJson = JSON.parse(atob(token));
    const administrador_id = payloadJson.administrador_id;

    setDatos({
      ...datos,
      administrador_id: administrador_id,
    });

    axios({
      method: "put",
      url: "http://localhost:8000/admin/actualizar_admin",
      headers: {
        Authorization: `Bearer ${storedToken}`,
      },
      data: {
        admin_id: administrador_id,
        ...datos,
      },
    })
      .then(function (response) {
        console.log(response);
        console.log("Perfil actualizado con éxito");
        console.log("Data en la respuesta:", response.data);

        // Mostrar mensaje de éxito
        setExitoMensaje("¡Perfil actualizado con éxito!");
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
      {exitoMensaje && <p className="mensaje-exito">{exitoMensaje}</p>}
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
