import "./css/seccion-iniciar-sesion.css";

const Login_general = () => {

  /*En esta parte colocar la funcion de conexión con el empoint de backend con fech o axios*/

  return (
    <>
      <section className="seccion-verde-formulario"></section>
      <section className="seccion-blanca-formulario">
        <div className="contenedor-formulario">
          <h1>Iniciar sesión</h1>
          <form action="#" method="POST">
            <input type="text" placeholder="Correo electronico:" required />
            <br />
            <input type="password" placeholder="Contraseña:" required />
            <br />
            <button type="submit" className="btn-enviar">
              Enviar
            </button>
          </form>
            <a href="/recuperar-contraseña"><button className="btn-recuperar-contraseña">Olvide mi contraseña</button></a>

        </div>
      </section>
      <section className="top-para-footer"></section>
    </>
  );
};

export default Login_general;