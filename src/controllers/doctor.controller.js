import doctorRepository from "../repository/doctor.repository.js"

async function getAllDoctor(req,res){
    const doctors = await doctorRepository.getAllDoctor();
    return res.status(200).json(doctors)
}

async function getIdDoctor(req,res){
    
    const doctors = await doctorRepository.getIdDoctor(req.params.id);
    return res.status(200).json(doctors)
}


export default {getAllDoctor,getIdDoctor}