require('dotenv').config();


const mysql = require('mysql2/promise');
console.log('DB_USER:', process.env.DB_USER);

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port:   process.env.DB_PORT,
  waitForConnections: true,
  connectionLimit: 10,
});


module.exports = pool;
