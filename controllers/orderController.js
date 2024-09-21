const Order = require("../models/Order");
const connection = require("../connection/connection");

exports.getAllOrders = async (req, res) => {
    try {
        const [results, fields] = await connection.query('SELECT * FROM orders');
        const orders = results.map(row => new Order(...Object.values(row)));

        res.json(orders);
    } catch (error) {
        console.error('Error fetching orders:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.getOrderById = async (req, res) => {
    try {
        const orderId = req.params.id;
        const [results, fields] = await connection.query('SELECT * FROM orders WHERE order_id = ?', [orderId]);

        if (results.length === 0) {
            return res.status(404).json({ error: 'Order not found' })
        }

        const order = new Order(...Object.values(results[0]));
        res.json(order);
    } catch (error) {
        console.error('Error fetching order:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.createOrder = async (req, res) => {
    try {
        const { user_id, stall_id, total_amount } = req.body;

        const [result, fields] = await connection.query(
            'INSERT INTO orders (user_id, stall_id, total_amount) VALUES (?,?,?)',
            [user_id, stall_id, total_amount]
        );
        
        const newOrderId = result.insertId;

        const [newOrderData] = await connection.query('SELECT * FROM orders WHERE order_id = ?', [newOrderId]);
        const newOrder = new Order(...Object.values(newOrderData[0]))

        res.status(201).json(newOrder);
    } catch (error) {
        console.error('Error fetching order:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.updateOrderStatus = async (req, res) => {
    try {
        const orderId = req.params.id;
        const { order_status } = req.body;

        const [result, fields] = await connection.query(
            'UPDATE orders SET order_status = ? WHERE order_id = ?',
            [order_status, orderId]
        );

        if (result.affectedRows === 0) {
            return res.status(404).json({error: 'Order not found'})
        }

        const [updatedOrderData] = await connection.query(
            'SELECT * FROM orders WHERE order_id = ?', [orderId]
        )
        const updatedOrder = new Order(...Object.values(updatedOrderData[0]));

        res.json(updatedOrder);
    } catch(error) {
        console.error('Error fetching order:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.deleteOrder = async (req, res) => {
    try{
        const orderId = req.params.id;

        const [result, fields] = await connection.query('DELETE FROM orders WHERE order_id = ?', orderId);

        if (result.affectedRows === 0 ) {
            return res.status(404).json({error: 'Order not found'})
        }

        //Status code 204 cant send messages on the json
        res.status(204).send()
    } catch (error) {
        console.error('Error fetching order:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}