import React from "react";
import "./css/info-panel.css";
import ImgDoble from "../../../assets/img/img-doble.png";
import Img1 from "../../../assets/img/img-1.png";
import Img2 from "../../../assets/img/img-2.png";
import Img3 from "../../../assets/img/img-3.png";
import Img4 from "../../../assets/img/img-4.png";

const Info_panel = () => {
  return (
    <>
      <div className="containewr-imagenes-panel">
        <div className="img-ancho-completo">
          <img src={ImgDoble} alt="foto doble" />
        </div>
        <div className="doble-img">
          <div>
            <img src={Img1} />
          </div>
          <div>
            <img src={Img2} />
          </div>
          <div></div>
        </div>
        <div className="doble-img">
          <div>
            <img src={Img3} />
          </div>
          <div>
            <img src={Img4} />
          </div>
        </div>
      </div>
    </>
  );
};
export default Info_panel;
