import doctorService from "../services/doctor.service.js"

async function getAllDoctor(){
    const doctors = await doctorService.getAllDoctor()
    return doctors
}
async function getIdDoctor(id){
    const doctors = await doctorService.getIdDoctor(id)
    return doctors
}
async function addDoctor(body){
    // console.log(body)
    const {NOME,CRO,HORA_ENTRADA,HORA_SAIDA,OBSERVACAO} = body;

    const doctors = await doctorService.addDoctor(NOME,CRO,HORA_ENTRADA,HORA_SAIDA,OBSERVACAO)
    console.log(doctors)
    return doctors
}
async function editDoctor(id){
    const doctors = await doctorService.editDoctor(id)
    return doctors
}
async function delDoctor(id){
    const doctors = await doctorService.delDoctor(id)
    return doctors
}


export default {getAllDoctor,getIdDoctor,addDoctor,editDoctor,delDoctor}