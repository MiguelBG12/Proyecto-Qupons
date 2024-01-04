import axios from "axios";
import "./css/seccion-iniciar-sesion.css";
import { useEffect, useState } from "react";

const Login_general = () => {
  const [datos, setDatos] = useState({
    correo: '',
    contrasenna: ''
  });

  const [isLoading, setIsLoading] = useState(false);

  useEffect(() => {
    // load default data
  }, []);

  const handleInputChange = (event) => {
    const target = event.target;
    const value = target.type === 'checkbox' ? target.checked : target.value;
    const name = target.name;

    setDatos({
      ...datos,
      [name]: value
    });
  };

  const handleSubmit = (event) => {
    event.preventDefault();

    const json = {
      username: datos.correo,
      password: datos.contrasenna
    };

    const url = "http://localhost:8000/login";

    setIsLoading(true);

    axios({
      method: "post",
      url: url,
      data: json,
      //responseType: 'application/json'
    })
      .then(function (response) {
        const data = response.data;
        if (data && data.access_token !== "") {
          localStorage.setItem("token", data.access_token);
          document.location.href = "/administrador-panel";
        } else {
          alert("Usuario o contraseña incorrectos");
        }
      })
      .catch(function (error) {
        alert("Error al consultar los datos");
        console.log("Error al consultar los datos", error.response.data); // Agregado console.log
      })
      .finally(() => {
        setIsLoading(false);
      });
  };

  return (
    <>
      <section className="seccion-verde-formulario"></section>
      <section className="seccion-blanca-formulario">
        <div className="contenedor-formulario">
          <h1>Iniciar sesión</h1>
          <form onSubmit={handleSubmit}>
            <input
              type="text"
              placeholder="Correo electrónico:"
              name="correo"
              onChange={handleInputChange}
              value={datos.correo}
              required
            />
            <br />
            <input
              type="password"
              placeholder="Contraseña:"
              name="contrasenna"
              onChange={handleInputChange}
              value={datos.contrasenna}
              required
            />
            <br />
            <button type="submit" className="btn-enviar" disabled={isLoading}>
              {isLoading ? 'Enviando...' : 'Enviar'}
            </button>
          </form>
          <a href="/recuperar-contraseña">
            <button className="btn-recuperar-contraseña">Olvidé mi contraseña</button>
          </a>
        </div>
      </section>
      <section className="top-para-footer"></section>
    </>
  );
};

export default Login_general;
