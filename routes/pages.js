const express=require('express');
var bodyParser= require('body-parser');
const { decodeBase64 } = require('bcryptjs');
const mysql = require('mysql');
var urlencodedParser=bodyParser.urlencoded({extended:false});

const router=express.Router();

const db = mysql.createConnection({
    host: process.env.Database_host,
    user: process.env.Database_user,
    password: process.env.Database_password,
    database: process.env.Database
});



router.get('/',urlencodedParser,(req,res)=>{
    res.render("index");
});

router.get('/doctorLogin',urlencodedParser,(req,res)=>{
    res.render("doctorLogin");
});
router.get('/doctorSignup',urlencodedParser,(req,res)=>{
    res.render("doctorSignup");
});
router.get('/registerPractice',urlencodedParser,(req,res)=>{
    res.render("registerPractice");
});
router.get('/patientLogin',urlencodedParser,(req,res)=>{
    res.render("patientLogin");
});
router.get('/patientSignup',urlencodedParser,(req,res)=>{
    res.render("patientSignup");
});
router.get('/addPrescription',urlencodedParser,(req,res)=>{
    res.render("addPrescription");
});

router.get('/addAllergies',urlencodedParser,(req,res)=>{
    res.render("addAllergies");
});
router.get('/completeProfile',urlencodedParser,(req,res)=>{
    res.render("completeProfile");
});
router.get('/searchDoctor',urlencodedParser,(req,res)=>{
    res.render("searchDoctor");
});
router.get('/afterSearch',urlencodedParser,(req,res)=>{
    res.render("afterSearch");
});
router.get('/bookDoctor',urlencodedParser,(req,res)=>{
    res.render("bookDoctor");
});
router.get('/patientHome',urlencodedParser,(req,res)=>{
    res.render("patientHome");
});
router.get('/doctorHome',urlencodedParser,(req,res)=>{
    res.render("doctorHome");
});

router.get('/viewPrescription',urlencodedParser,(req,res)=>{
    res.render("viewPrescription");
});
router.get('/random',urlencodedParser,(req,res)=>{
    res.render("random");
});
router.get('/viewBookingsPat',urlencodedParser,(req,res)=>{
    res.render("viewBookingsPat");
});
router.get('/viewBookingsDoc',urlencodedParser,(req,res)=>{
    res.render("viewBookingsDoc");
});
router.get('/refillPrescription/:prescription_id',urlencodedParser,(req,res)=>{
    console.log(req.params);
    db.query('UPDATE prescriptions SET refill_count = refill_count+1 where prescription_id=?',[req.params.prescription_id],(error,result)=>{
        if(error)
        {
            console.log(error)
        }
            
            res.render("refillThank");
        
    })
});
//Fictitious
router.get('/adhereResponse',urlencodedParser,(req,res)=>{
    res.render("adhereResponse");
});

// router.get('/afterPatLogin',urlencodedParser,(req,res)=>{
//     res.render("afterPatLogin");
// });

//After Authentication
router.get('/auth/patientLogin',urlencodedParser,(req,res)=>{
    res.render("patientLogin");
});
router.get('/auth/doctorLogin',urlencodedParser,(req,res)=>{
    res.render("doctorLogin");
});
router.get('/auth/afterPatLogin',urlencodedParser,(req,res)=>{
    res.render("afterPatLogin");
});
router.get('/auth/adhereResponse',urlencodedParser,(req,res)=>{
    res.render("adhereResponse");
});
router.get('/auth/viewBookingsDoc',urlencodedParser,(req,res)=>{
    res.render("viewBookingsDoc");
});
router.get('/auth/viewPrescription',urlencodedParser,(req,res)=>{
    res.render("viewPrescription");
});
router.get('/auth/viewFullPrescription',urlencodedParser,(req,res)=>{
    res.render("viewFullPrescription");
});

//can be of no use
router.get('/auth/registerPractice',urlencodedParser,(req,res)=>{
    res.render("registerPractice");
});
router.get('/auth/random',urlencodedParser,(req,res)=>{
    res.render("random");
});


module.exports=router;