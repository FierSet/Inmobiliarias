import Constactoseditable from "./contacts";
import Casalocalupdate from "./Subirdatos";
import Listones from "./listonesupdate";

import { useState, useEffect } from "react";

function Acedder(props) {

    return (
        <div className='acceso-base'>
            {
                <Changesdata paginabase={props.paginabase} />
            }
        </div>
    );

}

function Changesdata(props) {

    const [actualtab, setactualtab] = useState(0);

    return (
        <div>
            <div className="zonetabs">

                <nav className='tabs'>

                    <button className='contactos'
                        onClick={() => setactualtab(0)}
                        style={{ background: actualtab === 0 ? '#c3c3c3' : null }}>
                        Contatos
                    </button>

                    <button className='locales'
                        onClick={() => setactualtab(1)}
                        style={{ background: actualtab === 1 ? '#c3c3c3' : null }}>
                        Locales
                    </button>

                    <button className='listones'
                        onClick={() => setactualtab(2)}
                        style={{ background: actualtab === 2 ? '#c3c3c3' : null }}>
                        Listones
                    </button>

                </nav>
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