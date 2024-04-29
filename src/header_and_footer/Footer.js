import { useState, useEffect } from "react";

function FOOTER(props) {

  const [footers, setfooter] = useState([]);

  useEffect(() => {


    conectiondba();

    return () => {
      // Lógica de limpieza aquí
    };
  }, []);

  const conectiondba = async () => {
    /*
    const datasend = {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ title: 'React POST Request Example' })
    };
    */
    //llama al backed en PHP para extraer datos de la base de datos

    fetch(props.paginabase + 'headersandfooter.php')
      .then((res) => res.json())
      .then((data) => {

        asignationheader(data)
        //console.log(headerandfooter)
      }).catch((err) => console.log(err))

  }

  const asignationheader = (data) => {

    setfooter({
      titulo: data[0]['titulo'],
      desripcion: data[0]['desripcion'],
      calle: data[0]['calle'],
      no_local: data[0]['no_local'],
      estado: data[0]['estado'],
      colonia: data[0]['colonia'],
      Ciudad: data[0]['Ciudad'],
      logo: data[0]['logo']
    })
  }

  return (
    <footer>
      <div className='group'>

        <div className="logo">
          <div className='box'>
            <img src={footers.logo} />
            {/*<h2>Inmoviliaria</h2>*/}
          </div>
        </div>
        <div className='box'>

          <h3>{footers.titulo}</h3>
          <h4>{footers.desripcion}</h4>
        </div>

        <div className='box'>
          <h3>Nos ubicamos</h3>
          <h4>
            {footers.calle + " #" +
              footers.no_local + ", col. " +
              footers.colonia + ', ' +
              footers.Ciudad + ', ' +
              footers.estado + '.'
            }
          </h4>
        </div>

      </div>

    </footer>
  );

}

export default FOOTER;