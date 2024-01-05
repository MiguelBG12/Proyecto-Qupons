import { useNavigate } from "react-router-dom";
import axios from "axios";
import "./css/seccion-iniciar-sesion.css";
import { useEffect, useState } from "react";

const Login_general = () => {
  const [datos, setDatos] = useState({
    email: "",
    password: "",
  });

  const navigate = useNavigate();

  useEffect(() => {
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
        const token = response.data.access_token; 
        const payloadBase64 = token.split('.')[1];
        const payloadJson = JSON.parse(atob(payloadBase64));
        
        console.log("Payload decodificado:", payloadJson);
        console.log("rol_id:", payloadJson.rol_id);

        if (payloadJson && payloadJson.access_token !== "") {
          localStorage.setItem("access_token", token);
          if (payloadJson.rol_id === 1) {
            navigate("/administrador-panel");
          } else if (payloadJson.rol_id === 2) {
            navigate("/tienda-panel")
          } else if (payloadJson.rol_id === 3) {
            navigate("/usuario-panel");
          } else {
            alert("Tipo de usuario no reconocido");
          }
          
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
