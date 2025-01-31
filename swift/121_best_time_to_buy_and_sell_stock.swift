class Solution {
  func maxProfit(_ prices: [Int]) -> Int {
    var minPrice: Int = Int.max
    var curMaxProfit: Int = 0

    for price in prices {
      minPrice = min(minPrice, price)
      curMaxProfit = max(curMaxProfit, price - minPrice)
    }

    return curMaxProfit
  }
}
