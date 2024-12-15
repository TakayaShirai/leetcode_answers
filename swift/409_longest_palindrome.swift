class Solution {
  func longestPalindrome(_ s: String) -> Int {
    // Hash Set
    var seenChars: [Character: Int] = [:]
    var maxLen: Int = 0

    for char in s {
      seenChars[char, default: 0] += 1
    }

    var existOddCnt: Bool = false

    for seenCharCnt in seenChars.values {
      if seenCharCnt % 2 == 0 {
        maxLen += seenCharCnt
      } else {
        existOddCnt = true
        maxLen += seenCharCnt - 1
      }
    }

    if existOddCnt {
      maxLen += 1
    }

    return maxLen

    // Greedy
    // var seenChars: [Character : Int] = [:]
    // var oddCharCnt: Int = 0

    // for char in s {
    //     seenChars[char, default: 0] += 1

    //     if seenChars[char]! % 2 == 1 {
    //         oddCharCnt += 1
    //     } else {
    //         oddCharCnt -= 1
    //     }
    // }

    // if oddCharCnt > 0 {
    //     return s.count - oddCharCnt + 1
    // } else {
    //     return s.count
    // }

    // Greedy with hash set
    // var seenChars: Set<Character> = []
    // var maxLen: Int = 0

    // for char in s {
    //     if seenChars.contains(char) {
    //         seenChars.remove(char)
    //         maxLen += 2
    //     } else {
    //         seenChars.insert(char)
    //     }
    // }

    // if seenChars.count > 0 {
    //      maxLen += 1
    // }

    // return maxLen
  }
}
