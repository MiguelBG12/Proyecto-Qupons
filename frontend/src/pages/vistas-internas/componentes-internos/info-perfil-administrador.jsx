import React from "react";
import "../../componentes/sesion_tienda";
import "./css/info-perfil-administrador.css";

const Info_perfil_administrador = () => {
  return (
    <>
    <h1 className="titulo-intranet">Manten tus datos actualizados</h1>
      <section className="formulario">
      <form action="#" method="POST">
            <input type="text" placeholder="Nombre Completo:" required />
            <br />
            <input type="tel" placeholder="Teléfono:" required />
            <br />
            <input type="email" placeholder="Correo electronico:" required />
            <br />
            <input type="text" placeholder="DNI:" required />
            <br />
            <select id="opciones" name="opciones" required>
              <option value="" disabled selected>
                -- Género --
              </option>
              <option value="opcion1">Mujer</option>
              <option value="opcion2">hombre</option>
              <option value="opcion3">Prefiero no especificar</option>
            </select>
            <br />
            <input type="text" placeholder="Dirección:" required />
            <br />
            <br />
            <label htmlFor="">Fecha de nacimiento:</label>
            <input
              type="date"
              id="fecha_nacimiento"
              name="fecha_nacimiento"
              required
            />
            <br />
            <input type="password" placeholder="Nueva contraseña:" required />
            <br />
            <input type="password" placeholder="Repetir nueva contraseña:" required />
            <br />
            <button type="submit" className="btn-enviar">
              Actualizar
            </button>
          </form>

      </section>
    </>
  );
};
export default Info_perfil_administrador;