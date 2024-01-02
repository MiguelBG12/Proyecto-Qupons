import "./css/seccion-iniciar-sesion.css";

const Olvide_contraseña = () => {

  /*En esta parte colocar la funcion de conexión con el empoint de backend con fech o axios*/

  return (
    <>
      <section className="seccion-verde-formulario"></section>
      <section className="seccion-blanca-formulario">
        <div className="contenedor-formulario">
          <h1>Recuperar contraseña</h1>
          <form action="#" method="POST">
            <input type="text" placeholder="Correo electronico:" required />
            <br />
            <button type="submit" className="btn-enviar">
              Enviar
            </button>
          </form>
        </div>
      </section>
      <section className="top-para-footer"></section>
    </>
  );
};

export default Olvide_contraseña;