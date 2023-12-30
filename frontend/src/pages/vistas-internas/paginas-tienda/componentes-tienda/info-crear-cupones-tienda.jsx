import React from "react";
import "./css/info-crear-cupones-tienda.css";

const Info_crear_cupones_tienda = () => {
  return (
    <>
      <h1 className="titulo-crear-cupones-tienda">Crear cupón</h1>
      <form action="#" method="POST">
        <input type="text" placeholder="Titulo:" required />
        <br />
        <input type="text" placeholder="Descripción:" required />
        <br />
        <select id="opciones" name="opciones" required>
              <option value="" disabled selected>
                -- Categorías --
              </option>
              <option value="opcion1">Categoría 1</option>
              <option value="opcion2">Categoría 2</option>
              <option value="opcion3">Categoría 3</option>
        </select>
        <label htmlFor="">Fecha de inicio: </label>
            <input
              type="date"
              id="fecha_nacimiento"
              name="fecha_nacimiento"
              required
            />
        <br />
        <label htmlFor="">Fecha de vencimiento: </label>
            <input
              type="date"
              id="fecha_nacimiento"
              name="fecha_nacimiento"
              required
            />
        <br />
        <input type="number" placeholder="Precio normal" required />
        <br />
        <input type="number" placeholder="Precio promocional" required />
        <br />
        <br />
        <label htmlFor="">Imagen del diseño - Tamaño 800 x 800 pixeles - Formatos: jpg, jpeg, png. </label>
        <input type="file" id="archivo" name="archivo" accept=".jpg, .jpeg, .png" required></input>
        <br />
        <button type="submit" className="btn-enviar">Crear</button>
      </form>
    </>
  );
};
export default Info_crear_cupones_tienda;
