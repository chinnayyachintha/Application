const express = require('express');
const https = require('https');
const fs = require('fs');
const mysql = require('mysql2');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

// MySQL database connection
const db = mysql.createConnection({
  host: 'mysql-container',   // This should match the name of your MySQL container in Docker
  user: 'root',              // MySQL user
  password: 'India@123!@#',  // MySQL root password
  database: 'userdb',        // Your database name
  port: 3306                 // MySQL port (default: 3306)
});

// Test database connection
db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL database');
});

// Get all users
app.get('/users', (req, res) => {
  db.query('SELECT * FROM users', (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.json(results);
  });
});

// Add new user
app.post('/users', (req, res) => {
  const { name, email } = req.body;
  const query = 'INSERT INTO users (name, email) VALUES (?, ?)';
  db.query(query, [name, email], (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.status(201).json({ id: results.insertId });
  });
});

// Delete a user
app.delete('/users/:id', (req, res) => {
  const { id } = req.params;
  db.query('DELETE FROM users WHERE id = ?', [id], (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.status(204).send();
  });
});

// SSL certificates
const sslOptions = {
  key: fs.readFileSync('./certs/server.key'),
  cert: fs.readFileSync('./certs/server.crt')
};

// Start server with HTTPS
https.createServer(sslOptions, app).listen(3000, () => {
  console.log('Backend API running on https://localhost:3000');
});
