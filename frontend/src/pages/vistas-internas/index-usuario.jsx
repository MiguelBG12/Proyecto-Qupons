import React from "react";
import "../../index.css";
import { BrowserRouter as Router, Route, Routes} from "react-router-dom";

// Importar componentes que quieres mostrar en diferentes rutas

const Index_usuario = () => {
    return (
      <>
        <Router>
          <Routes>
            <Route path="/panel-usuario" element={<Panel_usuario/>} exact />
            <Route path="/perfil-usuario" element={<Perfil_usuario/>} />
            <Route path="/cupones-usuario" element={<Cupones_usuario/>} />
            <Route path="/cupones-obtenidos-usuario" element={<Cupones_obtenidos_usuario/>} />
          </Routes>
        </Router>
      </>
    );  
  };
  
  export default Index_usuario; 