class Solution {
  func slowestKey(_ releaseTimes: [Int], _ keysPressed: String) -> Character {
    let arrayKeys = Array(keysPressed)
    var slowestKey: (gap: Int, char: Character) = (releaseTimes[0], arrayKeys[0])

    for i in 1..<releaseTimes.count {
      let curGap = releaseTimes[i] - releaseTimes[i - 1]
      let curChar = arrayKeys[i]

      if curGap > slowestKey.gap || (curGap == slowestKey.gap && curChar > slowestKey.char) {
        slowestKey = (curGap, curChar)
      }
    }

    return slowestKey.char
  }
}
