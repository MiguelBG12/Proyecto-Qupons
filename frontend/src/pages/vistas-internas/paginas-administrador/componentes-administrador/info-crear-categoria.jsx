import React from "react";
import "./css/info-crear-categoria.css";

const Info_crear_categoría = () => {
  return (
    <>
      <h1 className="titulo-formulario-crear-categoria">Crear categorías</h1>
      <form action="#" method="POST">
        <input type="text" placeholder="Nombre de la categoría:" required />
        {/* <br />
        <br />
        <label htmlFor="">Logo de la categoría</label>
        <input type="file" id="archivo" name="archivo" accept=".jpg, .jpeg, .png" required></input>
        <br /> */}
        <button type="submit" className="btn-enviar">Crear</button>
      </form>
    </>
  );
};
export default Info_crear_categoría;
