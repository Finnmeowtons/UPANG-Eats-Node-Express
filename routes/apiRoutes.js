const express = require('express');
const router = express.Router();
const stallsController = require('../controllers/stallController');

//Get All Stalls
router.get('/stalls', stallsController.getAllStalls);
// //Get Stall By ID
// router.get('stalls/id', stallsController.getStallById)
// //create new stall
// router.post('/stalls', stallsController.createStall);


module.exports = router;