import img1 from '../IMG/Default/Backroom1.jpg';
import img2 from '../IMG/Default/Backroom2.jpg';
import img3 from '../IMG/Default/Backroom3.webp';

const IMAGENBASE = {
    0: img1,
    1: img2,
    2: img3
}

function Card(props) {

    return (
        <div className='casa-local' >
            <div className='status-casalocal'  
                style={{background: (props.casalocal['status_local'] === 'Rentado' || props.casalocal['status_local'] === 'Vendido') ? '#FFA500' :
                    (props.casalocal['status_local'] === 'Cancelado') ? '#FF0000' : '#25D366'}}>
                    {props.casalocal['status_local']}
            </div> {/* solo muestra el estatus del local */}

            <button className='button-vew' onClick={() => { props.interface.setmuestralocal(true); props.interface.setsingelelement(props.casalocal) }}>Visualizar</button> {/* permite abrir otra ventana para visualizar los detalles de cada elemento */}

            <div className='caracteristicas'>
                {/* image */}
                <div className='slider-wrapper'>

                    <div className='slider'>
                        {
                            [1, 2, 3].map(i => (

                                props.casalocal['Imagen' + i] !== null ?
                                    <img key={props.casalocal['ID'] + 'Imagen' + i} id={props.casalocal['ID'] + 'Imagen' + i} src={props.casalocal['Imagen' + i]} alt='' />
                                    :
                                    <img key={IMAGENBASE[i] + 'Imagen' + i} id={IMAGENBASE[i] + 'Imagen' + i} src={IMAGENBASE[i]} alt='' />
                            ))
                        }
                    </div>

                    <div className='slider-nav'>
                        {
                            [1, 2, 3].map(i =>
                            (
                                <a
                                    href={"#" + props.casalocal['ID'] + 'Imagen' + i}
                                    key={"#" + props.casalocal['ID'] + 'Imagen' + i}
                                    id={"href" + props.casalocal['ID'] + 'Imagen' + i}
                                    aria-hidden="true"
                                    onClick={e => 
                                    {
                                        e.preventDefault();
                                        const img = document.getElementById(props.casalocal['ID'] + 'Imagen' + i);
                                        const href = document.getElementById("href" + props.casalocal['ID'] + 'Imagen' + i);
                                        [1,2,3].map(a => {document.getElementById("href" + props.casalocal['ID'] + 'Imagen' + a).style.opacity = "0.75"})
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

                </div>
                <hr/>
                <div className='datos'>
                    <div className='dato' id='titulo'> {props.casalocal['tipo_propiedad']}</div>
                    <div className='dato' id='precio'>${new Intl.NumberFormat().format(props.casalocal['precio'])}</div>
                    <div className='dato' id='lugar'> {props.casalocal['calle'] + ', ' + props.casalocal['Codigo_postal']}</div>

                    <div className='dato'>
                        {
                            props.casalocal['recamaras'] !== null ?
                                <><i className="fa-solid fa-bed"></i> {props.casalocal['recamaras']} Recamara &#160;<br/></>
                                : null
                        }

                        {
                            props.casalocal['banos'] !== null ?
                                <><i className='fa-solid fa-shower'></i> {props.casalocal['banos']} Baños &#160;<br/></>
                                : null
                        }

                        {
                            props.casalocal['area'] !== null ?
                                <><i className="fa-solid fa-maximize"></i> {props.casalocal['area']}m&sup2; &#160;<br/></>
                                : null
                        }

                        {
                            props.casalocal['estacionamientos'] !== null ?
                                <><i className="fa-solid fa-car"></i> {props.casalocal['estacionamientos']} estacionamientos</>
                                : null
                        }
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Card;