import React, { useState, useEffect } from "react";
import axios from "axios";
import "./css/info-perfil-administrador.css";

const InfoPerfilAdministrador = () => {

  const [formState, setFormState] = useState({
    nombre: "",
    cargo: "",
    correo: "",
    nuevaContrasenna: "",
    repetirContrasenna: "",
  });

  const [perfilLoaded, setPerfilLoaded] = useState(false); 

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormState({
      ...formState,
      [name]: value,
    });
  };

  const actualizarPerfil = ()=>{

  };

  useEffect(() => {
        const storedToken = localStorage.getItem("access_token");

        axios({
          method: "get",
          url: "http://localhost:8000/admin/ver_perfil_administrador",
          headers: {
            Authorization: `Bearer ${storedToken}`,
          },

        })
          .then(function (response) {
              // Extraer datos del administrador de la respuesta
              const adminData = response.data.result[0][0];

            // Actualizar estados con los datos obtenidos
            if (adminData && adminData.administrador_id) {
            setFormState({
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
  }, []);

  return (
    <>
      <h1 className="titulo-intranet">Mantén tus datos actualizados</h1>
      {perfilLoaded ? (
        <>
          <section className="formulario">
            <form onSubmit={actualizarPerfil}>
              <input
                type="text"
                name="nombre"
                placeholder="Nombre Completo:"
                value={formState.nombre}
                onChange={handleInputChange}
              />
              <br />
              <input
                type="text"
                name="cargo"
                placeholder="Cargo:"
                value={formState.cargo}
                onChange={handleInputChange}
              />
              <br />
              <input
                type="email"
                name="correo"
                placeholder="Correo electrónico:"
                value={formState.correo}
                onChange={handleInputChange}
              />
              <br />
              <input
                type="password"
                name="nuevaContrasenna"
                placeholder="Nueva contraseña:"
                value={formState.nuevaContrasenna}
                onChange={handleInputChange}
              />
              <br />
              <input
                type="password"
                name="repetirContrasenna"
                placeholder="Repetir nueva contraseña:"
                value={formState.repetirContrasenna}
                onChange={handleInputChange}
              />
              <br />
              <button type="submit" className="btn-enviar">
                Actualizar
              </button>
            </form>
          </section>
        </>
      ) : (
        <p>Cargando datos del perfil...</p>
      )}
    </>
  );
};

export default InfoPerfilAdministrador;
