import Listpreview from './homelist';
import Singleelement from './show_single_element';
import Listones from './listones';

import Card from '../../js_element/card.js';

import { useEffect, useState } from 'react';

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
                        setmuestralocal={setmuestralocal}//permite editar ña variable 'muestralocal' para ocultar la ventana
                        singelelement={singelelement} //datos de cala elemento
                        setsingelelement={setsingelelement} //cambia los datos de cada elemento
                    />
            }

            <Singleelement setmuestralocal={setmuestralocal} muestralocal = {muestralocal} singelelement={singelelement} />
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
                {
                    props.objetocasa.map(casalocal => 
                    (
                        <Card casalocal = {casalocal} interface={props} />
                    ))
                }
            </div>

        </div>
    )
}

export default Home;