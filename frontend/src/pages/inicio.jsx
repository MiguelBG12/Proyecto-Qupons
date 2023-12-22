import React from "react";
import Header from "./componentes/header";
import Footer from "./componentes/footer";
import Slider from "./componentes/slider";
import Seccion_cupones from "./componentes/seccion-cupones";
import Seccion_pasos from "./componentes/seccion-pasos";
import Seccion_marcas from "./componentes/seccion-marcas";

const Inicio = () => {
  return (
    <>
    <Header/>
    <h1>Inicio</h1>
    <Slider/>
    <Seccion_cupones/>
    <Seccion_pasos/>
    <Seccion_marcas/>
    <Footer/>
    </>
  );
};
export default Inicio;