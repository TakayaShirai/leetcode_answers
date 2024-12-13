class Solution {
  func minimumCost(_ cost: [Int]) -> Int {
    let sortedCosts: [Int] = cost.sorted()
    var totalCost: Int = 0

    var remainingPurchasesForFree: Int = 2
    var canGetFreeCandy: Bool {
      remainingPurchasesForFree == 0
    }

    for cost in sortedCosts.reversed() {
      if canGetFreeCandy {
        remainingPurchasesForFree = 2
        continue
      }

      totalCost += cost
      remainingPurchasesForFree -= 1
    }

    return totalCost
  }
}
