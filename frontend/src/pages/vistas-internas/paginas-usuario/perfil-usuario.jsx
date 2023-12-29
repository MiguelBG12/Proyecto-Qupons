import React from "react";
import "../componentes-internos/css/plantilla-interna-general.css";
import Header_interno from "../componentes-internos/header-interno";
import Footer from "../../componentes/footer";
import Menu_vertical_usuario from "../componentes-internos/menu-vertical-usuario";
const Perfil_usuario = () => {
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
                
            </div>
          </div>
        </div>
      </section>
      <Footer />
    </>
  );
};
export default Perfil_usuario;
