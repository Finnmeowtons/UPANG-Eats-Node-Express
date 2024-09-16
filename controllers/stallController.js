const Stall = require('../models/Stall');
const connection = require('../connection/connection')

exports.getAllStalls = async (req, res) => {
    try {
        const [results, fields] = await connection.query('SELECT * FROM stalls');
        const stalls = results.map(row => new Stall(...Object.values(row)));

        res.json(stalls);
    } catch (error) {
        console.error('Error fetching stalls:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.getStallById = async (req, res) => {
    try {
        console.log("wow")
        const stallId = req.params.id;
        const [results, fields] = await connection.query('SELECT * FROM stalls WHERE stall_id = ?', [stallId]);

        if (results.length === 0) {
            return res.status(404).json({ error: 'Stall not found' })
        }

        const stall = new Stall(...Object.values(results[0]));
        res.json(stall);
    } catch (error) {
        console.error('Error fetching stall:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.createStall = async (req, res) => {
    try {
        const { stall_name, owner_id, description, contact_number, image_url, image_banner_url } = req.body;

        const [result, fields] = await connection.query(
            'INSERT INTO stalls (stall_name, owner_id, description, contact_number, image_url, image_banner_url) VALUES (?,?,?,?,?,?)',
            [stall_name, owner_id, description, contact_number, image_url, image_banner_url]
        );

        const newStallId = result.insertId;

        const [newStallData] = await connection.query('SELECT * FROM stalls WHERE stall_id = ?', [newStallId]);
        const newStall = new Stall(...Object.values(newStallData[0]))

        res.status(201).json(newStall);
    } catch (error) {
        console.error('Error fetching stall:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.updateStall = async (req, res) => {
    try {
        const stallId = req.params.id;
        const { stall_name, description, contact_number, image_url, image_banner_url } = req.body;

        const [result, fields] = await connection.query(
            'UPDATE stalls SET stall_name = ?, description = ?, contact_number = ?, image_url = ?, image_banner_url = ? WHERE stall_id = ?',
            [stall_name, description, contact_number, image_url, image_banner_url, stallId]
        );

        if (result.affectedRows === 0) {
            return res.stall(404).json({error: 'Stall not found'})
        }

        const [updatedStallData] = await connection.query(
            'SELECT * FROM stalls WHERE stall_id = ?', [stallId]
        )
        const updatedStall = new Stall(...Object.values(updatedStallData[0]));

        res.json(updatedStall);
    } catch(error) {
        console.error('Error fetching stall:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}

exports.deleteStall = async (req, res) => {
    try{
        const stallId = req.params.id;

        const [result, query] = await connection.query('DELETE FROM stalls WHERE stall_id = ?', stallId);

        if (result.affectedRows === 0 ) {
            return res.status(404).json({error: 'Stall not found'})
        }

        //Status code 204 cant send messages on the json
        res.status(204).send()
    } catch (error) {
        console.error('Error fetching stall:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}
