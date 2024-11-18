class Solution {
  func slowestKey(_ releaseTimes: [Int], _ keysPressed: String) -> Character {
    let arrayKeys = Array(keysPressed)
    var slowestKey: (gap: Int, char: Character) = (releaseTimes[0], arrayKeys[0])

    for i in 1..<releaseTimes.count {
      let curGap = releaseTimes[i] - releaseTimes[i - 1]
      let curChar = arrayKeys[i]

      if hasLargerGap(cur: curGap, largest: slowestKey.gap)
        || hasSameGapAndLargerLexOrder(cur: (curGap, curChar), slowest: slowestKey)
      {
        slowestKey = (curGap, curChar)
      }
    }

    return slowestKey.char
  }

  func hasLargerGap(cur: Int, largest: Int) -> Bool {
    if cur > largest {
      return true
    } else {
      return false
    }
  }

  func hasSameGapAndLargerLexOrder(cur: (Int, Character), slowest: (Int, Character)) -> Bool {
    if cur.0 == slowest.0 && cur.1 > slowest.1 {
      return true
    } else {
      return false
    }
  }
}
