import { useEffect, useState } from 'react';

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
                                <div className='casa-local'>

                                    <div className='status-casalocal'
                                        style={{background: (casalocal['status_local'] === 'Rentado' || casalocal['status_local'] === 'Vendido') ? '#FFA500' :
                                                (casalocal['status_local'] === 'Cancelado') ? '#FF0000' : '#25D366'
                                        }} >
                                        {casalocal['status_local']}
                                    </div> {/* solo muestra el estatus del local */}
                                    <button className='button-vew' onClick={() => { props.setmuestralocal(true); props.setsingelelement(casalocal) }}>Visualizar</button>{/* permite abrir otra ventana para visualizar los detalles de cada elemento */}

                                    <div className='caracteristicas'>
                                        {/* image */}
                                        <div className='slider-wrapper'> {/* zona de imagen de cada elemento */}
                                            <div className='slider'> {/* carga las 3 imagenes mediante una matriz */}
                                                {
                                                    [1, 2, 3].map(i => (

                                                        casalocal['Imagen' + i] !== null ?
                                                            <img key={casalocal['ID'] + 'Imagen' + i} id={casalocal['ID'] + 'Imagen' + i} src={casalocal['Imagen' + i]} alt='' />
                                                            :
                                                            <img key={casalocal['ID'] + 'Imagen' + i} id={casalocal['ID'] + 'Imagen' + i} src={props.IMAGENBASE[Math.floor(Math.random() * 3)]} alt='' />
                                                    ))
                                                }
                                            </div> {/*end carga las 3 imagenes mediante una matriz */}

                                            <div className='slider-nav'> {/* este elemento permite cambiar las imagenes */}
                                                {
                                                    [1, 2, 3].map(i => (
                                                        <a
                                                            href={"#" + casalocal['ID'] + 'Imagen' + i} 
                                                            key={"#" + casalocal['ID'] + 'Imagen' + i}
                                                            id={"href" + casalocal['ID'] + 'Imagen' + i}
                                                            aria-hidden="true" 
                                                            onClick={e => 
                                                            {
                                                                e.preventDefault();
                                                                const img = document.getElementById(casalocal['ID'] + 'Imagen' + i);
                                                                const href = document.getElementById("href" + casalocal['ID'] + 'Imagen' + i);
                                                                [1,2,3].map(a => {document.getElementById("href" + casalocal['ID'] + 'Imagen' + a).style.opacity = "0.75"})
                                                                if (img)
                                                                {
                                                                    img.scrollIntoView({ behavior: 'smooth', inline: 'center', block: 'nearest'});
                                                                    href.style.opacity = '1';
                                                                }
                                                            }}
                                                        />
                                                    ))
                                                }
                                            </div>
                                        </div> {/*end zona de imagen de cada elemento */}

                                        <div className='datos'> {/* carga los datos especificados mediate la matriz */}
                                            <div className='dato' id='titulo'> {casalocal['ID'] + ": " + casalocal['tipo_propiedad']}</div>
                                            <div className='dato' id='precio'>${new Intl.NumberFormat().format(casalocal['precio'])}</div>
                                            <div className='dato' id='lugar'> {casalocal['calle'] + ', ' + casalocal['Codigo_postal']}</div>

                                            <div className='dato'>
                                                {
                                                    casalocal['recamaras'] !== null ?
                                                        <><i className="fa-solid fa-bed"></i> {casalocal['recamaras']} Recamara &#160;<br/></>
                                                        : null
                                                }

                                                {
                                                    casalocal['banos'] !== null ?
                                                        <><i className='fa-solid fa-shower'></i> {casalocal['banos']} Banos &#160;<br/></>
                                                        : null
                                                }

                                                {
                                                    casalocal['area'] !== null ?
                                                        <><i className="fa-solid fa-maximize"></i> {casalocal['area']}m&sup2; &#160;<br/></>
                                                        : null
                                                }

                                                {
                                                    casalocal['estacionamientos'] !== null && casalocal['estacionamientos'] !== 0 ?
                                                        <><i className="fa-solid fa-car"></i> {casalocal['estacionamientos']} estacionamientos</>
                                                        : null
                                                }

                                            </div>

                                        </div> {/*end carga los datos especificados mediate la matriz */}

                                    </div>

                                </div>
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