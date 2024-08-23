class Solution {
  func maxProfit(_ prices: [Int]) -> Int {
    var maxProfit: Int = 0
    var left: Int = 0
    var right: Int = 0

    while right < prices.count {
      if prices[left] < prices[right] {
        maxProfit = max(maxProfit, prices[right] - prices[left])
        right += 1
      } else {
        left = right
        right = left + 1
      }
    }

    return maxProfit
  }
}

class Solution {
  func maxProfit(_ prices: [Int]) -> Int {
    var maxProfit: Int = 0
    var left: Int = 0
    var right: Int = 0

    while right < prices.count {
      if prices[left] < prices[right] {
        maxProfit = max(maxProfit, prices[right] - prices[left])
        right += 1
      } else {
        left = right
        right = left + 1
      }
    }

    return maxProfit
  }
}
