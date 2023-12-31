const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

// Define endpoint
app.get('/hello', (req, res) => {
  res.send('Hello, World!');
});

// Start the server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});