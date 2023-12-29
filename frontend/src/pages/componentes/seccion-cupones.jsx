import "./css/seccion-cupones.css";
import Cupon_condicional from "./cupon-condicional";

const Seccion_cupones = () => {
  return (
    <>
      <section className="seccion-cupones">
        <div className="container">
          <h1>¡Todos los descuentos estan aquí!</h1>
          <div className="container-cupones-condicional">
            <Cupon_condicional/>
            <Cupon_condicional/>
            <Cupon_condicional/>
            <Cupon_condicional/>
            <Cupon_condicional/>
            <Cupon_condicional/>
            <Cupon_condicional/>
            <Cupon_condicional/>
          </div>
        </div>
      </section>
    </>
  );
};

export default Seccion_cupones;
