import "./css/seccion-formulario-tienda.css";

const Seccion_formulario_tienda = () => {
  return (
    <>
      <div className="fondo-seccion-formulario-verde"></div>
      <div className="fondo-seccion-formulario-blanco">
        <div className="contenedor-formulario"></div>
      </div>

      <section className="seccion-verde-formulario"></section>
      <section className="seccion-blanca-formulario">
        <div className="contenedor-formulario">
          <h1>Registre su tienda</h1>

          <form action="#" method="POST">
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
            <input type="text" placeholder="Razón social:" required />
            <br />
            <input type="text" placeholder="Dirección:" required />
            <br />
            <br />
            <label htmlFor="">Logo de la tienda</label>
            <input type="file" id="archivo" name="archivo" accept=".jpg, .jpeg, .png" required></input>
            <br />
            <input type="password" placeholder="Contraseña:" required />
            <br />
            <input type="password" placeholder="Repetir contraseña:" required />
            <br />
            <button type="submit" className="btn-enviar">
              Registrar
            </button>
          </form>
        </div>
      </section>
      <section className="top-para-footer-tienda"></section>
    </>
  );
};

export default Seccion_formulario_tienda;
