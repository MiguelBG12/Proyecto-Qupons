import React, { useState } from "react";
import axios from "axios";
import "./css/seccion-formulario-usuario.css";

const Seccion_formulario_usuario = () => {
  const [datos, setDatos] = useState({
    nombres_completos: "",
    telefono: "",
    correo: "",
    dni: "",
    genero: "",
    direccion: "",
    departamento: "",
    fecha_nacimiento: "",
    contrasenna: "",
    repetircontrasenna: "",
    
  });

  const [exitoMensaje, setExitoMensaje] = useState(null);

  const crearUsuario = () => {
    console.log("Datos enviados al servidor:", datos)
    axios({
      method: "post",
      url: "http://localhost:8000/registrar-usuario",
      data: datos,
    })
      .then(function (response) {
        console.log(response);
        console.log(response.data);

        if (datos.contrasenna !== datos.repetircontrasenna) {
          console.error("La contraseña no coincide");
        }

        setExitoMensaje("¡Se registro su usuario con éxito!");
      })
      .catch(function (error) {
        console.error("Error al crear usuario", error);
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
    crearUsuario();
  };

  return (
    <>
      <section className="seccion-verde-formulario"></section>
      <section className="seccion-blanca-formulario">
        <div className="contenedor-formulario">
          <h1>Registrate</h1>
          {/* <p><span className="texto-formulario">con</span></p>
          <button className="btn-gmail">Gmail</button>
          <p><span className="texto-formulario">ó</span></p> */}
          <form onSubmit={handleSubmit}>
            {exitoMensaje && <p className="mensaje-exito">{exitoMensaje}</p>}
            <input
              type="text"
              placeholder="Nombre Completo:"
              required
              value={datos.nombres_completos}
              onChange={(e) => setDatos({ ...datos, nombres_completos: e.target.value })}
            />
            <input
              type="tel"
              placeholder="Teléfono:"
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
              placeholder="DNI:"
              required
              value={datos.dni}
              onChange={(e) => setDatos({ ...datos, dni: e.target.value })}
            />
            <select id="opciones" name="opciones" required value={datos.genero} 
            onChange={(e) => setDatos({ ...datos, genero: e.target.value })}>
              <option value="" disabled >
                -- Género --
              </option>
              <option value="Mujer">Mujer</option>
              <option value="Hombre">hombre</option>
              <option value="NoEspecificado">Prefiero no especificar</option>
            </select>
            <input
              type="text"
              placeholder="Dirección:"
              required
              value={datos.direccion}
              onChange={(e) => setDatos({ ...datos, direccion: e.target.value })}
            />
            <input
              type="text"
              placeholder="Departamento:"
              required
              value={datos.departamento}
              onChange={(e) => setDatos({ ...datos, departamento: e.target.value })}
            />
            <br />
            <br />
            <label htmlFor="">Fecha de nacimiento </label>
            <input
              type="date"
              id="fecha_nacimiento"
              name="fecha_nacimiento"
              required
              value={datos.fecha_nacimiento}
              onChange={(e) => setDatos({ ...datos, fecha_nacimiento: e.target.value })}
            />
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
            <button type="submit" className="btn-enviar">
              Enviar
            </button>
          </form>
        </div>
      </section>

      <section className="top-para-footer-usuario"></section>
    </>
  );
};

export default Seccion_formulario_usuario;
