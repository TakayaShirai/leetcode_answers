class Solution {
  func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var minCosts: [Int] = Array(repeating: 0, count: cost.count)

    for index in 0..<cost.count {
      if index < 2 {
        minCosts[index] = cost[index]
      } else {
        minCosts[index] = min(cost[index] + minCosts[index - 1], cost[index] + minCosts[index - 2])
      }
    }

    return min(minCosts[cost.count - 2], minCosts[cost.count - 1])
  }
}
