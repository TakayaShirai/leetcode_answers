class Solution {
  func lastStoneWeight(_ stones: [Int]) -> Int {
    var sortedStones: [Int] = stones

    while sortedStones.count > 1 {
      sortedStones.sort()
      let heaviestStone = sortedStones.removeLast()
      let secondHeaviestStone = sortedStones.removeLast()

      if heaviestStone != secondHeaviestStone {
        sortedStones.append(heaviestStone - secondHeaviestStone)
      }
    }

    return sortedStones.isEmpty ? 0 : sortedStones[0]
  }
}
