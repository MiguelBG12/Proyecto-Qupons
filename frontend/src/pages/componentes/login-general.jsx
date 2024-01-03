import axios from "axios";
import "./css/seccion-iniciar-sesion.css";
import { useEffect, useState } from "react";

const Login_general = () => {

	/*En esta parte colocar la funcion de conexión con el empoint de backend con fech o axios*/

	const [datos, setDatos] = useState({
		email: '',
		password: ''
	});

	const [isLoading, setIsLoading] = useState(false);

	useEffect(() => {
        // load default data
    });

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
			username: datos.email, 
			password: datos.password 
		};
		
		const url = "http://localhost:8000/login";

		setIsLoading(true); // Activar el indicador de carga

		axios({
            method: "post",
            url: url,
            data: json,
            //responseType: 'application/json'
        })
            .then(function(response) {
                const data = response.data;
                if (data && data.access_token != "") {
					localStorage.setItem("token", data.access_token);
                    document.location.href = "/adminitrador-panel";
                } else {
                    alert("Usuario o password errados");
                }
            })
            .catch(function(response) {
                alert("Error al consultar los datos");
				console.log(response);
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
						<input type="text" placeholder="Correo electronico:" name="correo" onChange={handleInputChange} value={datos.email} required />
						<br />
						<input type="password" placeholder="Contraseña:" name="contrasenna" onChange={handleInputChange} value={datos.password} required />
						<br />
						<button type="submit" className="btn-enviar" disabled={isLoading}>
							{isLoading ? 'Enviando...' : 'Enviar'}
						</button>
					</form>
					<a href="/recuperar-contraseña"><button className="btn-recuperar-contraseña">Olvide mi contraseña</button></a>

				</div>
			</section>
			<section className="top-para-footer"></section>
		</>
	);
};

export default Login_general;