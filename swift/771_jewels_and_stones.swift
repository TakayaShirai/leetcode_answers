class Solution {
  func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
    let jewelTypes: Set<Character> = Set(jewels)

    var jewelCnt: Int = 0

    for stone in stones {
      if jewelTypes.contains(stone) {
        jewelCnt += 1
      }
    }

    return jewelCnt
  }
}
