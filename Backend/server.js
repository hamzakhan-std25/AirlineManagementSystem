const express = require('express');
const cors = require('cors');
const app = express();

const passengerRoutes = require('./routes/passengers');

app.use(cors());
app.use(express.json());

app.use('/passengers', passengerRoutes);

app.listen(3000, () => console.log('Backend running on port 3000'));
