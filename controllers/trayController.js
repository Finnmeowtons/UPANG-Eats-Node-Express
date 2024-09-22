const Tray = require('../models/Tray');
const connection = require('../connection/connection');

exports.getAllTrays = async (req, res) => {
    try {
        const [results, fields] = await connection.query('SELECT * FROM trays');
        const trays = results.map(row => new Tray(...Object.values(row)));

        res.json(trays);
    } catch (error) {
        console.error('Error fetching trays:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.getTrayById = async (req, res) => {
    try {
        const trayId = req.params.id;
        const [results, fields] = await connection.query('SELECT * FROM trays WHERE tray_id = ?', [trayId]);

        if (results.length === 0) {
            return res.status(404).json({ error: 'Tray not found' })
        }

        const tray = new Tray(...Object.values(results[0]));
        res.json(tray);
    } catch (error) {
        console.error('Error fetching tray:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.createTray = async (req, res) => {
    try {
        const { user_id, item_id, quantity } = req.body;

        const [result, fields] = await connection.query(
            'INSERT INTO trays (user_id, item_id, quantity) VALUES (?,?,?)',
            [user_id, item_id, quantity]
        );
        
        const newTrayId = result.insertId;

        const [newTrayData] = await connection.query('SELECT * FROM trays WHERE tray_id = ?', [newTrayId]);
        const newTray = new Tray(...Object.values(newTrayData[0]))

        res.status(201).json(newTray);
    } catch (error) {
        console.error('Error fetching tray:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.updateTray = async (req, res) => {
    try {
        const trayId = req.params.id;
        const { quantity } = req.body;

        const [result, fields] = await connection.query(
            'UPDATE trays SET quantity = ? WHERE tray_id = ?',
            [quantity, trayId]
        );

        if (result.affectedRows === 0) {
            return res.status(404).json({error: 'Tray not found'})
        }

        const [updatedTrayData] = await connection.query(
            'SELECT * FROM trays WHERE tray_id = ?', [trayId]
        )
        const updatedTray = new Tray(...Object.values(updatedTrayData[0]));

        res.json(updatedTray);
    } catch(error) {
        console.error('Error fetching tray:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.deleteTray = async (req, res) => {
    try{
        const trayId = req.params.id;

        const [result, fields] = await connection.query('DELETE FROM trays WHERE tray_id = ?', trayId);

        if (result.affectedRows === 0 ) {
            return res.status(404).json({error: 'Tray not found'})
        }

        //Status code 204 cant send messages on the json
        res.status(204).send()
    } catch (error) {
        console.error('Error fetching tray:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}