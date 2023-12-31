import React from "react";
import Header from "./componentes/header";
import Footer from "./componentes/footer";
import Iniciar_sesion_administrador from "./componentes/sesion-administrador";


const Acceso_administrador = () => {
    return (
        <>
        <Header/>
        <Iniciar_sesion_administrador/>
        <Footer/>
        </>
    );
};

export default Acceso_administrador;