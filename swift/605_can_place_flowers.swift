class Solution {
  func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
    var curPlantedCnt: Int = 0
    var curFlowerbed: [Int] = flowerbed

    for idx in 0..<flowerbed.count {
      if canPlantFlowers(at: idx, in: curFlowerbed) {
        curPlantedCnt += 1
        curFlowerbed[idx] = 1
      }

      if curPlantedCnt >= n {
        break
      }
    }

    return curPlantedCnt >= n
  }

  private func canPlantFlowers(at plotIdx: Int, in flowerbed: [Int]) -> Bool {
    let prevPlotIdx: Int = plotIdx - 1 >= 0 ? plotIdx - 1 : 0
    let nextPlotIdx: Int = plotIdx + 1 < flowerbed.count ? plotIdx + 1 : flowerbed.count - 1
    return flowerbed[prevPlotIdx] == 0 && flowerbed[plotIdx] == 0 && flowerbed[nextPlotIdx] == 0
  }
}
