const express = require('express');
const app = express();
const port = 3000;
const apiRoutes = require('./routes/apiRoutes');
const bodyParser = require('body-parser');
const path = require('path');
const cors = require('cors');

app.get('/', (req,res) => {
    res.send("Hello World");
});

app.use(bodyParser.json());

app.use(cors())

app.use('/', apiRoutes);

app.use('/uploads', express.static(path.join(__dirname, 'uploads')));


app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`)
});