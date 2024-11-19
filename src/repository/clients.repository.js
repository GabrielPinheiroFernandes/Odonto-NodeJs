import clientsService from "../services/clients.service.js"


async function getAllclients(){
    const clients = await clientsService.getAllclients()
    return clients
}

export default {getAllclients}