import doctorService from "../services/doctor.service.js"

async function getAllDoctor(){
    const doctors = await doctorService.getAllDoctor()
    return doctors
}

export default {getAllDoctor}