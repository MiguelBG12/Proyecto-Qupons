import React from "react";
import "./css/info-crear-tienda.css";

const Info_crear_tienda = () => {
  return (
    <>
      <h1 className="titulo-formulario-crear-tienda">Crear nueva tienda</h1>
      <form action="#" method="POST">
        <input type="text" placeholder="Nombre de la tienda:" required />
        <br />
        <input type="text" placeholder="Nombre del contacto:" required />
        <br />
        <input type="tel" placeholder="Teléfono:" required />
        <br />
        <input type="email" placeholder="Correo electrónico:" required />
        <br />
        <input type="text" placeholder="RUC:" required />
        <br />
        <input type="text" placeholder="Razon social:" required />
        <br />
        <input type="text" placeholder="Dirección:" required />
        <br />
        <br />
        <label htmlFor="">Logo de la tienda</label>
        <input type="file" id="archivo" name="archivo" accept=".jpg, .jpeg, .png" required></input>
        <br />
        <input type="password" placeholder="Nueva contraseña:" required />
        <br />
        <input type="password" placeholder="Repetir nueva contraseña:" required />
        <br />
        <button type="submit" className="btn-enviar">Crear</button>
      </form>
    </>
  );
};
export default Info_crear_tienda;
