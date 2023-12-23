import React from "react";
import Header from "./componentes/header";
import Footer from "./componentes/footer";
import Seccion_cupones from "./componentes/seccion-cupones";

const Cupones = () => {
    return (
        <>
        <Header/>
        <h1>Cupones</h1>
        <Seccion_cupones/>
        <Footer/>
        </>
    );
};

export default Cupones;