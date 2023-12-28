import React from "react";
import "../paginas-administrador/css/panel-administrador.css";
import Header_interno from "../componentes-internos/header-interno";
import Footer from "../../componentes/footer";
import Menu_vertical_tienda from "../componentes-internos/menu-vertical-tienda";
const Perfil_tienda = () => {
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
                
            </div>
          </div>
        </div>
      </section>
      <Footer />
    </>
  );
};
export default Perfil_tienda;
