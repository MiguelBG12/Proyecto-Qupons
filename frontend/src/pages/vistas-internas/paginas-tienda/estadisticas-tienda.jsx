import React from "react";
import "../componentes-internos/css/plantilla-interna-general.css";
import Header_interno from "../componentes-internos/header-interno";
import Footer from "../../componentes/footer";
import Menu_vertical_tienda from "../componentes-internos/menu-vertical-tienda";
import Info_estadisticas_tienda from "./componentes-tienda/info-estadisticas-tienda";
const Estadisticas_tienda = () => {
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
                <Info_estadisticas_tienda/>
            </div>
          </div>
        </div>
      </section>
      <Footer />
    </>
  );
};
export default Estadisticas_tienda;
