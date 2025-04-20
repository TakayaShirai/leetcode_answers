class Solution {
  func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
    var lastDistributes: [Int] = Array(repeating: 0, count: num_people)
    var remainingCandies: Int = candies
    var curCandies: Int = 1
    var curIdx: Int = 0

    while remainingCandies > 0 {
      if curIdx >= num_people {
        curIdx = 0
      }

      guard remainingCandies >= curCandies else {
        lastDistributes[curIdx] += remainingCandies
        break
      }

      lastDistributes[curIdx] += curCandies
      remainingCandies -= curCandies
      curIdx += 1
      curCandies += 1
    }

    return lastDistributes
  }
}
