import doctorRepository from "../repository/doctor.repository.js"

async function getAllDoctor(req,res){
    const doctors = await doctorRepository.getAllDoctor();
    return res.status(200).json(doctors)
}

async function getIdDoctor(req,res){
    
    const doctors = await doctorRepository.getIdDoctor(req.params.id);
    return res.status(200).json(doctors)
}

async function addDoctor(req,res){
    // console.log(req.body)
    
    const doctors = await doctorRepository.addDoctor(req.body);
    
    return res.status(200).json(doctors)
}

async function editDoctor(req,res){
    
    const doctors = await doctorRepository.editDoctor(req.params.id);
    return res.status(200).json(doctors)

}

async function delDoctor(req,res){
    
    const doctors = await doctorRepository.delDoctor(req.params.id);
    return res.status(200).json(doctors)
}


export default {getAllDoctor,getIdDoctor,addDoctor,editDoctor,delDoctor}