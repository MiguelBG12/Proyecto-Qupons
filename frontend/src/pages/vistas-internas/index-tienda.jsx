import React from "react";
import "../../index.css";
import { BrowserRouter as Router, Route, Routes} from "react-router-dom";
import Panel_tienda from "./paginas-tienda/panel-tienda";
import Perfil_tienda from "./paginas-tienda/perfil-tienda";
import Estadisticas_tienda from "./paginas-tienda/estadisticas-tienda";
import Cupones_tienda from "./paginas-tienda/cupones-tienda";
import Crear_cupones_tienda from "./paginas-tienda/crear-cupones-tienda";


// Importar componentes que quieres mostrar en diferentes rutas

const Index_tienda = () => {
    return (
      <>
        <Router>
          <Routes>
            <Route path="/panel-tienda" element={<Panel_tienda/>} exact />
            <Route path="/perfil-tienda" element={<Perfil_tienda/>} />
            <Route path="/estadisticas-tienda" element={<Estadisticas_tienda/>} />
            <Route path="/cupones-tienda" element={<Cupones_tienda/>} />
            <Route path="/crear-cupones-tienda" element={<Crear_cupones_tienda/>} />
          </Routes>
        </Router>
      </>
    );  
  };
  
  export default Index_tienda; 