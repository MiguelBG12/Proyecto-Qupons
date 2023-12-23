import React from "react";
import "../../index.css";
import { BrowserRouter as Router, Route, Routes} from "react-router-dom";

// Importar componentes que quieres mostrar en diferentes rutas

const Index_tienda = () => {
    return (
      <>
        <Router>
          <Routes>
            <Route path="/panel-tienda" element={<Panel_tienda/>} exact />
            <Route path="/perfil-tienda" element={<Perfil_tienda/>} />
            <Route path="/estadisticas" element={<Estadisticas/>} />
            <Route path="/cupones-tienda" element={<Cupones_tienda/>} />
            <Route path="/crear-cupones-tienda" element={<Crear_cupones_tienda/>} />
          </Routes>
        </Router>
      </>
    );  
  };
  
  export default Index_tienda; 