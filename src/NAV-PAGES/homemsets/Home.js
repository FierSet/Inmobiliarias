import img1 from '../../IMG/Default/Backroom1.jpg';
import img2 from '../../IMG/Default/Backroom2.jpg';
import img3 from '../../IMG/Default/Backroom3.webp';

import Listpreview from './homelist';
import Singleelement from './show_single_element';
import Listones from './listones';

import { useEffect, useState } from 'react';

const IMAGENBASE = {
    0: img1,
    1: img2,
    2: img3
}

function Home(props) {
    const [objetocasa, setobjetocasa] = useState([]);

    const [pagina] = useState(props.paginabase + "inmoviaria.php");

    const [esbusqueda, setesbusqueda] = useState(false);
    const [muestralocal, setmuestralocal] = useState(false);

    const [singelelement, setsingelelement] = useState([]);

    const [tipo_propiedad, settipo_propiedad] = useState("Bodega comercial");
    const [status_loca, setstatus_loca] = useState("Renta");

    useEffect(() => {
        //console.log(pagina)
        conectiondba(setobjetocasa);
        return () => {
            // Lógica de limpieza aquí
        };
    }, []);

    const conectiondba = async (extractor) => {

        fetch(pagina)
            .then((res) => res.json())
            .then((data) => {

                //console.log(Object.keys(data));
                extractor(data)

            }).catch((err) => console.log(err))

    }

    return (
        <div key='home' className="home">
            <div key='section-filtro' className='section-filtro'>

                <div className='filtro'>
                    <select className='status-desplegable' name='status' onChange={v => setstatus_loca(v.target.value)}>
                        {
                            props.status_tipo_locca.map(e => ( //e como elemento
                                //compara las llave de cada elemento
                                Object.keys(e).toString() === 'status_local' ?

                                    e['status_local'] !== "Cancelado" ?
                                        <option key={e['status_local']} value={e['status_local']}>{e['status_local']}</option>
                                        : null

                                    : null
                            ))
                        }
                    </select>

                    <select className='tipolocal-desplegable' name='tipo-local' onChange={v => settipo_propiedad(v.target.value)}>
                        {
                            props.status_tipo_locca.map(e => ( //e como elemento
                                //compara las llave de cada elemento
                                Object.keys(e).toString() === 'tipo_propiedad' ?
                                    <option
                                        key={e['tipo_propiedad']}
                                        value={e['tipo_propiedad']}>
                                        {e['tipo_propiedad']}
                                    </option>
                                    : null
                            ))
                        }
                    </select>
                    {
                        !esbusqueda ?
                            <button id='buttonsearch' onClick={() => setesbusqueda(true)}>Buscar</button>
                            :
                            null
                    }

                </div>

            </div>

            <div className='space' />

            {
                !esbusqueda ?
                    // extrae 3 elementos aleatorios de la base de datos
                    <Previewhome objetocasa={objetocasa}
                        setmuestralocal={setmuestralocal} //permite editar ña variable 'muestralocal' para ocultar la ventana
                        singelelement={singelelement} //datos de cala elemento
                        setsingelelement={setsingelelement} //cambia los datos de cada elemento
                    />
                    : // crea una lista mediante consultrad sql
                    <Listpreview paginabase={props.paginabase} //manda la direccion del servidor
                        tipo_propiedad={tipo_propiedad} //necesaria para hacer la busqueda
                        status_loca={status_loca} //necesaria para hacer la busqueda
                        IMAGENBASE={IMAGENBASE} // por si no tiene imagenes
                        setmuestralocal={setmuestralocal}//permite editar ña variable 'muestralocal' para ocultar la ventana
                        singelelement={singelelement} //datos de cala elemento
                        setsingelelement={setsingelelement} //cambia los datos de cada elemento
                    />
            }

            {
                muestralocal ? <Singleelement setmuestralocal={setmuestralocal} singelelement={singelelement} IMAGENBASE={IMAGENBASE} /> : null
            }
            <br />
            <hr />

            <Listones paginabase={props.paginabase}/>
            
        </div>
    );

}



