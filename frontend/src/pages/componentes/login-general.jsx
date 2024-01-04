import { useNavigate } from "react-router-dom";
import axios from "axios";
import "./css/seccion-iniciar-sesion.css";
import { useEffect, useState } from "react";

const Login_general = () => {
  const [datos, setDatos] = useState({
    email: "",
    password: "",
  });

  // Agrega un estado para manejar la redirección
  const navigate = useNavigate();

  useEffect(() => {
    // load default data
  }, []);

  const handleInputChange = (event) => {
    const target = event.target;
    const value = target.type === "checkbox" ? target.checked : target.value;
    const name = target.name;

    setDatos({
      ...datos,
      [name]: value,
    });
  };

  const handleSubmit = (event) => {
    event.preventDefault();

    const json = {
      correo: datos.email,
      contrasenna: datos.password,
    };
    console.log(json);

    const url = "http://localhost:8000/login";

    axios({
      method: "post",
      url: url,
      data: json,
    })
      .then(function (response) {
        const data = response.data;
        if (data && data.access_token !== "") {
          // No manejar el token de acceso aquí
          localStorage.setItem("access_token", data.access_token);
          console.log(data.access_token)
          document.location.href = "/adminitrador-panel";
        } else {
          alert("Usuario o contraseña incorrectos");
        }
      })
      .catch(function (error) {
        alert("Error al consultar los datos");
        console.log("Error al consultar los datos", error);
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
              name="email"
              onChange={handleInputChange}
              value={datos.email}
              required
            />
            <br />
            <input
              type="password"
              placeholder="Contraseña:"
              name="password"
              onChange={handleInputChange}
              value={datos.password}
              required
            />
            <br />
            <button type="submit" className="btn-enviar">
              Enviar
            </button>
          </form>
          <a href="/recuperar-contraseña">
            <button className="btn-recuperar-contraseña">
              Olvidé mi contraseña
            </button>
          </a>
        </div>
      </section>
      <section className="top-para-footer"></section>
    </>
  );
};

export default Login_general;
