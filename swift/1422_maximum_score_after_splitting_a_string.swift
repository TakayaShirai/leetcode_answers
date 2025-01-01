class Solution {
  func maxScore(_ s: String) -> Int {
    // One Pass
    // Time: O(n), Space: O(1)
    var zeroCnt: Int = 0
    var oneCnt: Int = 0
    var best: Int = Int.min

    for (idx, char) in s.enumerated() {
      if idx == s.count - 1 {
        if char == "1" {
          oneCnt += 1
        }
        continue
      }

      if char == "0" {
        zeroCnt += 1
      } else {
        oneCnt += 1
      }

      best = max(zeroCnt - oneCnt, best)
    }

    return oneCnt + best

    // Two Pass
    // Time: O(n), Space: O(1)
    // var oneCnt: Int = 0

    // for char in s {
    //     if char == "1" {
    //         oneCnt += 1
    //     }
    // }

    // var leftScore: Int = 0
    // var rightScore: Int = oneCnt
    // var curMaxScore: Int = 0

    // for (idx, char) in s.enumerated() {
    //     if idx == s.count - 1 {
    //         continue
    //     }

    //     if char == "0" {
    //         leftScore += 1
    //         curMaxScore = max(curMaxScore, leftScore + rightScore)
    //     } else if char == "1" {
    //         rightScore -= 1
    //         curMaxScore = max(curMaxScore, leftScore + rightScore)
    //     }
    // }

    // return curMaxScore
  }
}
