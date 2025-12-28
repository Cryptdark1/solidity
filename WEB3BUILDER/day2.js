const https = require("https");
const url = "https://x.com";
https.get(url,(res) => {console.log('website status code for $ {url}: ${res.statusCode}');})
.on("error", (err) => {console.log("Error:" + err.message);});

console.log("fuck u")