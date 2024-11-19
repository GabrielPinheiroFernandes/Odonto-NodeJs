import clientsRepository from "../repository/clients.repository.js"

async function getAllClients(req,res) {
    const clients = await clientsRepository.getAllclients();
    return res.status(200).json(clients)
}


export default {getAllClients}