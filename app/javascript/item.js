const priceInput = document.getElementById('item-price');

  priceInput.addEventListener('input', calculateFeesAndProfit);

  function calculateFeesAndProfit() {
    const price = parseFloat(priceInput.value);

    const fee = Math.floor(price * 0.1);
    const profit = Math.floor(price - fee);

    const feeElement = document.getElementById('add-tax-price');
    const profitElement = document.getElementById('profit');

    feeElement.textContent = fee;
    profitElement.textContent = profit;
  }

    //  feeElement.textContent = fee;
    //  const profitElement = document.getElementById('profit');
    //  profitElement.textContent = profit;

  // function calculateFeesAndProfit() {
  //   const price = parseFloat(priceInput.value);

  //   const fee = Math.floor(price * 0.1);
  //   const profit = Math.floor(price - fee);

  //    const feeElement = document.getElementById('add-tax-price');
  //    const profitElement = document.getElementById('profit');

  //     feeElement.textContent = fee;
  //     profitElement.textContent = profit;

