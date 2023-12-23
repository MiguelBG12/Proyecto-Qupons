import React from "react";
import "../../index.css";
import { BrowserRouter as Router, Route, Routes} from "react-router-dom";

// Importar componentes que quieres mostrar en diferentes rutas

const Index_administrador = () => {
    return (
      <>
        <Router>
          <Routes>
            <Route path="/panel-administrador" element={<Panel_administrador/>} exact />
            <Route path="/perfil-administrador" element={<Perfil_administrador/>} />
            <Route path="/estadisticas" element={<Estadisticas/>} />
            <Route path="/tiendas" element={<Tiendas/>} />
            <Route path="/crear-tienda" element={<Crear_tienda/>} />
            <Route path="/cupones-administrador" element={<Cupones_administrador/>} />
            <Route path="/crear-cupones-administrador" element={<Crear_cupones_administrador/>} />
            <Route path="/cupones-obtenidos-administrador" element={<Crear_cupones_administrador/>} />
            <Route path="/crear-categorias" element={<Crear_categorias/>} />
          </Routes>
        </Router>
      </>
    );  
  };
  
  export default Index_administrador; 