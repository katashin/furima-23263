if (document.URL.match(/new/)){
function post() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const taxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    
    price = itemPrice.value;

    taxPrice.innerHTML = Math.floor(price * 0.1);
    profit.innerHTML = Math.floor(price - (price * 0.1));
    
  });
}

setInterval(post,1000);
};