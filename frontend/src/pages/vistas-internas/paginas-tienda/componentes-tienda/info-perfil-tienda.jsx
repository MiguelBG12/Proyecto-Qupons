import React, { useState, useEffect } from "react";
import axios from "axios";
import "../../../componentes/sesion-tienda";
import "./css/info-perfil-tienda.css";

const Info_perfil_tienda = () => {
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

  const [perfilLoaded, setPerfilLoaded] = useState(false);
  const [exitoMensaje, setExitoMensaje] = useState(null);
  const [archivo, setArchivo] = useState(null);

  const handleCambioArchivo = (event) => {
    const nuevoArchivo = event.target.files[0];
    setArchivo(nuevoArchivo);
  };

  useEffect(() => {
    const obtenerDatosActuales = () => {
      const storedToken = localStorage.getItem("access_token");

      axios({
        method: "get",
        url: "http://localhost:8000/stores/ver_perfil_tienda",
        headers: {
          Authorization: `Bearer ${storedToken}`,
        },
      })
        .then(function (response) {
          const tiendaData = response.data.result[0][0];

          if (tiendaData && tiendaData.cliente_tienda_id) {
            setDatos({
              nombre_empresa: tiendaData.nombre_empresa,
              nombre_contacto: tiendaData.nombre_contacto,
              telefono: tiendaData.telefono,
              correo: tiendaData.correo,
              ruc: tiendaData.ruc,
              razon_social: tiendaData.razon_social,
              direccion: tiendaData.direccion,
              logo_tienda: tiendaData.logo_tienda,
              contrasenna: tiendaData.contrasenna,
              repetircontrasenna: tiendaData.repetirContrasenna,
            });
            setPerfilLoaded(true);
          } else {
            console.error(
              "La respuesta del servidor no contiene el cliente_tienda_id esperado."
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

    console.log(`Updating ${name} with value:`, value);

    setDatos({
      ...datos,
      [name]: value,
    });
  };

  const handleUpdate = (event) => {
    event.preventDefault();
    if (datos.contrasenna !== datos.repetircontrasenna) {
      console.error("La contraseña no coincide");
      return;
    }
    console.log('Datos que se enviarán al servidor:', datos);

    const storedToken = localStorage.getItem("access_token");
    const token = storedToken.split(".")[1];
    const payloadJson = JSON.parse(atob(token));
    const cliente_tienda_id = payloadJson.cliente_tienda_id;

    setDatos({
      ...datos,
      cliente_tienda_id: cliente_tienda_id,
    });

    axios({
      method: "put",
      url: "http://localhost:8000/stores/actualizar_tienda",
      headers: {
        Authorization: `Bearer ${storedToken}`,
      },
      data: {
        cliente_tienda_id: cliente_tienda_id,
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

  console.log('Estado actual de datos:', datos);

  return (
    <>
    <h1 className="titulo-intranet">Mantenga los datos de su tienda actualizados</h1>
      <section className="formulario">
      {exitoMensaje && <p className="mensaje-exito">{exitoMensaje}</p>}
      <form onSubmit={handleUpdate}>
          <input
            type="text"
            //name="nombre"
            placeholder="Nombre de tienda:"
            value={datos.nombre_empresa}
            onChange={handleInputChange}
          />
          <input
            type="text"
            //name="nombre"
            placeholder="Nombre del contacto:"
            value={datos.nombre_contacto}
            onChange={handleInputChange}
          />
          <input
            type="tel"
            //name="nombre"
            placeholder="Teléfono:"
            value={datos.telefono}
            onChange={handleInputChange}
          />
          <input
            type="email"
            //name="nombre"
            placeholder="Correo electronico:"
            value={datos.correo}
            onChange={handleInputChange}
          />
          <input
            type="text"
            //name="nombre"
            placeholder="RUC:"
            value={datos.ruc}
            onChange={handleInputChange}
          />
          <input
            type="text"
            //name="nombre"
            placeholder="Razón social"
            value={datos.razon_social}
            onChange={handleInputChange}
          />
          <input
            type="text"
            //name="nombre"
            placeholder="Dirección:"
            value={datos.direccion}
            onChange={handleInputChange}
          />
            <br />
            <br />      
            <label htmlFor="">Logo de la tienda</label>
            <input type="file" onChange={handleCambioArchivo} />

          <input
            type="password"
            //name="nombre"
            placeholder="Nueva contraseña:"
            value={datos.contrasenna}
            onChange={handleInputChange}
          />
          <input
            type="password"
            //name="nombre"
            placeholder="Repetir nueva contraseña:"
            value={datos.repetircontrasenna}
            onChange={handleInputChange}
          />  
            <button type="submit" className="btn-enviar">
              Actualizar tienda
            </button>
          </form>
      </section>
    </>
  );
};
export default Info_perfil_tienda;