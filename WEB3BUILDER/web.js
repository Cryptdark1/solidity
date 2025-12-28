const https = require("https");
const url = process.argv[2] || "https://api.coinpaprika.com/v1/tickers/btc-bitcoin";
if (!url){console.log("please provide a url. example: node web.js https://api.coindesk.com/v1/bpi/currentprice.json");
   process.exist(1);
}
https.get(url, (res)=> {
    let data = "";

    res.on("data", (chunk)=> {
        data += chunk;
});
    res.on("end", ()=> {
      try {
        const result = JSON.parse(data);
        console.log (`Bitcoin price in USD: $${ result.quotes.USD.price}`);
        console.log(result)

     } catch (err) {
        console.log("error parsing JSON:" + err.message);
    }
});
}).on("error", (err)=> {
    console.log("request error:" + err.message);
});