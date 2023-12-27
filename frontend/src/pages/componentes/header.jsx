import "./css/header.css";

const Header = () => {
  return (
    <>
      <header>
        <div className="container">
          <div className="contenedor-nav">
            <div className="logo-header">
              <h1>QUPONS</h1>
            </div>
            <nav>
              <div className="menu">
                <a href="/">INICIO</a>
                <a href="/cupones">CUPONES</a>
                <a href="/registra-tu-tienda" className="btn-verde">REGISTRA TU TIENDA</a>
                <a href="/registrate" className="btn-verde">REGISTRATE</a>
                <a href="/iniciar-sesion" className="btn-blanco">INICIAR SESION</a>
              </div>
            </nav>
          </div>
        </div>
      </header>
    </>
  );
};
export default Header;
