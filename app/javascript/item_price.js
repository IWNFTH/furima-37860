window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const Tax = 0.1;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * Tax); //入力した金額をもとに販売手数料を計算する処理
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = Math.floor(priceInput.value - addTaxDom.innerHTML);
  })
})