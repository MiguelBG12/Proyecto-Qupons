import React from "react";
import "../paginas-administrador/css/panel-administrador.css";
import Header_interno from "../componentes-internos/header-interno";
import Footer from "../../componentes/footer";
import Menu_vertical_tienda from "../componentes-internos/menu-vertical-tienda";
import Info_panel from "../componentes-internos/info-panel";
const Panel_tienda = () => {
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
              <Info_panel/>
            </div>
          </div>
        </div>
      </section>
      <Footer />
    </>
  );
};
export default Panel_tienda;
