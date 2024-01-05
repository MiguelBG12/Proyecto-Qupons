/*cupon.jsx*/
import "./css/cupon.css";
import promo2 from "../../assets/img/promo2.jpg";

const Cupon = ({ object }) => {
  const descuentoPorcentaje = (((object.precio_normal - object.precio_oferta) / object.precio_normal) * 100).toFixed(2);
  return (
    <>
      <div className="base-cupon">
        <img src={promo2} />

        <br />
        <h3 className="titulo-cupon">{ object.titulo }</h3>

        <p className="descripcion-cupon">{ object.descripcion }</p>

        <h4 className="texto-descuento"><span className="porcentaje">{descuentoPorcentaje}%</span> de descuento</h4>

        <div className="container-precios">
          <div>
            <p className="ahora"> Ahora: </p>
            <h4 className="precio-ahora"> s/{object.precio_oferta.toFixed(2)}</h4>
          </div>

          <div>
            <p className="antes"> Antes:</p>
            <h4 className="precio-antes">s/{object.precio_normal.toFixed(2)}</h4>
          </div>
        </div>

        <a href="#"><button className="btn-obtener-cupon">Obtener cupón</button></a>
      </div>
    </>
  );
};
export default Cupon;
