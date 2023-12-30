import React from "react";
import "../../../componentes/sesion-tienda";
import "./css/info-perfil-tienda.css";

const Info_perfil_tienda = () => {
  return (
    <>
    <h1 className="titulo-intranet">Mantenga los datos de su tienda actualizados</h1>
      <section className="formulario">
      <form action="#" method="POST">
            <input type="text" placeholder="Nombre de tienda:" required />
            <br />
            <input type="text" placeholder="Nombre del contacto:" required />
            <br />
            <input type="tel" placeholder="Teléfono:" required />
            <br />
            <input type="email" placeholder="Correo electronico:" required />
            <br />
            <input type="text" placeholder="RUC:" required />
            <br />
            <input type="text" placeholder="Razón social:" required />
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
            <button type="submit" className="btn-enviar">
              Actualizar tienda
            </button>
          </form>

      </section>
    </>
  );
};
export default Info_perfil_tienda;