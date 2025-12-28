const https = require("https");
const coinid = process.argv [2] || "btc-bitcoin"
const url = `https://api.coinpaprika.com/v1/tickers/${coinid} `;

if(!coinid){console.log("pls input your url:");
    process.exist(1);
}
function fetchprice(){
    https.get(url, (res)=> {
         data = "";

        res.on("data",(chunks)=>{
        data += chunks ;
   });

        res.on ("end", ()=>{
            try {
               let result = JSON.parse(data);
               if ( result.quotes && result.quotes.USD && result.quotes.USD.price){
                console.log(`${coinid.toUpperCase()} price in usd is: $${result.quotes.USD.price.toFixed(2)}`);
              }else{ 
                console.log("invalid coin");
            }
        }   catch(err){ 
                console.log("error occurred while fetching data"+ err.message);
        }
    });
}).on("error", (err)=> {
    console.log("issue loading site"+ err.message);
})}
fetchprice();
const refreshsec = process.argv[3] ? parseInt(process.argv[3]) : 0;
if (refreshsec > 0) {
        setInterval ( fetchprice, refreshsec * 1000);
}