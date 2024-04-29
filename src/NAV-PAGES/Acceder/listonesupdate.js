import { useState, useEffect } from "react";

function Listones(props) {

    const baseliston = {
        ID: '',
        tipo: 0,
        titulo1: '',
        descrip1: '',
        titulo2: '',
        descrip2: '',
        titulo3: '',
        descrip3: '',
        Imagen: '',
        borrar: 'noborrar'
    }

    const [mostrarlistones, setmostrarlistones] = useState([baseliston]);

    const [liston, setliston] = useState(baseliston);

    const [borrar, setborrar] = useState(false);

    useEffect(() => {
        conectiondbapost(null, 'extraer_listones.php');
        return () => {
            // Lógica de limpieza aquí
        };
    }, []);

    const conectiondbapost = async (requestOptions, page) => {

        //console.log(props.paginabase)
        var links = props.paginabase + page;
        //console.log(links)
        fetch(links, requestOptions) //props.paginabase + 'check_key.php?Key=' + key
            .then((res) => res.text()) // extrae en formato json
            .then((data) => { //

                prosesadatos(data, page)

                //console.log(headerandfooter)
            }).catch((err) => console.log(err))
    }

    const prosesadatos = (data, page) => {
        var tojson;
        if (page === 'extraer_listones.php' && data !== 'No se encontraron resultados') {
            tojson = JSON.parse(data)
            setmostrarlistones(tojson)
            //console.log(tojson)
        }
        else  if(page == 'updateliston.php')
        {
            alert(data);
            setliston(baseliston);
            conectiondbapost(null, 'extraer_listones.php');
        }
    }

    const listones = (l) => {
        switch (l.tipo) {
            case '1':
                return (
                    <div className='liston1' >

                        <div className='text'>
                            <h4>{l.titulo1}</h4>
                            <hr />
                            <h6>
                                {l.descrip1}
                            </h6>
                        </div>

                        <img src={l.Imagen} />
                    </div>)

            case '2':
                return (
                    <div className='liston2'>

                        <div className="text">
                            <h4>{l.titulo1}</h4>

                            <h6>
                                {l.descrip1}
                            </h6>
                        </div>

                        <div className="text">
                            <h4>{l.titulo2}</h4>

                            <h6>
                                {l.descrip2}
                            </h6>
                        </div>

                        <div className="text">
                            <h4>{l.titulo3}</h4>

                            <h6>
                                {l.descrip3}
                            </h6>
                        </div>

                    </div>)
            case '3':
                return (
                    <div className='liston3'>

                        <img src={l.Imagen} />

                        <div className='text'>
                            <h4>{l.titulo1}</h4>
                            <hr />
                            <h6>
                                {l.descrip1}
                            </h6>
                        </div>

                    </div>)
            default:
                return <h3>Elija un modelo (Tipo) valido</h3>
        }
    }

    const loadpage = (event) => {
        event.preventDefault();

        var bifferliston = liston;
            bifferliston.borrar = 'noborrar';
        var requestOptions;


        if (liston.tipo !== 0) {

            if (borrar && liston.ID === '') {
                alert('no existe en la base de datos')
                setborrar(false)
            }
            else if (borrar) 
            {
                bifferliston.ID = liston.ID;
                bifferliston.borrar = 'borrar';

                requestOptions = {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(bifferliston)
                };

                conectiondbapost(requestOptions, 'updateliston.php')
            }
            else {
                requestOptions = {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(bifferliston)
                };

                conectiondbapost(requestOptions, 'updateliston.php')
            }

        }
        else
            alert('Modelo(Tipo) no valido')
    }

    const handleImputchange = (event) => {
        const { name, value } = event.target;
        setliston({
            ...liston,
            [name]: value,
        });
    }

    return (
        <div className="edicion-listones">
            <form onSubmit={loadpage}>
                <label>Tipo:</label>
                <select name="tipo" value={liston.tipo} onChange={handleImputchange} required>
                    <option key='0' value='0'></option>
                    <option key='1' value='1'>1</option>
                    <option key='2' value='2'>2</option>
                    <option key='3' value='3'>3</option>
                </select>

                <label>Titulo 1:</label>
                <input name="titulo1"
                    required
                    value={liston.titulo1}
                    onChange={handleImputchange}
                />

                <label>descripción 1:</label>
                <textarea name="descrip1"
                    required
                    value={liston.descrip1}
                    onChange={handleImputchange}
                />

                <label>Titulo 2:</label>
                <input name="titulo2"
                    value={liston.titulo2}
                    onChange={handleImputchange}
                />

                <label>descripción 2:</label>
                <textarea name="descrip2"
                    value={liston.descrip2}
                    onChange={handleImputchange}
                />

                <label>Titulo 3:</label>
                <input name="titulo1"
                    value={liston.titulo3}
                    onChange={handleImputchange}
                />

                <label>descripción 3:</label>
                <textarea name="descrip3"
                    value={liston.descrip3}
                    onChange={handleImputchange}
                />

                <label>Imagen:</label>
                <input name="Imagen"
                    value={liston.Imagen}
                    onChange={handleImputchange}
                />

                <button type="submit">Subir.</button>
                <button type="submit" onClick={() => setborrar(true)}>Borrar</button>
            </form>

            <br />

            <div className="prevew-liston">
                <h5>vista previa</h5>
                {
                    listones(liston)
                }
            </div>
            <br />
            <div className="mostrar-listonesa">
                <h5>
                    En base de datos
                </h5>
                {
                    mostrarlistones.map(l => (
                        <div onClick={() => setliston(l)}>
                            {
                                listones(l)
                            }
                            <br />
                        </div>
                    ))
                }
            </div>

        </div>
    );
}

export default Listones;