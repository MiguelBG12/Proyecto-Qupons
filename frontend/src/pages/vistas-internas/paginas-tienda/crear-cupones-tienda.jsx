import React from "react";
import "../componentes-internos/css/plantilla-interna-general.css";
import Header_interno from "../componentes-internos/header-interno";
import Footer from "../../componentes/footer";
import Menu_vertical_tienda from "../componentes-internos/menu-vertical-tienda";
import Info_crear_cupones_tienda from "./componentes-tienda/info-crear-cupones-tienda";
const Crear_cupones_tienda = () => {
  return (
    <>
      <Header_interno />
      <section className="contenido-pagina">
        <div className="container">
          <div className="container-grid">
            <div className="container-menu-vertical">
              <Menu_vertical_tienda />
            </div>
            <div className="container-section">
              <Info_crear_cupones_tienda/>
            </div>
          </div>
        </div>
      </section>
      <Footer />
    </>
  );
};
export default Crear_cupones_tienda;
