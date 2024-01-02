import React, { useState } from "react";
import "./css/seccion-iniciar-sesion.css";

const Iniciar_sesion_administrador = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch("http://127.0.0.1:8000/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ email, password }),
      });

      if ((response.status >= 200 && response.status < 300)) {
        const data = await response.json();
        const token = data.token;
        // imprimimos mensajes en la consola del navegador para comprobar
        console.log("Token recibido:", token);
        console.log("Login exitoso");
      } else {
        // La solicitud falló, puedes manejar errores aquí
        console.error("Error al iniciar sesión");
      }
    } catch (error) {
      console.error("Error en la solicitud:", error);
    }
  };

  return (
    <>
      <section className="seccion-verde-formulario"></section>
      <section className="seccion-blanca-formulario">
        <div className="contenedor-formulario">
          <h1>Acceso administrador</h1>
          <form onSubmit={handleSubmit}>
            <input
              type="text"
              placeholder="Correo electronico:"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
            <br />
            <input
              type="password"
              placeholder="Contraseña:"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
            <br />
            <button type="submit" className="btn-enviar">
              Enviar
            </button>
          </form>
          
          {/* <form action="#" method="POST">
            <button type="submit" className="btn-recuperar-contraseña">
              Olvide mi contraseña
            </button>
          </form> */}
        </div>
      </section>
      <section className="top-para-footer"></section>
    </>
  );
};

export default Iniciar_sesion_administrador;
