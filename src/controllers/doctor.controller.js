import doctorRepository from "../repository/doctor.repository.js"

async function getAllDoctor(req,res){
    const doctors =await doctorRepository.getAllDoctor();
    return res.status(200).json(doctors)
}


export default {getAllDoctor}