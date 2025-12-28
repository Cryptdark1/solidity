// || "https://api.coinpaprika.com/v1/tickers/btc-bitcoin"
//$${ result.quotes.USD.price}
// a code that takes url, if no url it ask for url and stop if url it goes into the url and takes data then displays it.

const https = require("https");
const url = process.argv[2] || "https://api.coinpaprika.com/v1/tickers/btc-bitcoin"

if (!url){
    console.log("pls input your url");
    process.exist(1);
}

https.get(url, (res)=>{
    let data = "";
    
    res.on("data", (chunks)=>{
        data += chunks;
    })
    res.on("end", ()=> {
        try{
           let result = JSON.parse(data);
           console.log(`this is the price of bicoin : $${result.quotes.USD.price}`)
}       catch(err){
            console.log("data couldnt be passed" + err.message)

}})
}).on("error", (err) =>{
    console.log("error occurred while loading url:"+ err.message)
})


    