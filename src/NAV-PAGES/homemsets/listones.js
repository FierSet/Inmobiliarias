import { useState, useEffect } from "react";

function Listones(props) {

    const [listone, getlistone] = useState([])

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

                if (data !== 'No se encontraron resultados') {
                    let tojson = JSON.parse(data)
                    getlistone(tojson)
                    //console.log(data)
                }

                //console.log(headerandfooter)
            }).catch((err) => console.log(err))
    }
    
    const listones = (l) => {

        //console.log(titulo1)

        switch (l.tipo) 
        {
            case '1':
                return(
                    <div className='liston1'>

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
                return(
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
                
        }
    }


    return (
        <>
            {
                listone.map(l => (
                    <>
                    {
                        listones(l)
                    }
                    <br/>
                    </>
                ))
            }
        </>
    );
}

export default Listones;