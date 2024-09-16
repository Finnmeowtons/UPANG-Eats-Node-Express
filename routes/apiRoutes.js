const express = require('express');
const router = express.Router();
const stallsController = require('../controllers/stallController');

//Stalls
router.get('/stalls', stallsController.getAllStalls);
router.get('/stalls/:id', stallsController.getStallById);
router.post('/stalls', stallsController.createStall);
router.put('/stalls/:id', stallsController.updateStall);
router.delete('/stalls/:id', stallsController.deleteStall);



module.exports = router;