class Solution {
  func maxProfit(_ prices: [Int]) -> Int {
    var maxProfit: Int = 0
    var curBuyPrice: Int = prices[0]

    for price in prices {
      if price > curBuyPrice {
        maxProfit += price - curBuyPrice
      }

      curBuyPrice = price
    }

    return maxProfit
  }
}
