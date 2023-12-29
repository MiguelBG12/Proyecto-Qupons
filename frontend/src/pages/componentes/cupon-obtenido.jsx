import "./css/cupon.css";
import promo4 from "../../assets/img/promo4.jpg";

const Cupon_obtenido = () => {
  return (
    <>
      <div className="base-cupon">
        <img src={promo4} />

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

        <a href="#"><button className="btn-obtener-cupon">Descargar PDF</button></a>
      </div>
    </>
  );
};
export default Cupon_obtenido;
