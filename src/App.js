//Imagens
import logo from './IMG/LOGO_OFFICE.png';

//Classes
import HEADER from './header_and_footer/header.js';
import FOOTER from './header_and_footer/Footer.js';


//pages
import Home from './NAV-PAGES/homemsets/Home.js';
import Acedder from './NAV-PAGES/Acceder/acceder.js';
import Acercade from './NAV-PAGES/acercade/Acercade.js';

//CSS
import './CSS/Header.css';
import './CSS/Footer.css';
import './CSS/home.css';
import './CSS/show_single_element.css';
import './CSS/acceder.css';
import './CSS/local_update.css';
import './CSS/acercade.css';
import './CSS/listones.css';
import './CSS/listonesed.css';

import { useEffect, useState } from 'react';

function App() {
  //direccion del servidor      //https://testpagesmiguel.000webhostapp.com/Process/
  const [paginabase] = useState('http://localhost:255/innmoviliaria/Process/'); //http://localhost:255/innmoviliaria/Process/
  const [status_tipo_locca, setstatus_tipo_locca] = useState([]); //carga las listas de tipo de propiedad y estado de esta
  const [paginaactual, setpaginaactial] = useState('Inicio'); // define cual pagina se desea cargar

  const navpages = //Lista de paginas para cargar
    {
      'Inicio': <Home status_tipo_locca={status_tipo_locca} paginabase={paginabase}/>, 
      'Acerca de': <Acercade />,
      'Acceder': <Acedder paginabase = {paginabase}/>
    }

  useEffect(() => {
    conectiondba();
    return () => {
      // Lógica de limpieza aquí
    };
  }, [paginaactual]);

  const conectiondba = async () => {
    /*
    const datasend = {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ title: 'React POST Request Example' })
    };
    */

    //llama al backed en PHP para extraer datos de la base de datos. el string permite elegir la pagina del servidor
    fetch(paginabase + 'status_local.php')
      .then((res) => res.json()) // extrae en formato json
      .then((data) => { //

        setstatus_tipo_locca(data) // guardo los datos en la variable tipolocal
        //console.log(headerandfooter)
      }).catch((err) => console.log(err))

  }


  return (
    <div className="App">
      
      {/* llama el metodo HEADER para cargar el header reciniemdo la lista de paginas y el set de la variable "pagina atual" */ }
      <HEADER logo = {logo} paginabase = {paginabase} navpages = {navpages} paginaactual = {paginaactual} setpaginaactial = {setpaginaactial}/>
      {/* espacio de 20px en el css */}
      <div className = 'space' />

      { // carga los metodos mediate una matriz hash
        navpages[paginaactual]
      }
      <hr style={{color: '0000'}}/>

      {/* carga el footer */}
      <FOOTER paginabase = {paginabase} />

    </div>
  );
}

export default App;
