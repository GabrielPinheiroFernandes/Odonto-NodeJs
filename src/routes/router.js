import { Router } from "express";
import doctorController from "../controllers/doctor.controller.js";

const router = Router();


router.get('/',(req,res)=>{
    return res.status(200).json({status:"Hello World!!"})
})

router.get('/doctors',doctorController.getAllDoctor)




export default router