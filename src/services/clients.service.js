import conect from "../db/conect.js";

async function getAllclients() {
    const sql = 'select * from paciente;';

    const clients = await conect.executeQuery(sql, []);

    console.log(clients);
    if (clients && clients.length > 0) { 
        return clients;
    } else {
        return [];
    }
}

export default { getAllclients };
