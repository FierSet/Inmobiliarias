import { useState } from "react";
import img1 from '../IMG/Default/Backroom1.jpg';
import img2 from '../IMG/Default/Backroom2.jpg';
import img3 from '../IMG/Default/Backroom3.webp';

const IMAGENBASE = {
    0: img1,
    1: img2,
    2: img3
}

function Singleelement(props) {

    const [imagen, setimagen] = useState('');
    const [showimagen, setshowimagen] = useState(false);

    useEffect(() => {
        //console.log(pagina)
        handleJump();
        return () => {};
    }, []);

    const handleJump = () => {
        const moveto = document.getElementById('single-element-base');
        if (moveto) 
        {
            moveto.scrollIntoView({ behavior: 'smooth' });
        }
    };

    return (
        <div id = 'single-element-base' className={`single-element-base${props.muestralocal ? '' : ' hide'}`} >
            <div id = 'single-local' className='single-local' >

                <div className = 'header-casalical'>
                    <div className='close' onClick={() => props.setmuestralocal(false)}><i class="fa-solid fa-x"></i></div>

                    <div className='status-casalocal' >{props.singelelement['status_local']}</div> {/* solo muestra el estatus del local */}
                </div> 

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
                    <div className="imagenbox">
                        <div className="imagen-zone">
                            {
                                [1, 2, 3].map(i => (
                                    props.singelelement['Imagen' + i] !== null ?
                                        <img onClick={() => {setimagen(props.singelelement['Imagen' + i]); setshowimagen(true);}} key={props.singelelement['ID'] + 'Imagen' + i} id={props.singelelement['ID'] + 'Imagen' + i} src={props.singelelement['Imagen' + i]} alt='' />
                                        :
                                        <img key={IMAGENBASE[i] + 'Imagen' + i} id={IMAGENBASE[i] + 'Imagen' + i} src={IMAGENBASE[i]} alt='' />
                                ))
                            }
                        </div>
                    </div>
                </div>
            </div>
            {
                <div className={`single-imagen${showimagen ? '' : ' hide'}`} onClick={() => setshowimagen(false)}>
                    <img src={imagen}/>
                </div>

            }
        </div>
    );
}

export default Singleelement;