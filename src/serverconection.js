export const conectiondbaget = async (pagina) => {
 
    fetch(pagina)
        .then((res) => res.json())
        .then((data) => {

            //console.log(Object.keys(data));
            return "data";


        }).catch((err) => console.log(err))

}
