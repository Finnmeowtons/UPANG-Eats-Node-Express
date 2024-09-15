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
