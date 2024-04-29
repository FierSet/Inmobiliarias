import Constactoseditable from "./contacts";
import Casalocalupdate from "./Subirdatos";
import Listones from "./listonesupdate";

import { useState, useEffect } from "react";

function Acedder(props) {

    const [hasacces, sethasacces] = useState(false);
    const [key, setkey] = useState('')


    const conectiondbapost = async (requestOptions) => {

        //console.log(props.paginabase)
        var links = props.paginabase + 'check_key.php';
        //console.log(links)
        fetch(links, requestOptions) //props.paginabase + 'check_key.php?Key=' + key
            .then((res) => res.text()) // extrae en formato json
            .then((data) => { //

                if (data === 'Access accept')
                    sethasacces(true);
                else
                    sethasacces(false);
                //console.log(headerandfooter)
            }).catch((err) => console.log(err))

    }

    const senddatapost = () => {

        const requestOptions = {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ key: key })
        };

        conectiondbapost(requestOptions);
    }

    const submitkey = (event) => {
        event.preventDefault();
        senddatapost()
    }

    return (
        <div className='acceso-base'>

            {
                !hasacces ?
                    <form className='logging-zone' onSubmit={submitkey}>

                        <input required
                            type="password" placeholder="Agrega la llave."
                            className='key' id="key" name="key"
                            value={key}
                            onChange={(v) => setkey(v.target.value)}
                        />

                        <button type="submit" >Acceder</button>
                    </form>
                    : <Changesdata paginabase={props.paginabase} />
            }

        </div>
    );

}

function Changesdata(props) {

    const [actualtab, setactualtab] = useState(0);

    return (
        <div>
            <div className="zonetabs">

                <div className='tabs'>

                    <div className='contactos'
                        onClick={() => setactualtab(0)}
                        style={{ background: actualtab === 0 ? '#c3c3c3' : null }}>
                        Contatos
                    </div>

                    <div className='locales'
                        onClick={() => setactualtab(1)}
                        style={{ background: actualtab === 1 ? '#c3c3c3' : null }}>
                        Locales
                    </div>

                    <div className='listones'
                        onClick={() => setactualtab(2)}
                        style={{ background: actualtab === 2 ? '#c3c3c3' : null }}>
                        Listones
                    </div>

                </div>
            </div>
            {
                actualtab === 0 ? 
                    <Constactoseditable paginabase={props.paginabase} />
                    : actualtab === 1 ?
                    <Casalocalupdate paginabase={props.paginabase} />
                    : <Listones paginabase={props.paginabase} />
                }

        </div>
    );
}


export default Acedder;