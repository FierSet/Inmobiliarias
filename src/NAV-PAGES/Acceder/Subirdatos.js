import { useState, useEffect } from "react";

function Casalocalupdate(props) {

    const [cancelar, setcancelar] = useState(false);

    const [status_tipo_locca, setstatus_tipo_locca] = useState([]); //array el cual extrae el tipo y status del local

    const [idsearch, stidsearch] = useState(null) //id del elemento que se desea buscar

    const [showtable, setshowtable] = useState(false) //muestra la tabla

    const todaystart = new Date();

    const baselocal = { //nos permite vaciar los valores para volverlos a editar
        ID: 0,
        tipo_propiedad: '',
        status_local: '',
        calle: '',
        Codigo_postal: '',
        ciudad: '',
        Region: '',
        pais: 'Mexico',
        recamaras: '',
        banos: '',
        estacionamientos: '',
        area: '',
        precio: '',
        desripcion: '',
        Imagen1: '',
        Imagen2: '',
        Imagen3: '',
        fechainicio: `${todaystart.getFullYear()}-${todaystart.getMonth() + 1}-${todaystart.getDate()}`,
        fechadeactualizacion: '',
        fechatermino: ''
    }

    const [localcasaed, setlocalcasaed] = useState(baselocal) // se utiliza para subirlo al servidor


    const [localcasa, setlocalcasa] = useState(baselocal) // solo se usa para buscar informacion


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
                setshowtable(false)
                alert(data)
            }
            else {
                tojason = JSON.parse(data)
                stidsearch(null)
                setlocalcasa(tojason[0])
                setshowtable(true)
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
        setlocalcasaed(baselocal) // vacia la variable editable
        setlocalcasaed(localcasa) //asigna el nuevo valor a dicha variable
    }

    const verificaddata = () => {
        var today = new Date();

        var bufferlocal = localcasaed;
        console.log(bufferlocal)
        var page = '';

        if (localcasaed.ID !== 0) {
            bufferlocal.fechadeactualizacion = `${today.getFullYear()}-${today.getMonth() + 1}-${today.getDate()}`;
            if (localcasaed.status_local === 'Cancelado')
                bufferlocal.fechatermino = `${today.getFullYear()}-${today.getMonth() + 1}-${today.getDate()}`;
            page = 'updatecasalocal.php';
        }
        else {
            bufferlocal.fechainicio = `${today.getFullYear()}-${today.getMonth() + 1}-${today.getDate()}`;
            bufferlocal.fechadeactualizacion = `${today.getFullYear()}-${today.getMonth() + 1}-${today.getDate()}`;
            page = 'createcasalocal.php';
        }

        setlocalcasaed(bufferlocal);

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
        setlocalcasaed(baselocal)
        setshowtable(false)
        setcancelar(false)
        stidsearch(0)
    }


    const handleImputchange = (event) => {
        const { name, value } = event.target;
        setlocalcasaed({
            ...localcasaed,
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
                        <button className="buscar" onClick={() => buscarlocal()}>buscar</button>
                    </div>
                    {
                        showtable ?
                            <div className="tablelocal">
                                <table>
                                    <tr>
                                        {
                                            Object.keys(localcasa).map(k => (
                                                <th>{k}</th>
                                            ))
                                        }
                                    </tr>
                                    <tr>
                                        {
                                            Object.keys(localcasa).map(k => (
                                                <td onClick={() => cargabusqueda()}>{localcasa[k]}</td>
                                            ))
                                        }
                                    </tr>
                                </table>
                            </div>
                            : null
                    }
                </div>

            </div>

            <div className='update-datalocal'>

                <div className="casalocal-fields">
                    <form className='localdataupdate-fields' onSubmit={loadpage}>

                        <label >ID:</label>
                        <input type='number'
                            name='ID'
                            placeholder='ID'
                            id='ID'
                            maxLength='8'
                            disabled
                            value={localcasaed.ID}
                            onChange={handleImputchange}
                        ></input>

                        <label>Tipo Propiedad:</label>
                        <select name='tipo_propiedad' value={localcasaed.tipo_propiedad} onChange={handleImputchange}>
                            <option key='empty' value=''></option>
                            {
                                status_tipo_locca.map(l => (
                                    Object.keys(l).toString() === 'tipo_propiedad' ?
                                        <option key={l['tipo_propiedad']} value={l['tipo_propiedad']}>{l['tipo_propiedad']}</option>
                                        : null
                                ))
                            }
                        </select>

                        <label>Status del Local:</label>
                        <select name='status_local' value={localcasaed.status_local} onChange={handleImputchange}>
                            <option key='empty' value=''></option>
                            {
                                status_tipo_locca.map(l => (
                                    Object.keys(l).toString() === 'status_local' ?
                                        <option key={l['status_local']} value={l['status_local']}>{l['status_local']}</option>
                                        : null
                                ))
                            }
                        </select>

                        <label >Calle:</label>
                        <input type='text'
                            name='calle'
                            placeholder='Calle'
                            id='calle'
                            maxLength='255'
                            required={!cancelar}
                            value={localcasaed.calle}
                            onChange={handleImputchange}
                        ></input>

                        <label >Codigo postal:</label>
                        <input type='number'
                            name='Codigo_postal'
                            placeholder='Codigo postal'
                            id='Codigo_postal'
                            maxLength='10'
                            required={!cancelar}
                            value={localcasaed.Codigo_postal}
                            onChange={handleImputchange}
                        ></input>

                        <label >Ciudad:</label>
                        <input type='text'
                            name='ciudad'
                            placeholder='Ciudad'
                            id='ciudad'
                            maxLength='255'
                            required={!cancelar}
                            value={localcasaed.ciudad}
                            onChange={handleImputchange}
                        ></input>

                        <label >Region:</label>
                        <input type='text'
                            name='Region'
                            placeholder='Region'
                            id='Region'
                            maxLength='255'
                            required={!cancelar}
                            value={localcasaed.Region}
                            onChange={handleImputchange}
                        ></input>

                        <label >Pais:</label>
                        <input type='text'
                            name='pais'
                            placeholder='pais'
                            id='pais'
                            maxLength='255'
                            required={!cancelar}
                            value={localcasaed.pais}
                            onChange={handleImputchange}
                        ></input>

                        <label >Recamaras:</label>
                        <input type='number'
                            name='recamaras'
                            placeholder='recamaras'
                            id='recamaras'
                            maxLength='2'
                            required={!cancelar}
                            value={localcasaed.recamaras}
                            onChange={handleImputchange}
                        ></input>

                        <label >Baños:</label>
                        <input type='number'
                            name='banos'
                            placeholder='Baños'
                            id='banos'
                            maxLength='2'
                            required={!cancelar}
                            value={localcasaed.banos}
                            onChange={handleImputchange}
                        ></input>

                        <label >Estacionamientos:</label>
                        <input type='number'
                            name='estacionamientos'
                            placeholder='estacionamientos'
                            id='estacionamientos'
                            maxLength='2'
                            required={!cancelar}
                            value={localcasaed.estacionamientos}
                            onChange={handleImputchange}
                        ></input>

                        <label >Area:</label>
                        <input type='number'
                            name='area'
                            placeholder='Area'
                            id='area'
                            required={!cancelar}
                            value={localcasaed.area}
                            onChange={handleImputchange}
                        ></input>

                        <label >Precio:</label>
                        <input type='number'
                            name='precio'
                            placeholder='precio'
                            id='precio'
                            required={!cancelar}
                            value={localcasaed.precio}
                            onChange={handleImputchange}
                        ></input>

                        <label >Descripcion:</label>
                        <textarea rows='8' cols='75' maxLength='255'
                            name='desripcion'
                            placeholder='Descripcion'
                            id='desripcion'
                            required={!cancelar}
                            value={localcasaed.desripcion}
                            onChange={handleImputchange}
                        ></textarea>

                        <label >Imagen 1:</label>
                        <input type='text'
                            name='Imagen1'
                            placeholder='Imagen1'
                            id='Imagen1'
                            maxLength='255'
                            required={!cancelar}
                            value={localcasaed.Imagen1}
                            onChange={handleImputchange}
                        ></input>

                        <label >Imagen 2:</label>
                        <input type='text'
                            name='Imagen2'
                            placeholder='Imagen2'
                            id='Imagen2'
                            maxLength='255'
                            required={!cancelar}
                            value={localcasaed.Imagen2}
                            onChange={handleImputchange}
                        ></input>

                        <label >Imagen 3:</label>
                        <input type='text'
                            name='Imagen3'
                            placeholder='Imagen3'
                            id='Imagen3'
                            maxLength='255'
                            required={!cancelar}
                            value={localcasaed.Imagen3}
                            onChange={handleImputchange}
                        ></input>

                        <label >Fecha de creracion:</label>
                        <input type='text'
                            name='fechainicio'
                            placeholder='fechainicio'
                            id='fechainicio'
                            disabled={!cancelar}
                            value={localcasaed.fechainicio}
                            onChange={handleImputchange}
                        ></input>

                        <label >fecha de actualizacion:</label>
                        <input type='text'
                            name='fechadeactualizacion'
                            placeholder='fechadeactualizacion'
                            id='fechadeactualizacion'
                            disabled
                            value={localcasaed.fechadeactualizacion}
                            onChange={handleImputchange}
                        ></input>

                        <label >fecha de termino:</label>
                        <input type='text'
                            name='fechatermino'
                            placeholder='fechatermino'
                            id='fechatermino'
                            disabled
                            value={localcasaed.fechatermino}
                            onChange={handleImputchange}
                        ></input>

                        <button type="submit" >{localcasaed.ID !== 0 ? 'Actualizar' : 'Crear'}</button>
                        <button onClick={() => { setcancelar(true) }}>Cancelar</button>
                    </form>
                </div>

                <div className='casalocal-section'>
                    <h4>Vista previa </h4>
                    <div className='casa-local' >

                        <div className='status-casalocal' 
                        style={{background: (localcasaed['status_local'] === 'Rentado' || localcasaed['status_local'] === 'Vendido') ? '#FFA500' :
                        (localcasaed['status_local'] === 'Cancelado') ? '#FF0000' : '#25D366'}}>{localcasaed['status_local']}</div> {/* solo muestra el estatus del local */}

                        <button className='button-vew'>Visualizar</button> {/* permite abrir otra ventana para visualizar los detalles de cada elemento */}

                        <div className='caracteristicas'>
                            {/* image */}
                            <div className='slider-wrapper'>

                                <div className='slider'>

                                    <img key='preview-image1' id='preview-image1' src={localcasaed['Imagen1']} alt='' />
                                    <img key='preview-image2' id='preview-image2' src={localcasaed['Imagen2']} alt='' />
                                    <img key='preview-image3' id='preview-image3' src={localcasaed['Imagen3']} alt='' />

                                </div>

                                <div className='slider-nav'>

                                    <a href='#preview-image1' key='select-preview-image1' aria-hidden="true" />
                                    <a href='#preview-image2' key='select-preview-image2' aria-hidden="true" />
                                    <a href='#preview-image3' key='select-preview-image3' aria-hidden="true" />

                                </div>

                            </div>

                            <div className='datos'>
                                <div className='dato' id='titulo'> {localcasaed['tipo_propiedad']}</div>
                                <div className='dato' id='precio'>${new Intl.NumberFormat().format(localcasaed['precio'])}</div>
                                <div className='dato' id='lugar'> {localcasaed['calle'] + ', ' + localcasaed['Codigo_postal']}</div>

                                <div className='dato'>

                                    <><i className="fa-solid fa-bed"></i> {localcasaed['recamaras']} Recamara &#160;</>

                                    <><i className='fa-solid fa-shower'></i> {localcasaed['banos']} Banos &#160;</>

                                    <><i className="fa-solid fa-maximize"></i> {localcasaed['area']}m&sup2; &#160;</>

                                    <i className="fa-solid fa-car"></i> {localcasaed['estacionamientos']} estacionamientos


                                </div>

                            </div>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    );
}

export default Casalocalupdate;