function Previewhome(props) {
    return (
        <div key='section-casalocal' className='section-casalocal'>

            <div className='view-localles'>

                {/* */}
                {
                    props.objetocasa.map(casalocal => (
                        <div className='casa-local' >

                            <div className='status-casalocal' >{casalocal['status_local']}</div> {/* solo muestra el estatus del local */}

                            <button className='button-vew' onClick={() => { props.setmuestralocal(true); props.setsingelelement(casalocal) }}>Visualizar</button> {/* permite abrir otra ventana para visualizar los detalles de cada elemento */}

                            <div className='caracteristicas'>
                                {/* image */}
                                <div className='slider-wrapper'>

                                    <div className='slider'>
                                        {
                                            [1, 2, 3].map(i => (

                                                casalocal['Imagen' + i] !== null ?
                                                    <img key={casalocal['ID'] + 'Imagen' + i} id={casalocal['ID'] + 'Imagen' + i} src={casalocal['Imagen' + i]} alt='' />
                                                    :
                                                    <img key={casalocal['ID'] + 'Imagen' + i} id={casalocal['ID'] + 'Imagen' + i} src={IMAGENBASE[Math.floor(Math.random() * 3)]} alt='' />
                                            ))
                                        }
                                    </div>

                                    <div className='slider-nav'>
                                        {
                                            [1, 2, 3].map(i => (
                                                <a href={"#" + casalocal['ID'] + 'Imagen' + i} key={"#" + casalocal['ID'] + 'Imagen' + i} aria-hidden="true" />
                                            ))
                                        }
                                    </div>

                                </div>

                                <div className='datos'>
                                    <div className='dato' id='titulo'> {casalocal['tipo_propiedad']}</div>
                                    <div className='dato' id='precio'>${new Intl.NumberFormat().format(casalocal['precio'])}</div>
                                    <div className='dato' id='lugar'> {casalocal['calle'] + ', ' + casalocal['Codigo_postal']}</div>

                                    <div className='dato'>
                                        {
                                            casalocal['recamaras'] !== null ?
                                                <><i className="fa-solid fa-bed"></i> {casalocal['recamaras']} Recamara &#160;</>
                                                : null
                                        }

                                        {
                                            casalocal['banos'] !== null ?
                                                <><i className='fa-solid fa-shower'></i> {casalocal['banos']} Banos &#160;</>
                                                : null
                                        }

                                        {
                                            casalocal['area'] !== null ?
                                                <><i className="fa-solid fa-maximize"></i> {casalocal['area']}m&sup2; &#160;</>
                                                : null
                                        }

                                        {
                                            casalocal['estacionamientos'] !== null ?
                                                <><i className="fa-solid fa-car"></i> {casalocal['estacionamientos']} estacionamientos</>
                                                : null
                                        }

                                    </div>

                                </div>

                            </div>

                        </div>
                    ))
                }

                {/**
                     
                        <div className = 'casa-local'>

                        <div className = 'status-casalocal'>Venta/Renta</div>

                        <div className = 'caracteristicas'>
                            {/* image */}{/*
                            <div className = 'slider-wrapper'>
                                
                                <div className = 'slider'>
                                    <img id = 'image1' src = {props.img} alt = ''/>
                                    <img id = 'image2' src = {props.logo} alt = ''/>
                                    <img id = 'image3' src = {props.img} alt = ''/>
                                </div>

                                <div className = 'slider-nav'>
                                    <a href='#image1' aria-hidden="true" />
                                    <a href = '#image2' aria-hidden = "true" />
                                    <a href = '#image3' aria-hidden = "true" />
                                </div>

                            </div>
                            
                            <div className = 'datos'>
                                <div className = 'dato'>titulo</div>
                                <div className = 'dato'>$$$$</div>
                                <div className = 'dato'>lugar</div>
                                <div className = 'dato'>
                                <i className = "fa-solid fa-bed"></i> 1 Vivienda &#160;
                                <i className = "fa-solid fa-shower"></i> Baños &#160;
                                <i className = "fa-solid fa-maximize"></i> 200 &#13217;
                                </div>
                            </div>

                        </div>

                    </div>

                     */}

            </div>

        </div>
    )
}

export default Home;