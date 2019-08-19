const express          = require('express');
const consign          = require('consign');
const bodyParser       = require('body-parser');
const expressValidator = require('express-validator');

const app = express();
require('./routes/routes.js')(app);
//require('./db/db.js');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(expressValidator());

//consign()
//    .include('/db/db.js')
//    .then('/routes/routes.js')
//    .into(app);

const port = process.env.PORT || 8080;
app.listen(port, () => {
    console.log('Server is running on port: ' +port);
});

module.exports = app;