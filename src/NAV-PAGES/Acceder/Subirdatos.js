import { useState, useEffect } from "react";

import Card from '../../js_element/card.js'
import Singleelement from '../homemsets/show_single_element';

function Casalocalupdate(props) {

    const [cancelar, setcancelar] = useState(false);

    const [status_tipo_locca, setstatus_tipo_locca] = useState([]); //array el cual extrae el tipo y status del local

    const [idsearch, stidsearch] = useState(null) //id del elemento que se desea buscar

    const todaystart = new Date();

    const baselocal = { //nos permite vaciar los valores para volverlos a editar
        ID: 0,
        tipo_propiedad: 'Casa',
        status_local: 'Renta',
        calle: 'street',
        Codigo_postal: '00000',
        ciudad: 'CDMX',
        Region: 'CDMX',
        pais: 'Mexico',
        recamaras: '1',
        banos: '1',
        estacionamientos: '1',
        area: '100',
        precio: '10000',
        desripcion: 'EXAMPLE DESCRIPTION',
        Imagen1: null,
        Imagen2: null,
        Imagen3: null,
        fechainicio: `${todaystart.getFullYear()}-${todaystart.getMonth() + 1}-${todaystart.getDate()}`,
        fechadeactualizacion: `${todaystart.getFullYear()}-${todaystart.getMonth() + 1}-${todaystart.getDate()}`,
        fechatermino: `${todaystart.getFullYear()}-${todaystart.getMonth() + 1}-${todaystart.getDate()}`
    }
    const [localcasa, setlocalcasa] = useState(baselocal) // solo se usa para buscar informacion
    const [muestralocal, setmuestralocal] = useState(false);
    const [singelelement, setsingelelement] = useState([]);

    useEffect(() => {
        conectiondbapost(null, 'status_local.php');
        return () => {
            // Lógica de limpieza aquí
        };
    }, []);

    const conectiondbapost = async (requestOptions, page) => {

        //console.log(props.paginabase)
        var links = props.paginabase + page;
        //console.log(links)
        fetch(links, requestOptions) // props.paginabase + 'check_key.php?Key=' + key
            .then((res) => res.text()) // extrae en formato json
            .then((data) => { //
                //console.log(data)
                extaerdatalocal(data, page)

            }).catch((err) => console.log(err))

    }

    const extaerdatalocal = (data, page) => {
        var tojason = null;

        if (page === 'local_search.php') {
            if (data === 'No found') {
                stidsearch(null)
                //setshowtable(false)
                cargabusqueda()
                alert(data)
            }
            else {
                tojason = JSON.parse(data)
                stidsearch(null)
                setlocalcasa(tojason[0])
                cargabusqueda()
                //setshowtable(true)
            }
        }
        else if (page === 'status_local.php') {
            tojason = JSON.parse(data)
            // console.log(tojason)
            setstatus_tipo_locca(tojason)
            
        }
        else if (page === 'updatecasalocal.php') {
            alert(data)
        }
        else if (page === 'createcasalocal.php') {
            alert(data)
        }
    }

    const buscarlocal = () => {
        const requestOptions = {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ ID: idsearch })
        };
        //console.log(requestOptions)
        conectiondbapost(requestOptions, 'local_search.php')
    }

    const cargabusqueda = () => {
        
    }

    const verificaddata = () => {
        var today = new Date();

        var bufferlocal = localcasa;
        console.log(bufferlocal)
        var page = '';

        if (localcasa.ID !== 0) {
            bufferlocal.fechadeactualizacion = `${today.getFullYear()}-${today.getMonth() + 1}-${today.getDate()}`;
            if (localcasa.status_local === 'Cancelado')
                bufferlocal.fechatermino = `${today.getFullYear()}-${today.getMonth() + 1}-${today.getDate()}`;
            page = 'updatecasalocal.php';
        }
        else {
            bufferlocal.fechainicio = `${today.getFullYear()}-${today.getMonth() + 1}-${today.getDate()}`;
            bufferlocal.fechadeactualizacion = `${today.getFullYear()}-${today.getMonth() + 1}-${today.getDate()}`;
            page = 'createcasalocal.php';
        }

        const requestOptions = {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(bufferlocal)
        };

        conectiondbapost(requestOptions, page);

        emptyglobal()
        //console.log(bufferlocal);
    }

    const loadpage = (event) => {
        event.preventDefault();


        if (cancelar) 
        {
            emptyglobal()
        }
        else {
            /*
        const requestOptions = {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(constactos)
        }; */
            //conectiondbapost(null, 'updatecontacts.php');
            //console.log(localcasaed)
            verificaddata()

        }
    }

    const emptyglobal = () => {
        setlocalcasa(baselocal)
        setcancelar(false)
        stidsearch(0)
    }


    const handleImputchange = (event) => {
        const { name, value } = event.target;
        setlocalcasa({
            ...localcasa,
            [name]: value,
        });
    }

    return (
        <div className='casalocalupdate-base'>

            <div className='locales-edicion'>

                <div className='section-busqueda'>
                    <div className='busqueda-casalocal'>
                        <input type='number' placeholder="ID" id="id" maxLength='8' name="id"
                            value={idsearch}
                            onChange={v => stidsearch(v.target.value)}
                        ></input>
                        <button className="buscar" onClick={() => {buscarlocal();  }}>buscar</button>
                    </div>
                </div>

            </div>

            <div className='update-datalocal'>

                <div className="casalocal-fields">
                    <form className='localdataupdate-fields' onSubmit={loadpage}>

                        <label >ID:</label>
                        <input 
                            type='number'
                            name='ID'
                            placeholder='ID'
                            id='ID'
                            maxLength='8'
                            disabled
                            value={localcasa.ID}
                            onChange={handleImputchange}>
                            </input>

                        <label>Tipo Propiedad:</label>
                        <select 
                            name='tipo_propiedad' 
                            value={localcasa.tipo_propiedad} 
                            onChange={handleImputchange}>
                            <option 
                                key='empty' 
                                value=''
                            ></option>
                            {
                                status_tipo_locca.map(l => (
                                    Object.keys(l).toString() === 'tipo_propiedad' ?
                                        <option 
                                            key={l['tipo_propiedad']}
                                            value={l['tipo_propiedad']}>
                                            {l['tipo_propiedad']}
                                        </option>
                                        : null
                                ))
                            }
                        </select>

                        <label>Status del Local:</label>
                        <select 
                            name='status_local' 
                            value={localcasa.status_local} 
                            onChange={handleImputchange}
                        >
                            <option 
                            key='empty' 
                            value=''>
                            </option>
                            {
                                status_tipo_locca.map(l => (
                                    Object.keys(l).toString() === 'status_local' ?
                                        <option key={l['status_local']} value={l['status_local']}>{l['status_local']}</option>
                                        : null
                                ))
                            }
                        </select>

                        <label >Calle:</label>
                        <input 
                            type='text'
                            name='calle'
                            placeholder='Calle'
                            id='calle'
                            maxLength='255'
                            required={!cancelar}
                            value={localcasa.calle}
                            onChange={handleImputchange}
                        ></input>

                        <label >Codigo postal:</label>
                        <input type='number'
                            name='Codigo_postal'
                            placeholder='Codigo postal'
                            id='Codigo_postal'
                            maxLength='10'
                            required={!cancelar}
                            value={localcasa.Codigo_postal}
                            onChange={handleImputchange}
                        ></input>

                        <label >Ciudad:</label>
                        <input type='text'
                            name='ciudad'
                            placeholder='Ciudad'
                            id='ciudad'
                            maxLength='255'
                            required={!cancelar}
                            value={localcasa.ciudad}
                            onChange={handleImputchange}
                        ></input>

                        <label >Region:</label>
                        <input type='text'
                            name='Region'
                            placeholder='Region'
                            id='Region'
                            maxLength='255'
                            required={!cancelar}
                            value={localcasa.Region}
                            onChange={handleImputchange}
                        ></input>

                        <label >Pais:</label>
                        <input type='text'
                            name='pais'
                            placeholder='pais'
                            id='pais'
                            maxLength='255'
                            required={!cancelar}
                            value={localcasa.pais}
                            onChange={handleImputchange}
                        ></input>

                        <label >Recamaras:</label>
                        <input type='number'
                            name='recamaras'
                            placeholder='recamaras'
                            id='recamaras'
                            maxLength='2'
                            required={!cancelar}
                            value={localcasa.recamaras}
                            onChange={handleImputchange}
                        ></input>

                        <label >Baños:</label>
                        <input type='number'
                            name='banos'
                            placeholder='Baños'
                            id='banos'
                            maxLength='2'
                            required={!cancelar}
                            value={localcasa.banos}
                            onChange={handleImputchange}
                        ></input>

                        <label >Estacionamientos:</label>
                        <input type='number'
                            name='estacionamientos'
                            placeholder='estacionamientos'
                            id='estacionamientos'
                            maxLength='2'
                            required={!cancelar}
                            value={localcasa.estacionamientos}
                            onChange={handleImputchange}
                        ></input>

                        <label >Area:</label>
                        <input type='number'
                            name='area'
                            placeholder='Area'
                            id='area'
                            required={!cancelar}
                            value={localcasa.area}
                            onChange={handleImputchange}
                        ></input>

                        <label >Precio:</label>
                        <input type='number'
                            name='precio'
                            placeholder='precio'
                            id='precio'
                            required={!cancelar}
                            value={localcasa.precio}
                            onChange={handleImputchange}
                        ></input>

                        <label >Descripcion:</label>
                        <textarea rows='8' cols='75' maxLength='255'
                            name='desripcion'
                            placeholder='Descripcion'
                            id='desripcion'
                            required={!cancelar}
                            value={localcasa.desripcion}
                            onChange={handleImputchange}
                        ></textarea>

                        <label >Imagen 1:</label>
                        <input type='text'
                            name='Imagen1'
                            placeholder='Imagen1'
                            id='Imagen1'
                            maxLength='255'
                            required={!cancelar}
                            value={localcasa.Imagen1}
                            onChange={handleImputchange}
                        ></input>

                        <label >Imagen 2:</label>
                        <input type='text'
                            name='Imagen2'
                            placeholder='Imagen2'
                            id='Imagen2'
                            maxLength='255'
                            required={!cancelar}
                            value={localcasa.Imagen2}
                            onChange={handleImputchange}
                        ></input>

                        <label >Imagen 3:</label>
                        <input type='text'
                            name='Imagen3'
                            placeholder='Imagen3'
                            id='Imagen3'
                            maxLength='255'
                            required={!cancelar}
                            value={localcasa.Imagen3}
                            onChange={handleImputchange}
                        ></input>

                        <label >Fecha de creracion:</label>
                        <input type='text'
                            name='fechainicio'
                            placeholder='fechainicio'
                            id='fechainicio'
                            disabled={!cancelar}
                            value={localcasa.fechainicio}
                            onChange={handleImputchange}
                        ></input>

                        <label >fecha de actualizacion:</label>
                        <input type='text'
                            name='fechadeactualizacion'
                            placeholder='fechadeactualizacion'
                            id='fechadeactualizacion'
                            disabled
                            value={localcasa.fechadeactualizacion}
                            onChange={handleImputchange}
                        ></input>

                        <label >fecha de termino:</label>
                        <input type='text'
                            name='fechatermino'
                            placeholder='fechatermino'
                            id='fechatermino'
                            disabled
                            value={localcasa.fechatermino}
                            onChange={handleImputchange}
                        ></input>

                        <button type="submit" >{localcasa.ID !== 0 ? 'Actualizar' : 'Crear'}</button>
                        <button onClick={() => { setcancelar(true) }}>Cancelar</button>
                    </form>
                </div>

                <div className='casalocal-section'>
                    <h4>Vista previa </h4>

                        <div className='view-localles-busqueda' style={{ boxShadow: '0 4px 8px rgba(0,0,0,0)', display: 'flex', justifyContent: 'center', width: '100%' }}>
                            <Card casalocal={localcasa} interface={{ setmuestralocal: setmuestralocal, setsingelelement: setsingelelement }} />
                        </div>
                </div>

            </div>
            <Singleelement setmuestralocal={setmuestralocal} muestralocal={muestralocal} singelelement={singelelement} />
        </div>
    );
}

export default Casalocalupdate;