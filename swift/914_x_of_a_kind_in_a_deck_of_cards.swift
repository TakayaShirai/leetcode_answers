class Solution {
  func hasGroupsSizeX(_ deck: [Int]) -> Bool {
    let numCounts = countNums(in: deck)
    return numCounts.reduce(numCounts[0], calcGCD) > 1
  }

  private func countNums(in nums: [Int]) -> [Int] {
    var numCounter: [Int: Int] = [:]
    for num in nums {
      numCounter[num, default: 0] += 1
    }
    return Array(numCounter.values)
  }

  private func calcGCD(_ num1: Int, _ num2: Int) -> Int {
    return num2 == 0 ? num1 : calcGCD(num2, num1 % num2)
  }
}
