class Solution {
  func generate(_ numRows: Int) -> [[Int]] {
    var pascalTriangle: [[Int]] = [[1]]
    var row: [Int] = [1]
    var left: Int = 0
    var right: Int = 1

    for i in 1..<numRows {
      while right < i {
        let curNum = pascalTriangle[i - 1][left] + pascalTriangle[i - 1][right]
        row.append(curNum)
        left += 1
        right += 1
      }

      row.append(1)
      pascalTriangle.append(row)
      row = [1]
      left = 0
      right = 1
    }

    return pascalTriangle
  }
}
