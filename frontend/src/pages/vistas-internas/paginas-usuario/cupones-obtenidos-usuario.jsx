import React from "react";
import "../componentes-internos/css/plantilla-interna-general.css";
import Header_interno from "../componentes-internos/header-interno";
import Footer from "../../componentes/footer";
import Menu_vertical_usuario from "../componentes-internos/menu-vertical-usuario";
import Info_cupones_obtenidos_usuario from "./componentes-usuario/info-cupones-obtenidos-usuario";

const Cupones_obtenidos_usuario = () => {
  return (
    <>
      <Header_interno />
      <section className="contenido-pagina">
        <div className="container">
          <div className="container-grid">
            <div className="container-menu-vertical">
              <Menu_vertical_usuario />
            </div>
            <div className="container-section">
              <Info_cupones_obtenidos_usuario/>
            </div>
          </div>
        </div>
      </section>
      <Footer />
    </>
  );
};
export default Cupones_obtenidos_usuario;
