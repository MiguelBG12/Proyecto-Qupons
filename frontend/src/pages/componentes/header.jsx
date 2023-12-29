import "./css/header.css";

const Header = () => {
  return (
    <>
      <header>
        <div className="container">
          <div className="contenedor-nav">
            <div className="logo-header">
              <h1>Qupons</h1>
            </div>
            <nav>
              <div className="menu">
                <a href="/">INICIO</a>
                <a href="/cupones">VER CUPONES</a>
                <a href="/registrar-tienda" className="btn-verde">REGISTRE SU TIENDA</a>
                <a href="/registrar-usuario" className="btn-verde">REGISTRATE</a>
                <a href="/acceso-tienda" className="btn-blanco">ACCESO TIENDA</a>
                <a href="/acceso-usuario" className="btn-blanco">ACCESO USUARIO</a>
              </div>
            </nav>
          </div>
        </div>
      </header>
    </>
  );
};
export default Header;
