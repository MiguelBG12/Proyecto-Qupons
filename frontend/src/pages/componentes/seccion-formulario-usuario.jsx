const Seccion_formulario_usuario = () => {
  return (
    <>
      <div className="fondo-seccion-formulario-verde"></div>
      <div className="fondo-seccion-formulario-blanco">
        <div className="contenedor-formulario">
          <h2>Únete y disfruta de grandes descuentos </h2>
          <p>con</p>
          <button>Registrate con Gmail</button>
          <p>ó</p>
          <form action="#" method="get">
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
                -- Genero --
              </option>
              <option value="opcion1">Mujer</option>
              <option value="opcion2">hombre</option>
              <option value="opcion3">Prefiero no especificar</option>
            </select>
            <br />
            <input type="text" placeholder="Dirección:" required />
            <br />
            <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" required/>
            <br />
            <input type="password" placeholder="Contraseña:" required />
            <br />
            <input type="password" placeholder="Repetir contraseña:" required />
            <br />
            <input type="submit" value="Iniciar Sesión" />
          </form>

          <form action="#" method="get">
            <input type="submit" value="Recuperar contraseña" />
          </form>
        </div>
      </div>
    </>
  );
};

export default Seccion_formulario_usuario;
