import doctorService from "../services/doctor.service.js"

async function getAllDoctor(){
    const doctors = await doctorService.getAllDoctor()
    return doctors
}
async function getIdDoctor(id){
    const doctors = await doctorService.getIdDoctor(id)
    return doctors
}


export default {getAllDoctor,getIdDoctor}