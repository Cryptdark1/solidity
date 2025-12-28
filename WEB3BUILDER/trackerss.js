// https://api.coinpaprika.com/v1/tickers/btc-bitcoin
const https = require("https");
const url = process.argv [2]|| "https://api.coinpaprika.com/v1/tickers/btc-bitcoin ";

if(!url){console.log("pls input your url:");
    process.exist(1);
}
https.get(url, (res)=> {
    data = "";

    res.on("data",(chunks)=>{
    data += chunks ;
});

    res.on ("end", ()=>{
        try {
            let result = JSON.parse(data)
            console.log(`Bitcoin price in usd is: $${  result.quotes.USD.price}`)
            console.log(result);
        }catch(err){ 
            console.log("error occurred while fetching data"+ err.message);
        }
});
}).on("error", (err)=> {
    console.log("issue loading site"+ err.message);
})