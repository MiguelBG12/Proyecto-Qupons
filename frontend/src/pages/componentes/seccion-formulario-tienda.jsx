const Seccion_formulario_tienda = () => {
  return (
    <>
      <div className="fondo-seccion-formulario-verde"></div>
      <div className="fondo-seccion-formulario-blanco">
        <div className="contenedor-formulario">
          <h2>Registra tu tienda y crea promociones </h2>

          <form action="#" method="get">
            <input type="text" placeholder="Nombre de la tienda:" required />
            <br />
            <input type="text" placeholder="Nombre del contacto:" required />
            <br />
            <input type="tel" placeholder="Teléfono:" required />
            <br />
            <input type="email" placeholder="Correo electronico:" required />
            <br />
            <input type="text" placeholder="RUC:" required />
            <br />
            <input type="text" placeholder="Razon social:" required />
            <br />
            <input type="password" placeholder="contraseña:" required />
            <br />
            <input type="text" placeholder="Dirección:" required />
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

export default Seccion_formulario_tienda;
