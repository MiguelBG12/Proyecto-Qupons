import React, { useState, useEffect } from "react";
import axios from "axios";
import "./css/info-tiendas-listado.css";
import LogoTienda from "../../../../assets/img/Logo-tienda.png";

const InfoTiendasListado = () => {
  const [clientes, setClientes] = useState([]);

  useEffect(() => {
    // Obtener la lista de clientes al cargar la página
    axios.get("http://localhost:8000/admin/ver_clientes")
    .then((response) => {
      const dataTienda = response.data.result[0]; // Obtener la lista de clientes del resultado
      setClientes(dataTienda);
    })
    .catch((error) => {
      console.error("Error al obtener la lista de clientes", error);
    });
  }, []); // El array vacío indica que este efecto solo se ejecutará una vez al montar el componente

  const handleEliminarClick = (cliente_tienda_id) => {
    // Hacer la llamada a Axios para eliminar la tienda con el ID correspondiente
    console.log("Antes de la llamada a Axios para eliminar:", cliente_tienda_id);
    axios.delete(`http://localhost:8000/admin/borrar_cliente/${cliente_tienda_id}`)
      .then(() => {
        // Actualizar la lista de clientes después de eliminar
        console.log("Eliminación exitosa. Actualizando lista de clientes...");
        setClientes((prevClientes) => prevClientes.filter((cliente) => cliente.cliente_tienda_id !== cliente_tienda_id));
      })
      .catch((error) => {
        console.error("Error al eliminar la tienda", error);
      });
  };

  return (
    <>
      {clientes.map((cliente) => (
        <div key={cliente.cliente_tienda_id} className="tienda-listado">
          <div className="logo-tienda">
            <img src={LogoTienda} alt="Logo de tienda" />
          </div>
          <div className="Datos-tienda-listado">
            <h4>{cliente.nombre_empresa}</h4>
            <p>RUC: {cliente.ruc}</p>
            <p>Razón Social: {cliente.razon_social}</p>
            <p>Dirección: {cliente.direccion}</p>
            <p>Correo: {cliente.correo}</p>
            <p>Nombre de Contacto: {cliente.nombre_contacto}</p>
            <p>Teléfono: {cliente.telefono}</p>
          </div>
          <div className="botones-tienda-listado">
            <button className="btn-eliminar" onClick={() => handleEliminarClick(cliente.cliente_tienda_id)}>
              <i className="fa-solid fa-trash"></i>Eliminar
            </button>
          </div>
        </div>
      ))}
    </>
  );
};

export default InfoTiendasListado;