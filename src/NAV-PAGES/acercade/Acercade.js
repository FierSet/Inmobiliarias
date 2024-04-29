import { people } from "./Peope";

function Acercade() {

    return (
        <div className="acerca-de-base">
            <div className="descripcion">
                <h1>Quiénes Somos</h1>
                <hr />
                Nuestra objetivo principal es brindar un servicio de atención personalizada de principio a fin a nuestros clientes.
                <p className="marge-text" />
                Ofrecemos servicios adicionales a nuestros clientes para una mejor experiencia de compra/renta como:
                <p className="marge-text" />
                Trámite de Créditos Hipotecarios, Trámite de Pólizas Jurídicas, Avaluos Profesionales y Opiniones de Valor, Administración de Rentas y Servicios de Mantenimiento General
                <p className="marge-text" />
                Para nuestro equipo de asesores siempre será un placer servirle y ser parte de su experiencia en inmobiliaria.
            </div>
            <br/>
            <div className="personal-base">
                {
                    Object.keys(people).map(peoples =>
                    (
                        <div className="carta-persona">
                            {
                                Object.keys(people[peoples]).map(p => (
                                    <>
                                        {
                                            p === 'Img' ?
                                                <div className="zonaimagen">
                                                    <img src={people[peoples][p]} />
                                                </div>
                                                :
                                                p === 'social' ?
                                                    <div className="datos">
                                                        {
                                                            Object.keys(people[peoples][p]).map(s => (
                                                                <a href={people[peoples][p][s][0]} target="_blank">
                                                                    {people[peoples][p][s][1]}
                                                                </a>
                                                            ))
                                                        }
                                                    </div>
                                                    :
                                                    <div className="name-profecion">
                                                        <h7>{people[peoples][p]}</h7>
                                                    </div>
                                        }
                                    </>
                                ))
                            }
                        </div>
                    ))
                }
            </div>
        </div>
    );
}

export default Acercade;