class Solution {
  func arrangeCoins(_ n: Int) -> Int {
    // Binary Search
    var left: Int = 1
    var right: Int = n
    var completeRows: Int = 0

    while left <= right {
      let mid: Int = left + (right - left) / 2
      let requiredCoins: Int = calcRequiredCoins(mid)

      if requiredCoins <= n {
        completeRows = mid
        left = mid + 1
      } else {
        right = mid - 1
      }
    }

    return completeRows

    // Brute Force
    // var curStair: Int = 1
    // var remainCoins: Int = n
    // var completeStaircaseCnt: Int = 0

    // while remainCoins >= curStair {
    //     remainCoins -= curStair
    //     curStair += 1
    //     completeStaircaseCnt += 1
    // }

    // return completeStaircaseCnt
  }

  private func calcRequiredCoins(_ staircase: Int) -> Int {
    return staircase * (staircase + 1) / 2
  }
}
