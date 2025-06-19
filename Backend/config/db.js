const mysql = require('mysql2');
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'sql@hum229953409',
    database: 'AirlineDB'
});
module.exports = pool.promise();
