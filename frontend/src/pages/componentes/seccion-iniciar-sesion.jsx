import "../../index.css";
import "./css/seccion-iniciar-sesion.css";

const Seccion_iniciar_sesion = () => {
  return (
    <>
      <div className="fondo-seccion-formulario-verde">
      </div>
      <div className="fondo-seccion-formulario-blanco">
        <div className="contenedor-formulario">
          <h2>Iniciar sesion</h2>
          <p>con</p>
          <button>Iniciar sesión con Gmail</button>
          <p>ó</p>
          <form action="#" method="get">
            <input type="text" placeholder="Correo electronico:" required />
            <br />
            <input type="password" placeholder="contraseña:" required />
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

export default Seccion_iniciar_sesion;
