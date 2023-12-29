import React from "react";
import "../componentes-internos/css/plantilla-interna-general.css";
import Header_interno from "../componentes-internos/header-interno";
import Footer from "../../componentes/footer";
import Menu_vertical_usuario from "../componentes-internos/menu-vertical-usuario";
import Info_panel from "../componentes-internos/info-panel";
const Panel_usuario = () => {
  return (
    <>
      <Header_interno />
      <section className="contenido-pagina">
        <div className="container">
          <div className="container-grid">
            <div className="container-menu-vertical">
              <Menu_vertical_usuario/>
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
export default Panel_usuario;
