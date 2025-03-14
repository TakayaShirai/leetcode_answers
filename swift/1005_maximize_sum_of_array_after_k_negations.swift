class Solution {
  func largestSumAfterKNegations(_ nums: [Int], _ k: Int) -> Int {
    let sortedNums: [Int] = nums.sorted { $0 < $1 }
    var remainingFlip: Int = k
    var absMinNum: Int = Int.max
    var total: Int = 0

    for num in sortedNums {
      absMinNum = min(absMinNum, abs(num))
      if num < 0 && remainingFlip > 0 {
        remainingFlip -= 1
        total += -num
      } else {
        total += num
      }
    }

    return remainingFlip % 2 == 0 ? total : total - absMinNum * 2
  }
}
