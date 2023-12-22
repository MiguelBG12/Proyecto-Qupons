import React from "react";
import "./index.css";
import { BrowserRouter as Router, Route, Routes} from "react-router-dom";
import Inicio from "./pages/inicio";
import Cupones from "./pages/cupones";
import Registrar_tienda from "./pages/registrar-tienda";
import Registrate from "./pages/registrate";
import Iniciar_sesion from "./pages/iniciar-sesion";

// Importar componentes que quieres mostrar en diferentes rutas

const App = () => {
  return (
    <>
      <Router>
        <Routes>
          <Route path="/" element={<Inicio/>} exact />
          <Route path="/cupones" element={<Cupones/>} />
          <Route path="/registra-tu-tienda" element={<Registrar_tienda/>} />
          <Route path="/registrate" element={<Registrate/>} />
          <Route path="/iniciar-sesion" element={<Iniciar_sesion/>} />
        </Routes>
      </Router>
    </>
  );  
};

export default App;
