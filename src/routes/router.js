import { Router } from "express";
import doctorController from "../controllers/doctor.controller.js";
import clientsController from "../controllers/clients.controller.js";

const router = Router();


router.get('/',(req,res)=>{
    return res.status(200).json({status:"Hello World!!"})
})

//Doctors
router.get('/doutores',doctorController.getAllDoctor)
router.get('/doutores/:id',doctorController.getIdDoctor)

//clients
router.get('/clientes',clientsController.getAllClients)





export default router