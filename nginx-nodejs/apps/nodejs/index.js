const express = require("express");
const app  = express();
const PORT = process.env.PORT || 4000;


app.get("/", async (req, res) => {
    res.send("Hello fom endpoint99999 !!");
});

app.get("/two-times", async (req, res) => {
    res.send("Hello Hello !!");
});

app.get("/three-times", async (req, res) => {
    res.send("Hello Hello Hello !!");
});

app.listen(PORT, () => {
    console.log("Listening on port "+PORT+"...");
});