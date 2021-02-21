const express = require('express');
const PORT = process.env.PORT || 3000;
const app = express();

app.get('/', (req, res) => {
  res.send('<p style="font-size: 115px;text-align: center;margin: 20%;">Hello Word!!!');
});

app.listen(PORT, () => console.log('app listening on port ' + PORT + '!'));