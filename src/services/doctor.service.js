import conect from "../db/conect.js";

async function getAllDoctor(){
    const sql = 'select * from doctors;'

    const doctors = await conect.executeQuery(sql,[])

    console.log(doctors)
    if (doctors.length > 0 ) {
        return doctors
    } else {
        return []
    }

}



export default {getAllDoctor}