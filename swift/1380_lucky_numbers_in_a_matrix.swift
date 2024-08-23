class Solution {
  func luckyNumbers(_ matrix: [[Int]]) -> [Int] {
    var rowMins: [Int: Int] = [:]

    for r in 0..<matrix.count {
      var curMin: Int = Int(pow(10.0, 5.0))

      for c in 0..<matrix[0].count {
        curMin = min(curMin, matrix[r][c])
      }

      rowMins[curMin] = r
    }

    for c in 0..<matrix[0].count {
      var curMax = 0
      var row = 0

      for r in 0..<matrix.count {
        if curMax < matrix[r][c] {
          curMax = matrix[r][c]
          row = r
        }
      }

      if let r = rowMins[curMax] {
        return [curMax]
      }
    }

    return []

  }
}
