var credentials = require('../db/models/credentials');

var MongoClient = require('mongodb').MongoClient;
var config      = require('../db/config.js');

winston = require('winston');
winston.configure({
    transports: [
        new winston.transports.File({
            filename  : '/var/log/syslog',
            level     : 'info',
            json      : true,
            eol       : 'rn',
            timestamp : true
        })
    ]}
);


module.exports = (application) => {

    application.get( '/', (req,res)  => {
        //console.log(application);
        res.send("Hi!!!");
    });


    application.get( '/credentials/save',  async (req,res)  => {
        if(req.query && req.query.DEBUG_MODE){
            const msg = 'In GET /credentials/save - Before insert - Email' +req.query.email;
            winston.info(msg);
            console.log(msg);
        }

        const docToInsert = {
            email    : req.query.email,
            password : req.query.password
        };
        let client = await MongoClient.connect(config.url);
        let db     = await client.db('usersDb');
        db.collection('User').insertOne(docToInsert, function (findErr, result) {
            if (findErr) throw findErr;
            if(req.query && req.query.DEBUG_MODE){
                const msg = 'In GET /credentials/save - After insert - Email' +req.query.email;
                winston.info(msg);
                console.log(msg);
            }
            res.status(201).send({response: result});
            client.close();
        }
        );
    });

    application.get( '/credentials/post', async (req,res)  => {
        let client = await MongoClient.connect(config.url);
        let db     = await client.db('usersDb');

        if(req.query && req.query.DEBUG_MODE){
            const msg = 'In POST /credentials/save - Before find - Email' +req.query.email;
            winston.info(msg);
            console.log(msg);
        }

        db.collection('User').find({}).toArray(function (findErr, result) {
            if (findErr) throw findErr;
            //str = "";
            //result.forEach(function(item) {
            //    if (item != null
            //    //&& item.email == req.query.email
            //    ) {
            //        str = str + "    User password  " + item.password + "</br>";
            //    }
            //});
            if(req.query && req.query.DEBUG_MODE){
                const msg = 'In POST /credentials/save - After find - Email' +req.query.email;
                winston.info(msg);
                console.log(msg);
            }
            res.status(201).send({response: result.length});
            client.close();
        });
    });
};