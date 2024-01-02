import React from "react";
import { useEffect } from "react";
import "./css/info-cupones-administrador.css";
import Cupon from "../../../componentes/cupon";

const Info_cupones_administrador = () => {

  useEffect(() => {
    
		const url = "http://localhost:8000/login";
    const token = localStorage.getItem("token");

		axios({
            method: "post",
            url: url,
            data: json,
            headers: { 'Authorization': "Bearer " + token }
            //headers: { 'autorization': token }
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
            });
  });

  return (
    <>
    <div className="container-cupones">

    <Cupon object={cupon}/>

    </div>
    </>
  );
};
export default Info_cupones_administrador;