class Solution {
  func fairCandySwap(_ aliceSizes: [Int], _ bobSizes: [Int]) -> [Int] {
    let aliceCandyTotal: Int = aliceSizes.total()
    let bobCandyTotal: Int = bobSizes.total()
    let bobSizeSet: Set<Int> = createSizeSet(of: bobSizes)

    for aliceSize in aliceSizes {
      let doubleReqSizeFromBob: Int = 2 * aliceSize + bobCandyTotal - aliceCandyTotal
      guard doubleReqSizeFromBob % 2 == 0 else { continue }
      let requiredSizeFromBob: Int = doubleReqSizeFromBob / 2

      if bobSizeSet.contains(requiredSizeFromBob) {
        return [aliceSize, requiredSizeFromBob]
      }
    }

    return [-1, -1]
  }

  private func createSizeSet(of sizes: [Int]) -> Set<Int> {
    var sizeSet: Set<Int> = []
    for size in sizes {
      sizeSet.insert(size)
    }
    return sizeSet
  }
}

extension Array where Element: Numeric {
  func total() -> Element {
    return self.reduce(0, +)
  }
}
