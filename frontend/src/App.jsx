import React from "react";
import "./index.css";
import { BrowserRouter as Router, Route, Routes} from "react-router-dom";
import Inicio from "./pages/inicio";
import Cupones from "./pages/cupones";
import Registrar_tienda from "./pages/registrar-tienda";
import Registrate from "./pages/registrate";
import Login from "./pages/iniciar-sesion-administrador";

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
          <Route path="/registrar-tienda" element={<Registrar_tienda/>} />
          <Route path="/registrar-usuario" element={<Registrate/>} />
          <Route path="/login" element={<Login/>} />
          
          <Route path="/adminitrador-panel" element={<Panel_administrador/>} exact />
          <Route path="/adminitrador-perfil" element={<Perfil_administrador/>} />
          <Route path="/adminitrador-estadisticas" element={<Estadisticas_administrador/>} />
          <Route path="/adminitrador-ver-tiendas" element={<Tiendas/>} />
          <Route path="/adminitrador-crear-tienda" element={<Crear_tienda/>} />
          <Route path="/adminitrador-ver-cupones" element={<Cupones_administrador/>} />
          <Route path="/adminitrador-crear-cupones" element={<Crear_cupones_administrador/>} />
          <Route path="/adminitrador-cupones-obtenidos" element={<Cupones_obtenidos_administrador/>} />
          <Route path="/adminitrador-crear-categorias" element={<Crear_categorias/>} />

          <Route path="/tienda-panel" element={<Panel_tienda/>} exact />
          <Route path="/tienda-perfil" element={<Perfil_tienda/>} />
          <Route path="/tienda-estadisticas" element={<Estadisticas_tienda/>} />
          <Route path="/tienda-ver-cupones" element={<Cupones_tienda/>} />
          <Route path="/tienda-crear-cupones" element={<Crear_cupones_tienda/>} />

          <Route path="/usuario-panel" element={<Panel_usuario/>} exact />
          <Route path="/usuario-perfil" element={<Perfil_usuario/>} />
          <Route path="/usuario-ver-cupones" element={<Cupones_usuario/>} />
          <Route path="/usuario-cupones-obtenidos" element={<Cupones_obtenidos_usuario/>} />
          
        </Routes>
      </Router>
    </>
  );  
};

export default App;
