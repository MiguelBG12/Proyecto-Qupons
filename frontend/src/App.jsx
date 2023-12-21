import React from "react";
import "./App.css";
import { BrowserRouter as Router, Route } from "react-router-dom";
import inicio from "./pages/inicio";
import cupones from "./pages/cupones";
import registrar_tienda from "./pages/registrar-tienda";
import registrate from "./pages/registrate";
import iniciar_sesion from "./pages/iniciar-sesion";

// Importar componentes que quieres mostrar en diferentes rutas

const App = () => {
  return (
    <>
    <div><h1>Hola</h1></div>
      <Router>
        <div>
            <Route path= '/' exact component = {inicio}/>
            <Route path= '/cupones'  component = {cupones}/>
            <Route path= '/registra-tu-tienda'  component = {registrar_tienda}/>
            <Route path= '/registrate'  component = {registrate}/>
            <Route path= '/iniciar-sesion'  component = {iniciar_sesion}/>
        </div>
      </Router>
    </>
  );
}

export default App;
