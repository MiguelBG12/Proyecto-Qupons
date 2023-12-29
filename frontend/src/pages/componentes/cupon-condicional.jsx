import "./css/cupon.css";
import promo7 from "../../assets/img/promo7.jpg";

const Cupon_condicional = () => {
  return (
    <>
      <div className="base-cupon">
        <img src={promo7} />
        <br />
        <h3 className="titulo-cupon">Nombre cupón</h3>

        <p className="descripcion-cupon">Descripcion del cupón</p>

        <h4 className="texto-descuento"><span className="porcentaje">30%</span> de descuento</h4>

        <div className="container-precios">
          <div>
            <p className="ahora"> Ahora:</p>
            <h4 className="precio-ahora"> s/45.00</h4>
          </div>

          <div>
            <p className="antes"> Antes:</p>
            <h4 className="precio-antes"> s/58.00</h4>
          </div>
        </div>

        <a href="/registrar-usuario"><button className="btn-obtener-cupon">Registrate ahora</button></a>
      </div>
    </>
  );
};
export default Cupon_condicional;
