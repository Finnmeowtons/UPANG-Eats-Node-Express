const connection = require("../connection/connection");

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, 'uploads/');   
   // Destination folder for uploaded images
    },
    filename: (req, file, cb) => {
      const uniqueSuffix = Date.now() + '-' + Math.round(Math.random()   
   * 1E9);
      cb(null, file.fieldname + '-' + uniqueSuffix + '.jpg');   
    }
  });

exports.uploadImage = async (req, res) => {
    try {
        const [results, fields] = await connection.query(`SELECT * FROM orders`);
        const orders = results.map(row => new Order(...Object.values(row)));

        res.json(orders);
    } catch (error) {
        console.error('Error fetching orders:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}