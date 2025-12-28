const text = `Journey to fullstack Blockchain Dev, fueled by curiosity & pure consistency.

Powered by caffein. `

const element = document.getElementById("intro-text");
const coffeeimg = document.getElementById("cuffee");
const cup = document.getElementById("cuffeeCup");


let i = 0;

function type(){
    if (i < text.length){
        element.innerHTML += text.charAt(i);
        i++;
        setTimeout(type, 60)// typing speed
        
    } else{
         coffeeimg.classList.remove("hidden")
        coffeeimg.classList.add("reveal")
    }
        
  
}
window.onload = type;
const navlink = document.getElementById("navbar");
const hambar = document.getElementById("ham-bar");
hambar.addEventListener('click', () => {
 navlink.classList.toggle('active');
})

