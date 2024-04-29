import { useState, useEffect } from "react";

function Constactoseditable(props) {

    const [constactos, setconstactos] = useState({
        celular: 'celular',
        email: 'email',
        whatsapp: 'whatsapp',
        facebook: 'facebook',
        instagram: 'instagram',
        estado: 'estado',
        colonia: 'colonia',
        Ciudad: 'Ciudad',
        calle: 'calle',
        no_local: 'no_local',
        logo: 'logo',
        sub_logo: 'sub_logo',
        titulo: 'titulo',
        desripcion: 'desripcion'
    });

    useEffect(() => {
        conectiondbapost(null, 'headersandfooter.php');
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

                //console.log(data)
                load_or_opload_data(data, page)

            }).catch((err) => console.log(err))
    }

    const load_or_opload_data = (data, page) => {
        if (page === 'headersandfooter.php') {
            //console.log(data[0])
            var tojson = JSON.parse(data);
            //console.log(tojson[0])
            setconstactos(tojson[0])
        }
        else {
            //console.log(data)
            alert('datos actualizados.')
        }
    }

    const loadpage = (event) => {
        event.preventDefault();
        //console.log(constactos)

        const requestOptions = {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(constactos)
        };

        conectiondbapost(requestOptions, 'updatecontacts.php');
    }

    const handleImputchange = (event) => {
        const { name, value } = event.target;
        setconstactos({
            ...constactos,
            [name]: value,
        });
    }

    return (
        <div className='contact-change-data'>
            <div className='contactos-change'>
                <form className='contactos' onSubmit={loadpage}>

                    <label >Cell:</label>
                    <input type='number' placeholder="No. contacto." id='celular' maxLength={10} required
                        className='celular' name='celular'
                        value={constactos.celular}
                        onChange={handleImputchange}></input>

                    <label >Email:</label>
                    <input type='text' placeholder="Email" id='email' maxLength='255' required
                        className='email' name='email'
                        value={constactos.email}
                        onChange={handleImputchange}></input>

                    <label >Whatsapp:</label>
                    <input type='text' placeholder="whatsapp" id='whatsapp' maxLength='10' required
                        className='whatsapp' name='whatsapp'
                        value={constactos.whatsapp}
                        onChange={handleImputchange}></input>

                    <label>Facebook:</label>
                    <input type='text' placeholder="facebook" id='facebook' maxLength='2083' required
                        className='facebook' name='facebook'
                        value={constactos.facebook}
                        onChange={handleImputchange}></input>

                    <label >Instagram:</label>
                    <input type='text' placeholder="instagram" id='instagram' maxLength='2083' required
                        className='instagram' name='instagram'
                        value={constactos.instagram}
                        onChange={handleImputchange}></input>

                    <label >estado:</label>
                    <input type='text' placeholder="estado" id='estado' maxLength='25' required
                        className='estado' name='estado'
                        value={constactos.estado}
                        onChange={handleImputchange}></input>

                    <label > Colonia:</label>
                    <input type='text' placeholder="colonia" id='colonia' maxLength='25' required
                        className='colonia' name='colonia'
                        value={constactos.colonia}
                        onChange={handleImputchange}></input>

                    <label >Ciudad:</label>
                    <input type='text' placeholder="Ciudad" id='Ciudad' maxLength='50' required
                        className='Ciudad' name='Ciudad'
                        value={constactos.Ciudad}
                        onChange={handleImputchange}></input>

                    <label >Calle:</label>
                    <input type='text' placeholder="calle" id='calle' maxLength='25' required
                        className='calle' name='calle'
                        value={constactos.calle}
                        onChange={handleImputchange}></input>

                    <label >No. local:</label>
                    <input type='text' placeholder="no. local" id='no_local' maxLength='4' required
                        className='no_local' name='no_local'
                        value={constactos.no_local}
                        onChange={handleImputchange}></input>

                    <label >Logo:</label>
                    <input type='text' placeholder="URL del logo" id='logo' maxLength='255' required
                        className='logos' name="logo"
                        value={constactos.logo}
                        onChange={handleImputchange}></input>

                    <label >sub-logo:</label>
                    <input type='text' placeholder="sub_logo" id='sub_logo' maxLength='255' required
                        className='sub_logo' name='sub_logo'
                        value={constactos.sub_logo}
                        onChange={handleImputchange}></input>

                    <label >titulo:</label>
                    <input type='text' placeholder="titulo" id='titulo' maxLength='30' required
                        className='titulo' name='titulo'
                        value={constactos.titulo}
                        onChange={handleImputchange}></input>

                    <label >desripcion:</label>
                    <textarea rows='4' cols='65' maxLength='255' placeholder="descripcion" id='desripcion' required
                        className='desripcion' name='desripcion'
                        value={constactos.desripcion}
                        onChange={handleImputchange}></textarea>



                    <label></label><button type="submit">Actualizar</button>
                </form>
            </div>

            <div className='previewimage'>

                <div className='preview-img'>Vist previa de logo<img src={constactos.logo} alt="logo" /></div>

                <div className='preview-img'>Vist previa de sub-logo<img src={constactos.sub_logo} alt="sub logo" /></div>
            </div>
        </div>
    );
}

export default Constactoseditable;