import { Router } from "express";
import doctorController from "../controllers/doctor.controller.js";
import clientsController from "../controllers/clients.controller.js";
// import doct_cliController from "../controllers/doct_cli.controller.js"; // Controlador de doct_cli

const router = Router();

// Rota inicial
router.get('/', (req, res) => {
    return res.status(200).json({ status: "Hello World!!" });
});

// **Doutores (Doctors)**
router.get('/doutores', doctorController.getAllDoctor);  // Lista todos os doutores
router.get('/doutores/:id', doctorController.getIdDoctor);  // Busca doutor por ID
router.post('/doutores/add', doctorController.addDoctor);  // Adiciona um novo doutor
router.put('/doutores/edit/:id', doctorController.editDoctor);  // Edita um doutor existente
router.delete('/doutores/del/:id', doctorController.delDoctor);  // Deleta um doutor

// **Clientes (Clients)**
router.get('/clientes', clientsController.getAllClients);  // Lista todos os clientes
router.get('/clientes/:id', clientsController.getIdClient);  // Busca cliente por ID
router.post('/clientes/add', clientsController.addClient);  // Adiciona um novo cliente
router.put('/clientes/edit/:id', clientsController.editClient);  // Edita um cliente
router.delete('/clientes/del/:id', clientsController.delClient);  // Deleta um cliente

// // **Doct_cli (Associação entre Doutores e Clientes)**
// router.get('/doct_cli', doct_cliController.getAllDoct_cli);  // Lista todas as associações entre doutores e clientes

// // Rota para listar todos os clientes de um doutor específico
// router.get('/doct_cli/doutor/:id', doct_cliController.getClientsByDoctor);  // Lista clientes associados a um doutor específico

// // Rota para listar todos os doutores de um cliente específico
// router.get('/doct_cli/cliente/:id', doct_cliController.getDoctorsByClient);  // Lista doutores associados a um cliente específico

// // Rota para associar um cliente a um doutor (criar uma associação)
// router.post('/doct_cli/add', doct_cliController.addDoctCli);  // Cria uma nova associação entre doutor e cliente

// // Rota para desassociar um cliente de um doutor (remover a associação)
// router.delete('/doct_cli/del/:doctorId/:clientId', doct_cliController.delDoctCli);  // Remove a associação entre doutor e cliente

export default router;
