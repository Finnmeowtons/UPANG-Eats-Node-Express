const express = require('express');
const app = express();
const port = 3000;
const apiRoutes = require('./routes/apiRoutes');

app.get('/', (req,res) => {
    res.send("Hello World");
});

app.use('/', apiRoutes);

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`)
});