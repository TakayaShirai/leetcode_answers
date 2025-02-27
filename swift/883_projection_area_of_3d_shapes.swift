class Solution {
  func projectionArea(_ grid: [[Int]]) -> Int {
    var rowMaxs: [Int] = Array(repeating: 0, count: grid.count)
    var colMaxs: [Int] = Array(repeating: 0, count: grid[0].count)
    var nonZeroCnt: Int = 0

    for row in 0..<grid.count {
      for col in 0..<grid[0].count {
        let curGridVal: Int = grid[row][col]
        if curGridVal != 0 {
          nonZeroCnt += 1
        }

        rowMaxs[row] = max(rowMaxs[row], curGridVal)
        colMaxs[col] = max(colMaxs[col], curGridVal)
      }
    }

    return rowMaxs.total() + colMaxs.total() + nonZeroCnt
  }
}

extension Array where Element: Numeric {
  func total() -> Element {
    return self.reduce(0, +)
  }
}
