const Food = require("../models/Food");
const connection = require("../connection/connection");

exports.getAllFoods = async (req, res) => {
    try {
        const [results, fields] = await connection.query('SELECT * FROM food_items');
        const foods = results.map(row => new Food(...Object.values(row)));

        res.json(foods);
    } catch (error) {
        console.error('Error fetching foods:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.getFoodById = async (req, res) => {
    try {
        const foodId = req.params.id;
        const [results, fields] = await connection.query('SELECT * FROM food_items WHERE item_id = ?', [foodId]);

        if (results.length === 0) {
            return res.status(404).json({ error: 'Food not found' })
        }

        const food = new Food(...Object.values(results[0]));
        res.json(food);
    } catch (error) {
        console.error('Error fetching food:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.createFood = async (req, res) => {
    try {
        const { stall_id, item_name, description, price, image_url, is_available, is_breakfast, is_lunch, is_merienda } = req.body;

        const [result, fields] = await connection.query(
            'INSERT INTO food_items (stall_id, item_name, description, price, image_url, is_available, is_breakfast, is_lunch, is_merienda) VALUES (?,?,?,?,?,?,?,?,?)',
            [stall_id, item_name, description, price, image_url, is_available, is_breakfast, is_lunch, is_merienda]
        );

        const newFoodId = result.insertId;

        const [newFoodData] = await connection.query('SELECT * FROM food_items WHERE item_id = ?', [newFoodId]);
        const newFood = new Food(...Object.values(newFoodData[0]))

        res.status(201).json(newFood);
    } catch (error) {
        console.error('Error fetching food:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.updateFood = async (req, res) => {
    try {
        const foodId = req.params.id;
        const { stall_id, item_name, description, price, image_url, is_available, is_breakfast, is_lunch, is_merienda } = req.body;

        const [result, fields] = await connection.query(
            'UPDATE food_items SET stall_id = ?, item_name = ?, description = ?, price = ?, image_url = ?, is_available = ?, is_breakfast = ?, is_lunch = ?, is_merienda = ? WHERE item_id = ?',
            [stall_id, item_name, description, price, image_url, is_available, is_breakfast, is_lunch, is_merienda, foodId]
        );

        if (result.affectedRows === 0) {
            return res.status(404).json({error: 'Food not found'})
        }

        const [updatedFoodData] = await connection.query(
            'SELECT * FROM food_items WHERE item_id = ?', [foodId]
        )
        const updatedFood = new Food(...Object.values(updatedFoodData[0]));

        res.json(updatedFood);
    } catch(error) {
        console.error('Error fetching food:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.deleteFood = async (req, res) => {
    try{
        const foodId = req.params.id;

        const [result, fields] = await connection.query('DELETE FROM food_items WHERE item_id = ?', foodId);

        if (result.affectedRows === 0 ) {
            return res.status(404).json({error: 'Food not found'})
        }

        //Status code 204 cant send messages on the json
        res.status(204).send()
    } catch (error) {
        console.error('Error fetching food:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}