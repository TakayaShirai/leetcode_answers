class Solution {
  func distributeCandies(_ candyType: [Int]) -> Int {
    let candyKindCnt: Int = Set(candyType).count
    let canEatCandyCnt: Int = candyType.count / 2
    return canEatCandyCnt >= candyKindCnt ? candyKindCnt : canEatCandyCnt
  }
}
