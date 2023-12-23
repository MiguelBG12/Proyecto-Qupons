import React from "react";
import "../../index.css";
import { BrowserRouter as Router, Route, Routes} from "react-router-dom";
import Panel_administrador from "./paginas-administrador/panel-administrador";
import Perfil_administrador from "./paginas-administrador/perfil-administrador";
import Estadisticas_administrador from "./paginas-administrador/estadisticas-administrador";
import Tiendas from "./paginas-administrador/tiendas";
import Crear_tienda from "./paginas-administrador/crear-tienda";
import Cupones_administrador from "./paginas-administrador/cupones-administrador";
import Crear_cupones_administrador from "./paginas-administrador/crear-cupones-administrador";
import Cupones_obtenidos_administrador from "./paginas-administrador/cupones-obtenidos-administrador";
import Crear_categorias from "./paginas-administrador/crear-categorias";

// Importar componentes que quieres mostrar en diferentes rutas

const Index_administrador = () => {
    return (
      <>
        <Router>
          <Routes>
            <Route path="/panel-administrador" element={<Panel_administrador/>} exact />
            <Route path="/perfil-administrador" element={<Perfil_administrador/>} />
            <Route path="/estadisticas-administrador" element={<Estadisticas_administrador/>} />
            <Route path="/tiendas" element={<Tiendas/>} />
            <Route path="/crear-tienda" element={<Crear_tienda/>} />
            <Route path="/cupones-administrador" element={<Cupones_administrador/>} />
            <Route path="/crear-cupones-administrador" element={<Crear_cupones_administrador/>} />
            <Route path="/cupones-obtenidos-administrador" element={<Cupones_obtenidos_administrador/>} />
            <Route path="/crear-categorias" element={<Crear_categorias/>} />
          </Routes>
        </Router>
      </>
    );  
  };
  
  export default Index_administrador; 