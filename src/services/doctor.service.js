import conect from "../db/conect.js";

async function getAllDoctor() {
    const sql = 'select * from DOUTOR;';

    const doctors = await conect.executeQuery(sql, []);

    console.log(doctors);
    if (doctors && doctors.length > 0) { 
        return doctors;
    } else {
        return [];
    }
}

async function getIdDoctor(id) {
    console.log('ID PASSADO PELA REQUISIÇÂO=>',id)
    const sql = 'select * from DOUTOR where CODIGO = ?';

    const doctors = await conect.executeQuery(sql, [id]);

    console.log(doctors);
    if (doctors && doctors.length > 0) { 
        return doctors;
    } else {
        return [];
    }
}

export default { getAllDoctor,getIdDoctor };
