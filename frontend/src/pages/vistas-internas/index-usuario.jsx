import React from "react";
import "../../index.css";
import { BrowserRouter as Router, Route, Routes} from "react-router-dom";
import Panel_usuario from "./paginas-usuario/panel-usuario";
import Perfil_usuario from "./paginas-usuario/perfil-usuario";
import Cupones_usuario from "./paginas-usuario/cupones-usuario";
import Cupones_obtenidos_usuario from "./paginas-usuario/cupones-obtenidos-usuario";

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