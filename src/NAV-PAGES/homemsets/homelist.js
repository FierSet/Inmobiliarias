import { useEffect, useState } from 'react';
import Card from '../../js_element/card.js';

function Listpreview(props) {

    const [leng] = useState(16); // es el numero de elementos que se mostrara en la lista nota: es preferible que sea par
    const [current, setcurrent] = useState(0); // punto de inicio en el que inicia las filas de la base de datos
    const [maxglobal, setmaxglobal] = useState(0); // total de filas que tiene la base de datos
    const [objetocasa, setobjetocasa] = useState([]); // guarda las filas de la base de datos
    const [pagina] = useState(props.paginabase + "lista_locales.php"); //servidor en donde arga los datos

    useEffect(() => { //primer inicio del js
        //console.log(pagina)
        //llama un metodo que conecta al servidor mandando un 'noget' que indica que solo quiere el no. de filas
        conectiondba('noget', leng, current, props.tipo_propiedad, props.status_loca); // extrae el no. de filas respecto a las variables tipo y status
        conectiondba('get', leng, current, props.tipo_propiedad, props.status_loca); // extreae los elementos mediate las variables tipo_propiedad, status_loca extraida desdel promp
    }, []);

    useEffect(() => { // se ejecuta siempre y cuando se actualiza la vartiable current
        //console.log(pagina)
        if (current < maxglobal) // si la variable es mayor a maxglobal no llama a la base de datos
            conectiondba('get', leng, current, props.tipo_propiedad, props.status_loca);

    }, [current]); // se ejecuta cuando cambia la variable 1

    useEffect(() => {//se ejecuta siempre y cuando se actualiza la vartiable tipo_propiedad, status_loca

        setcurrent(0)
        conectiondba('noget', leng, current, props.tipo_propiedad, props.status_loca);
        conectiondba('get', leng, current, props.tipo_propiedad, props.status_loca);

    }, [props.tipo_propiedad, props.status_loca]);

    const conectiondba = async (islengs, leng, current, tipo_propiedad, status_loca) => { //conecta al servidor
        // url con envio get
        let pageget = pagina + '?maxdatabase=' + islengs + '&leng=' + leng +
            '&current=' + current + '&tipo_propiedad=' +
            tipo_propiedad.replace(" ", "%20") + '&status_loca=' + status_loca;

        fetch(pageget)
            .then((res) => res.json())
            .then((data) => 
            {
                extraerdata(islengs, data) //llama un metodo el cual recibe un json del servidor
            }).catch((err) => console.log(pageget + " - >" + err))
    }

    const extraerdata = (maxdatabase, data) => 
    {
        if (maxdatabase === 'noget') // verifica si quere el numero de filas o el json de los elementos
            setmaxglobal(data[0]['COUNT(ID)'])
        else
            setobjetocasa(data)
    }

    const changerangeadd = () => { // cambia el rango deseado un 1 para extraer los valores siguientes del sertvidor
        if ((current + leng) < maxglobal)
            setcurrent(current + leng);
    }

    const changerangesubs = () => {// cambia el rango deseado un -1 para extraer los valores anteriores del sertvidor
        if (current >= leng)
            setcurrent(current - leng);
        else if (current < leng && current > 0)
            setcurrent(0);
        else if (current === leng)
            setcurrent(0);
    }

    return (
        <div key='section-casalocal' className='section-casalocal'>

            {   /* si se recibe un json con "no data" manda un mensaje de error si no carga todos los datos recibidos*/
                objetocasa[0] !== 'No data' ?
                    <div className='view-localles-busqueda'> {/*base */}
                        <div id='navbuttons' className='navbuttonstop'> {/* botones que desplaza el rango de la variable current para extraer datos */}
                            {/* este boton llama un metodo el cual resta 9 posiciones de la base de datos*/}
                            <button onClick={() => changerangesubs()}> <i className="fa-solid fa-arrow-left" style={{ color: (current > 0) ? "#000000" : "#6C6C6C", }} ></i> </button>
                            /
                            {/* este boton llama un metodo el cual suma 9 posiciones de la base de datos */}
                            <button onClick={() => changerangeadd()}> <i className="fa-solid fa-arrow-right" style={{ color: (current + leng < maxglobal) ? "#000000" : "#6C6C6C", }}></i> </button>
                            {// divide el valor total de filas con los elemento a mostrar para mostrar la hoja actual
                                (maxglobal / leng) % 1 === 0 ? parseInt(current / leng) + 1 : (current + leng > maxglobal) ? parseInt(current / leng) + 1 : parseInt(current / leng) + 1}
                            /
                            {// divide el valor total de filas con los elemento a mostrar para mostrar las hojas totales
                                (maxglobal / leng) % 1 === 0 ? parseInt(maxglobal / leng) : parseInt(maxglobal / leng) + 1}
                        </div>
                        {
                            objetocasa.map(casalocal => (
                               <Card casalocal = {casalocal} interface={props} />
                            ))
                        }
                    </div>
                    :
                    <h1 className='nofound-data'>No se encontro resultados en nuestros servidores.</h1>
            }

        </div>
    );
}

export default Listpreview;