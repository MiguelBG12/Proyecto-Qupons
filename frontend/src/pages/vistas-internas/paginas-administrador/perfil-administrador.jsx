import React from "react";
import "../../../index.css";
import "../componentes-internos/css/plantilla-interna-general.css";
import Header_interno from "../componentes-internos/header-interno";
import Footer from "../../componentes/footer";
import Menu_vertical_administrador from "../componentes-internos/menu-vertical-administrador";
import Info_perfil_administrador from "./componentes-administrador/info-perfil-administrador";

const Perfil_administrador = () => {
  return (
    <>
      <Header_interno />
      <section className="contenido-pagina">
        <div className="container">
          <div className="container-grid">
            <div className="container-menu-vertical">
              <Menu_vertical_administrador />
            </div>
            <div className="container-section">
              <Info_perfil_administrador/>
            </div>
          </div>
        </div>
      </section>
      <Footer />
    </>
  );
};
export default Perfil_administrador;
