import { useEffect, useState } from 'react';

function HEADER(props) {
    const [headers, setheaders] = useState([]);

    useEffect(() => {
        conectiondba();
        return () => {
            // Lógica de limpieza aquí
        };
    }, []);

    const conectiondba = async () => {

        fetch(props.paginabase + 'headersandfooter.php')
            .then((res) => res.json())
            .then((data) => {

                asignationheader(data);

            }).catch((err) => console.log(err))
    }

    const asignationheader = (data) => {

        setheaders({
            logo: data[0]['logo'],
            celular: data[0]['celular'],
            whatsapp: data[0]['whatsapp'],
            email: data[0]['email'],
            facebook: data[0]['facebook'],
            instagram: data[0]['instagram']
        })
    }

    return (
        <header>

            <div className='logo'>
                {/*console.log(headers) */}
                <img key ={headers['logo']} src={headers['logo']} alt="logo" onClick={() => window.location.replace('')} />

            </div>

            <ul>
                <li>
                    <a  href={"tel:" +headers['celular'] }><i className="fa-solid fa-phone"> </i> {headers['celular']}</a>
                </li>

                <li>
                    <a href={'mailto:' + headers['email']} target="_blank"><i  className="fa-solid fa-at" > </i> {headers['email'] !== null ? headers['email'] : <>Email@gmail.com</>}</a>
                </li>

                <li key='social_ned' className="social_ned">
                    <a key='facebook' href={headers['facebook']} target="_blank" className="fa-brands fa-square-facebook"></a>
                    <a key='whatsapp' href={'https://wa.me/' + headers['whatsapp']} target="_blank" className="fa-brands fa-square-whatsapp"></a>
                    <a key='instagram' href={headers['instagram']} target="_blank" className="fa-brands fa-square-instagram"></a>
                </li>
            </ul>

            <nav>

                {
                    Object.keys(props.navpages).map(e => ( //
                        <a
                            onClick={() => {
                                e === 'Inicio' ?
                                    window.location.replace('')
                                    :
                                    props.setpaginaactial(e)
                            }}
                            className='nav-class'
                            style={{background: e === props.paginaactual ? '#c3c3c3' : null}}
                        >
                            {e}
                        </a>
                    ))
                }
                {/**  
                <a onClick = {() => props.setpaginaactial('Inicio')} className='nav-class'>Inicio</a>
                <a></a>
                <a className='nav-class'>acerca de</a>
                */}
            </nav>

        </header>

    );

}

export default HEADER;