import "./css/seccion-pasos.css";


const Seccion_pasos = () => {
  return (
    <>
    <section className="seccion-pasos">
      <div className="container">
        <div className="container-pasos">
          <div className="base-paso">
          <i class="fa-solid fa-user"></i>
            <h2>1. Registrate</h2>
            <p>Únete a nuestra lista se suscriptores para recibir las mejores ofertas</p>
          </div>
          <div className="base-paso">
          <i class="fa-solid fa-ticket"></i>
            <h2>2. Opten un cupón</h2>
            <p>Con solo un click puedes ganar grandes descuentos de las mejores tiendas.</p>
          </div>
          <div className="base-paso">
          <i class="fa-solid fa-shop"></i>
            <h2>3. valida en tienda</h2>
            <p>Descarga tu cupón de descuento en PDF y validalo en la tienda.</p>
          </div>
        </div>
      </div>
    </section>
    </>
  );
};

export default Seccion_pasos;
