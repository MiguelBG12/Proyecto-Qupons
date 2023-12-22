import React from "react";
import "../../index.css";
import { BrowserRouter as Router, Route, Routes} from "react-router-dom";

// Importar componentes que quieres mostrar en diferentes rutas

const Index_administrador = () => {
    return (
      <>
        <Router>
          <Routes>
            <Route path="/panel" element={<Panel/>} exact />
          </Routes>
        </Router>
      </>
    );  
  };
  
  export default Index_administrador; 