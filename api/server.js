require("dotenv").config()
const os = require("os");

const express = require("express")
const app = express()
const port = process.env.PORT
const CORS = require("cors")

app.use(CORS())

app.get("/api", (req, res) => {
    res.json({
        hostname: os.hostname(),
        message: "API Route Working",
        api: process.env.OPENROUTER_API_KEY
    });
});

app.listen(port, "0.0.0.0", (err) => {
    if (err) throw err
    console.log(`server running in port: ${port}`)
})
