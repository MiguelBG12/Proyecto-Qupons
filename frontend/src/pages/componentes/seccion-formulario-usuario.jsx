import "./css/seccion-formulario-usuario.css";

const Seccion_formulario_usuario = () => {
  return (
    <>
      <section className="seccion-verde-formulario"></section>
      <section className="seccion-blanca-formulario">
        <div className="contenedor-formulario">
          <h1>Registrate</h1>
          <p><span className="texto-formulario">con</span></p>
          <button className="btn-gmail">Gmail</button>
          <p><span className="texto-formulario">ó</span></p>
          <form action="#" method="POST">
            <input type="text" placeholder="Nombre Completo:" required />
            <br />
            <input type="tel" placeholder="Teléfono:" required />
            <br />
            <input type="email" placeholder="Correo electronico:" required />
            <br />
            <input type="password" placeholder="contraseña:" required />
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
            <input
              type="date"
              id="fecha_nacimiento"
              name="fecha_nacimiento"
              required
            />
            <br />
            <input type="password" placeholder="Contraseña:" required />
            <br />
            <input type="password" placeholder="Repetir contraseña:" required />
            <br />
            <button type="submit" className="btn-enviar">
              Enviar
            </button>
          </form>

          <form action="#" method="POST">
            <button type="submit" className="btn-recuperar-contraseña">
              Olvide mi contraseña
            </button>
          </form>
        </div>
      </section>

      <section className="top-para-footer-usuario"></section>
    </>
  );
};

export default Seccion_formulario_usuario;
