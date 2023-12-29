import React from "react";
import Header from "./componentes/header";
import Footer from "./componentes/footer";
import Iniciar_sesion_tienda from "./componentes/sesion-tienda";

const Acceso_tienda = () => {
    return (
        <>
        <Header/>
        <Iniciar_sesion_tienda/>
        <Footer/>
        </>
    );
};

export default Acceso_tienda;