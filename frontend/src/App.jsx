import React from "react";
import "./index.css";
import { BrowserRouter as Router, Route, Routes} from "react-router-dom";
import Inicio from "./pages/inicio";
import Cupones from "./pages/cupones";
import Registrar_tienda from "./pages/registrar-tienda";
import Registrate from "./pages/registrate";
import Iniciar_sesion from "./pages/iniciar-sesion";

import Panel_administrador from "./pages/vistas-internas/paginas-administrador/panel-administrador";
import Perfil_administrador from "./pages/vistas-internas/paginas-administrador/perfil-administrador";
import Estadisticas_administrador from "./pages/vistas-internas/paginas-administrador/estadisticas-administrador";
import Tiendas from "./pages/vistas-internas/paginas-administrador/tiendas";
import Crear_tienda from "./pages/vistas-internas/paginas-administrador/crear-tienda";
import Cupones_administrador from "./pages/vistas-internas/paginas-administrador/cupones-administrador";
import Crear_cupones_administrador from "./pages/vistas-internas/paginas-administrador/crear-cupones-administrador";
import Cupones_obtenidos_administrador from "./pages/vistas-internas/paginas-administrador/cupones-obtenidos-administrador";
import Crear_categorias from "./pages/vistas-internas/paginas-administrador/crear-categorias";

import Panel_tienda from "./pages/vistas-internas/paginas-tienda/panel-tienda";
import Perfil_tienda from "./pages/vistas-internas/paginas-tienda/perfil-tienda";
import Estadisticas_tienda from "./pages/vistas-internas/paginas-tienda/estadisticas-tienda";
import Cupones_tienda from "./pages/vistas-internas/paginas-tienda/cupones-tienda";
import Crear_cupones_tienda from "./pages/vistas-internas/paginas-tienda/crear-cupones-tienda";

import Panel_usuario from "./pages/vistas-internas/paginas-usuario/panel-usuario";
import Perfil_usuario from "./pages/vistas-internas/paginas-usuario/perfil-usuario";
import Cupones_usuario from "./pages/vistas-internas/paginas-usuario/cupones-usuario";
import Cupones_obtenidos_usuario from "./pages/vistas-internas/paginas-usuario/cupones-obtenidos-usuario";



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
          
          <Route path="/panel-administrador" element={<Panel_administrador/>} exact />
          <Route path="/perfil-administrador" element={<Perfil_administrador/>} />
          <Route path="/estadisticas-administrador" element={<Estadisticas_administrador/>} />
          <Route path="/tiendas" element={<Tiendas/>} />
          <Route path="/crear-tienda" element={<Crear_tienda/>} />
          <Route path="/cupones-administrador" element={<Cupones_administrador/>} />
          <Route path="/crear-cupones-administrador" element={<Crear_cupones_administrador/>} />
          <Route path="/cupones-obtenidos-administrador" element={<Cupones_obtenidos_administrador/>} />
          <Route path="/crear-categorias" element={<Crear_categorias/>} />

          <Route path="/panel-tienda" element={<Panel_tienda/>} exact />
          <Route path="/perfil-tienda" element={<Perfil_tienda/>} />
          <Route path="/estadisticas-tienda" element={<Estadisticas_tienda/>} />
          <Route path="/cupones-tienda" element={<Cupones_tienda/>} />
          <Route path="/crear-cupones-tienda" element={<Crear_cupones_tienda/>} />

          <Route path="/panel-usuario" element={<Panel_usuario/>} exact />
          <Route path="/perfil-usuario" element={<Perfil_usuario/>} />
          <Route path="/cupones-usuario" element={<Cupones_usuario/>} />
          <Route path="/cupones-obtenidos-usuario" element={<Cupones_obtenidos_usuario/>} />
          
        </Routes>
      </Router>
    </>
  );  
};

export default App;
