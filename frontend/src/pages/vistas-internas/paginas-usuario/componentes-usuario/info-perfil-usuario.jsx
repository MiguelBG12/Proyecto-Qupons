import React, { useState, useEffect } from "react";
import axios from "axios";
import "./css/info-perfil-usuario.css";

const Info_perfil_usuario = () => {
  const [datos, setDatos] = useState({
    nombres_completos: "",
    telefono: "",
    correo: "",
    dni: "",
    genero: "",
    direccion: "",
    departamento: "",
    fecha_nacimiento: "",
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
        url: "http://localhost:8000/users/ver_perfil_usuario",
        headers: {
          Authorization: `Bearer ${storedToken}`,
        },
      })
        .then(function (response) {
          const userData = response.data.result[0][0];
          console.log(userData)

          if (userData && userData.usuario_id) {
            setDatos({
              nombres_completos: userData.nombres_completos,
              telefono: userData.telefono,
              correo: userData.correo,
              dni: userData.dni,
              genero: userData.genero,
              direccion: userData.direccion,
              departamento: userData.departamento,
              fecha_nacimiento: userData.fecha_nacimiento,
              nuevaContrasenna: userData.nuevaContrasenna,
              repetirContrasenna: userData.repetirContrasenna,
            });
            setPerfilLoaded(true);
          } else {
            console.error(
              "La respuesta del servidor no contiene el usuario_id esperado."
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
    const usuario_id = payloadJson.usuario_id;

    setDatos({
      ...datos,
      usuario_id: usuario_id,
    });

    console.log("Datos antes de la solicitud:", datos);

    axios({
      method: "put",
      url: "http://localhost:8000/users/actualizar_user",
      headers: {
        Authorization: `Bearer ${storedToken}`,
      },
      data: {
        usuario_id: usuario_id,
        ...datos,
      },
    })
      .then(function (response) {
        console.log(response);
        console.log(datos.response)
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
    <h1 className="titulo-intranet">Mantenga sus datos actualizados</h1>
      <section className="formulario">
      {exitoMensaje && <p className="mensaje-exito">{exitoMensaje}</p>}
      <form onSubmit={handleUpdate}>
          <input
            type="text"
            name="nombres_completos"
            placeholder="Nombre Completo:"
            value={datos.nombres_completos}
            onChange={handleInputChange}
          />
          <input
            type="tel"
            name="telefono"
            placeholder="Telefono:"
            value={datos.telefono}
            onChange={handleInputChange}
          />
          <input
            type="email"
            name="correo"
            placeholder="Correo electronico:"
            value={datos.correo}
            onChange={handleInputChange}
          />
          <input
            type="text"
            name="dni"
            placeholder="DNI:"
            value={datos.dni}
            onChange={handleInputChange}
          />
            <select id="opciones" name="opciones" value={datos.genero} onChange={handleInputChange}>
              <option value="" disabled selected>
                -- Género --
              </option>
              <option value="Mujer">Mujer</option>
              <option value="Hombre">hombre</option>
              <option value="NoEspecificado">Prefiero no especificar</option>
            </select>
          <input
            type="text"
            name="direccion"
            placeholder="Dirección:"
            value={datos.direccion}
            onChange={handleInputChange}
          />
          <input
            type="text"
            name="departamento"
            placeholder="Departamento:"
            value={datos.departamento}
            onChange={handleInputChange}
          />
          <br />
          <br />
          <label htmlFor="">Fecha de nacimiento:</label>
          <input
            type="date"
            id="fecha_nacimiento"
            name="fecha_nacimiento"
            value={datos.fecha_nacimiento}
            onChange={handleInputChange}
          />
          <input
            type="password"
            name="contraseña"
            placeholder="Nueva contraseña:"
            value={datos.nuevaContrasenna}
            onChange={handleInputChange}
          /> 
          <input
            type="password"
            name="repetircontraseña"
            placeholder="Repetir nueva contraseña:"
            value={datos.repetirContrasenna}
            onChange={handleInputChange}
          />
          <button type="submit" className="btn-enviar">
              Actualizar
          </button>
        </form>

      </section>
    </>
  );
};
export default Info_perfil_usuario;