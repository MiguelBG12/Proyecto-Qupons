import React from "react";
import Header from "./componentes/header";
import Footer from "./componentes/footer";
import Iniciar_sesion_usuario from "./componentes/sesion-usuario";


const Acceso_usuario = () => {
    return (
        <>
        <Header/>
        <Iniciar_sesion_usuario/>
        <Footer/>
        </>
    );
};

export default Acceso_usuario;