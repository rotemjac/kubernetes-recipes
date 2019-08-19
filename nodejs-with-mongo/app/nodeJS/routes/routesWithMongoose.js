var credentials = require('../db/models/credentials');

var mongoose = require('mongoose');
var config      = require('../db/config.js');
var Credentials = require('../db/models/credentials.js');

//Connect to our database
const dbUrl   = config.url;
const dbParam = { useNewUrlParser: true };


module.exports = (application) => {

    application.get( '/', (req,res)  => {
        //console.log(application);
        res.send("Hi!!!");
    });


    application.get( '/credentials/save',  (req,res)  => {
        const credentials = new Credentials({
            email    : req.query.email,
            password : req.query.password
        });

        try{
            //Save
            console.log("Here");
            return mongoose.createConnection(dbUrl, dbParam).then(
                ()=>{
                    const promiseFromSave =  credentials.save();
                    //return promiseFromSave.then(
                       // ()=>{
                            //Return what is in the DB
                            //const doc =  Credentials.findOne({email:  req.query.email}).exec().then(
                                //()=>{
                                    res.status(201).send({response:'Saved!! '});
                                //}
                            //);
                        //}
                    //);
                }
            );
        } catch (err){
            if (err.name === 'MongoError' && err.code === 11000) {
                res.status(409).send(new MyError('Duplicate key', [err.message]));
            }
            res.status(500).send(err);
        }

    });

    application.get( '/credentials/post', async (req,res)  => {
        console.log("req.query.email: " + req.query.email);
        //return mongoose.createConnection(dbUrl, dbParam).then(
        //    ()=>{
                var Credentials = mongoose.model('Credentials');
                const result = await Credentials.findOne({ email: req.query.email });
                res.json(result);
               //return queryPromise.then(
               //    function(err,doc){
               //        console.log("doc: " + doc);
               //        res.send(doc);
               //    }
               //;
          //  }
        //);
    });


/*
    application.get( '/subscription/all', (req,res)  => {
        application.services.subscriber.subscribe(application, req, res);
    });

    application.post( '/subscription/all', (req,res)  => {
        application.services.subscriber.subscribe(application, req, res);
    });

    application.post( '/subscription', (req,res)  => {
        application.services.subscriber.subscribe(application, req, res);
    });
*/

};