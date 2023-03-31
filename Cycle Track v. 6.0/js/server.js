const express = require('express');
const bodyParser = require('body-parser');
const { Spanner } = require('@google-cloud/spanner');

const app = express();

// Initialize Google Cloud Spanner client
const spanner = new Spanner({
  projectId: 'cycletrackdb',
  keyFilename: 'gs://cycletrack-key-fil/sc-cycletrack-fd3402d90f0b.json',
});

const instance = spanner.instance('[cycletrackdb]');
const database = instance.database('[cycletrack-app-users]');

// Middleware for parsing request body
app.use(bodyParser.json());

// Handle POST request to /signup endpoint
app.post('/signup', async (req, res) => {
  const { username, email, password } = req.body;

  try {
    // Write user data to Cloud Spanner
    const transaction = database.transaction();
    const [rowCount] = await transaction.runUpdate({
      sql: `INSERT INTO Users (Username, Email, Password) VALUES (@username, @email, @password)`,
      params: {
        username,
        email,
        password,
      },
    });
    await transaction.commit();

    res.redirect('/bike.html');
  } catch (err) {
    console.error(err);
    res.status(500).send('Error saving user data');
  }
});

// Start server
app.listen(3000, () => {
  console.log('Server listening on port 3000');
});
