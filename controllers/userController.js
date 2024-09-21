const User = require('../models/User');
const connection = require('../connection/connection');

exports.getAllUsers = async (req, res) => {
    try {
        const [results, fields] = await connection.query('SELECT * FROM users');
        const users = results.map(row => new User(...Object.values(row)));

        res.json(users);
    } catch (error) {
        console.error('Error fetching users:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.getUserById = async (req, res) => {
    try {
        const userId = req.params.id;
        const [results, fields] = await connection.query('SELECT * FROM users WHERE user_id = ?', [userId]);

        if (results.length === 0) {
            return res.status(404).json({ error: 'User not found' })
        }

        const user = new User(...Object.values(results[0]));
        res.json(user);
    } catch (error) {
        console.error('Error fetching user:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.createUser = async (req, res) => {
    try {
        const { student_id, first_name, last_name, email, password, phone_number, user_type } = req.body;

        const [result, fields] = await connection.query(
            'INSERT INTO users (student_id, first_name, last_name, email, password, phone_number, user_type) VALUES (?,?,?,?,?,?,?)',
            [student_id, first_name, last_name, email, password, phone_number, user_type]
        );

        const newUserId = result.insertId;

        const [newUserData] = await connection.query('SELECT * FROM users WHERE user_id = ?', [newUserId]);
        const newUser = new User(...Object.values(newUserData[0]))

        res.status(201).json(newUser);
    } catch (error) {
        console.error('Error fetching user:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.updateUser = async (req, res) => {
    try {
        const userId = req.params.id;
        const { student_id, first_name, last_name, email, password, phone_number, user_type } = req.body;

        const [result, fields] = await connection.query(
            'UPDATE users SET student_id = ?, first_name = ?, last_name = ?, email = ?, password = ?, phone_number = ?, user_type = ? WHERE user_id = ?',
            [student_id, first_name, last_name, email, password, phone_number, user_type, userId]
        );

        if (result.affectedRows === 0) {
            return res.status(404).json({error: 'User not found'})
        }

        const [updatedUserData] = await connection.query(
            'SELECT * FROM users WHERE user_id = ?', [userId]
        )
        const updatedUser = new User(...Object.values(updatedUserData[0]));

        res.json(updatedUser);
    } catch(error) {
        console.error('Error fetching user:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.deleteUser = async (req, res) => {
    try{
        const userId = req.params.id;

        const [result, fields] = await connection.query('DELETE FROM users WHERE user_id = ?', userId);

        if (result.affectedRows === 0 ) {
            return res.status(404).json({error: 'User not found'})
        }

        //Status code 204 cant send messages on the json
        res.status(204).send()
    } catch (error) {
        console.error('Error fetching user:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}