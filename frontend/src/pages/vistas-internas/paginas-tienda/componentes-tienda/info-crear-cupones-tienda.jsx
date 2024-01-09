import React, { useState, useEffect } from "react";
import axios from "axios";
import "./css/info-crear-cupones-tienda.css";

const Info_crear_cupones_tienda = () => {
  const [datos, setDatos] = useState({
    titulo: "",
    descripcion: "",
    categorias_id: "",
    fecha_inicio: "",
    fecha_vencimiento: "",
    precio_normal: "",
    precio_oferta: "",
    disenno_oferta_foto: "",
  });

  const [exitoMensaje, setExitoMensaje] = useState(null);
  const [categorias, setCategorias] = useState([]);

  useEffect(() => {
    // Obtener categorías del servidor y almacenarlas en el estado
    axios({
      method: "get",
      url: "http://localhost:8000/admin/ver_categorias",
    })
      .then(function (response) {
        console.log(response);
        console.log(response.data);

        // Asumiendo que response.data.result es un array
        const categoriasFromResponse = response.data.result[0] || [];
        setCategorias(categoriasFromResponse);
      })
      .catch(function (error) {
        console.error("Error al ver categorías", error);
        // Manejar errores
      });
  }, []); // Ejecutar solo una vez al montar el componente

  const crearCupon = () => {
    const storedToken = localStorage.getItem("access_token");

    const token = storedToken.split(".")[1];
    const payloadJson = JSON.parse(atob(token));
    const cliente_tienda_id = payloadJson.cliente_tienda_id;

    axios({
      method: "post",
      url: "http://localhost:8000/stores/crear_cupon_tienda",
      headers: {
        Authorization: `Bearer ${storedToken}`,
      },
      data: { ...datos, cliente_tienda_id },
    })
      .then(function (response) {
        console.log(response);
        console.log(response.data);

        // Mostrar mensaje de éxito
        setExitoMensaje("¡Se creó un nuevo cupón con éxito!");
        setDatos({
          titulo: "",
          descripcion: "",
          categorias_id: "",
          fecha_inicio: "",
          fecha_vencimiento: "",
          precio_normal: "",
          precio_oferta: "",
          disenno_oferta_foto: "",
        });
      })
      .catch(function (error) {
        console.error("Error al crear cupón", error);
        // Manejar errores
      });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log("Datos antes de enviar", datos);
    crearCupon();
  };

  return (
    <>
      <h1 className="titulo-crear-cupones-tienda">Crear cupón</h1>
      <form onSubmit={handleSubmit}>
        {exitoMensaje && <p className="mensaje-exito">{exitoMensaje}</p>}
        <input
          type="text"
          placeholder="Titulo:"
          required
          value={datos.titulo}
          onChange={(e) => setDatos({ ...datos, titulo: e.target.value })}
        />
        <input
          type="text"
          placeholder="Descripción:"
          required
          value={datos.descripcion}
          onChange={(e) => setDatos({ ...datos, descripcion: e.target.value })}
        />
        <select
          id="opciones"
          name="opciones"
          required
          value={datos.categorias_id}
          onChange={(e) => setDatos({ ...datos, categorias_id: e.target.value })}>
          <option key="" value="" disabled defaultValue>
            -- Categorías --
          </option>
          {Array.isArray(categorias) && categorias.map((categoria) => (
            <option key={categoria.categorias_id} value={categoria.categorias_id}>
              {categoria.nombre}
            </option>
          ))}
        </select>
        <label htmlFor="">Fecha de inicio: </label>
        <input
          type="date"
          id="fecha_inicio"
          name="fecha_inicio"
          required
          value={datos.fecha_inicio}
          onChange={(e) => setDatos({ ...datos, fecha_inicio: e.target.value })}
        />
        <label htmlFor="">Fecha de vencimiento: </label>
        <input
          type="date"
          id="fecha_vencimiento"
          name="fecha_vencimiento"
          required
          value={datos.fecha_vencimiento}
          onChange={(e) => setDatos({ ...datos, fecha_vencimiento: e.target.value })}
        />
        <input
          type="number"
          placeholder="Precio normal"
          required
          value={datos.precio_normal}
          onChange={(e) => setDatos({ ...datos, precio_normal: e.target.value })}
        />
        <input
          type="number"
          placeholder="Precio promocional"
          required
          value={datos.precio_oferta}
          onChange={(e) => setDatos({ ...datos, precio_oferta: e.target.value })}
        />
        <br />
        <br />
        <label htmlFor="">
          Imagen del diseño - Tamaño 800 x 800 pixeles - Formatos: jpg, jpeg, png.
        </label>
        <input
          type="file"
          id="archivo"
          accept=".jpg, .jpeg, .png"
          required
          value={datos.disenno_oferta_foto}
          onChange={(e) => setDatos({ ...datos, disenno_oferta_foto: e.target.value })}
        />
        <button type="submit" className="btn-enviar">
          Crear
        </button>
      </form>
    </>
  );
};

export default Info_crear_cupones_tienda;
