const express = require('express');
const router = express.Router();
const stallsController = require('../controllers/stallController');
const userController = require('../controllers/userController');
const foodController = require('../controllers/foodController');
const orderController = require('../controllers/orderController');
const orderItemsController = require('../controllers/orderItemsController');

//Stalls
router.get('/stalls', stallsController.getAllStalls);
router.get('/stalls/:id', stallsController.getStallById);
router.post('/stalls', stallsController.createStall);
router.put('/stalls/:id', stallsController.updateStall);
router.delete('/stalls/:id', stallsController.deleteStall);

//Users
router.get('/users', userController.getAllUsers);
router.get('/users/:id', userController.getUserById);
router.post('/users', userController.createUser);
router.put('/users/:id', userController.updateUser);
router.delete('/users/:id', userController.deleteUser);

//Food Items
router.get('/foods', foodController.getAllFoods);
router.get('/foods/:id', foodController.getFoodById);
router.post('/foods', foodController.createFood);
router.put('/foods/:id', foodController.updateFood);
router.delete('/foods/:id', foodController.deleteFood);

//Orders 
router.get('/orders', orderController.getAllOrders);
router.get('/orders/:id', orderController.getOrderById);
router.post('/orders', orderController.createOrder);
router.put('/orders/:id', orderController.updateOrderStatus);
router.delete('/orders/:id', orderController.deleteOrder);

//Order_items (one to many relationship)
router.get('/all-order-items', orderItemsController.getAllOrderItems);
router.get('/orders/:id/items', orderItemsController.getOrderItemById);
router.post('/orders/:id/items', orderItemsController.createOrderItem);
router.delete('/orders/:id/items', orderItemsController.deleteOrderItem);
 

module.exports = router;