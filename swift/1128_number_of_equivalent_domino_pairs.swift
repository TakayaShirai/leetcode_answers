class Solution {
  func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
    var dominoesCounter = [Int: Int]()
    var totalCnt = 0

    for domino in dominoes {
      let smallerVal = min(domino[0], domino[1])
      let largerVal = max(domino[0], domino[1])
      let key = smallerVal * 10 + largerVal

      if let cnt = dominoesCounter[key] {
        totalCnt += cnt
        dominoesCounter[key] = cnt + 1
      } else {
        dominoesCounter[key] = 1
      }
    }

    return totalCnt
  }
}
