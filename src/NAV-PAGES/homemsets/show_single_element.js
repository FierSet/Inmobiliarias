import { useState } from "react";

function Singleelement(props) {

    const [imagen, setimagen] = useState('');
    const [showimagen, setshowimagen] = useState(false);

    return (
        <div className='single-element-base' >
            <div className='single-local' >
                <div className='status-casalocal' >{props.singelelement['status_local']}</div> {/* solo muestra el estatus del local */}

                <div className='close' onClick={() => props.setmuestralocal(false)}><i class="fa-solid fa-x"></i></div>

                <div className='datos-carta' >
                    <div className='dato-carta-titulo' id='titulo'> {'ID: ' + props.singelelement['ID'] + ' - ' + props.singelelement['tipo_propiedad']}</div>
                    <div className='dato-carta-precio' id='precio'>
                        ${new Intl.NumberFormat().format(props.singelelement['precio'])}
                    </div>
                    
                    <div className='dato-carta-lugar' id='lugar'>
                        {
                            props.singelelement['calle'] + ', ' +
                            props.singelelement['Codigo_postal'] + ', ' +
                            props.singelelement['ciudad'] + ', ' +
                            props.singelelement['Region'] + ', ' +
                            props.singelelement['pais']
                        }
                    </div>
                    <br/>
                    <div className='dato-carta'>
                        {
                            props.singelelement['recamaras'] !== null ?
                                <h6><i className="fa-solid fa-bed"></i> {props.singelelement['recamaras']} Recamara &#160;</h6>
                                : null
                        }

                        {
                            props.singelelement['banos'] !== null ?
                                <h6><i className='fa-solid fa-shower'></i> {props.singelelement['banos']} Banos &#160;</h6>
                                : null
                        }

                        {
                            props.singelelement['area'] !== null ?
                                <h6>Construcción <i className="fa-solid fa-maximize"></i> {props.singelelement['area']} m&sup2; &#160;</h6>
                                : null
                        }

                        {
                            props.singelelement['estacionamientos'] !== null ?
                                <h6><i className="fa-solid fa-car"></i> {props.singelelement['estacionamientos']} estacionamientos</h6>
                                : null
                        }
                    </div>

                    <div className="descripcion">{props.singelelement['desripcion']}</div>
                    
                    <hr/>

                    <div className="imagen-zone">
                        {
                            [1, 2, 3].map(i => (

                                props.singelelement['Imagen' + i] !== null ?
                                    <img onClick={() => {setimagen(props.singelelement['Imagen' + i]); setshowimagen(true);}} key={props.singelelement['ID'] + 'Imagen' + i} id={props.singelelement['ID'] + 'Imagen' + i} src={props.singelelement['Imagen' + i]} alt='' />
                                    :
                                    <img key={props.singelelement['ID'] + 'Imagen' + i} id={props.singelelement['ID'] + 'Imagen' + i} src={props.IMAGENBASE[Math.floor(Math.random() * 3)]} alt='' />
                            ))
                        }
                    </div>

                </div>
            </div>
            {
                showimagen ?
                    <div className='single-imagen' onClick={() => setshowimagen(false)}>
                        <img src={imagen}/>
                    </div>
                    : null
            }
        </div>
    );
}

export default Singleelement;