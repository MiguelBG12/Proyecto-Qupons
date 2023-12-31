import "./css/seccion-iniciar-sesion.css";

const Iniciar_sesion_administrador = () => {
  return (
    <>
      <section className="seccion-verde-formulario"></section>
      <section className="seccion-blanca-formulario">
        <div className="contenedor-formulario">
          <h1>Acceso administrador</h1>
          <form action="#" method="POST">
            <input type="text" placeholder="Correo electronico:" required />
            <br />
            <input type="password" placeholder="Contraseña:" required />
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
      <section className="top-para-footer"></section>
    </>
  );
};

export default Iniciar_sesion_administrador;