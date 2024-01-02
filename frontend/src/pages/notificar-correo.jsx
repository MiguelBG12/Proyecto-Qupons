import React from "react";
import Header from "./componentes/header";
import Footer from "./componentes/footer";
import Aviso_correo from "./componentes/aviso-correo";


const Notificar_correo = () => {
    return (
        <>
        <Header/>
        <Aviso_correo/>
        <Footer/>
        </>
    );
};

export default Notificar_correo;