class Solution {
  func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
    var results: [[Int]] = []

    let rowLen: Int = heights.count
    let colLen: Int = heights[0].count
    let directions = [(-1, 0), (0, 1), (0, -1), (1, 0)]

    var canReachAtlantic = Array(repeating: Array(repeating: false, count: colLen), count: rowLen)
    var canReachPacific = Array(repeating: Array(repeating: false, count: colLen), count: rowLen)

    var queueAtlantic: [(row: Int, col: Int)] = []
    var queuePacific: [(row: Int, col: Int)] = []

    for row in 0..<rowLen {
      canReachPacific[row][0] = true
      canReachAtlantic[row][colLen - 1] = true

      queuePacific.append((row, 0))
      queueAtlantic.append((row, colLen - 1))
    }

    for col in 0..<colLen {
      canReachPacific[0][col] = true
      canReachAtlantic[rowLen - 1][col] = true

      queuePacific.append((0, col))
      queueAtlantic.append((rowLen - 1, col))
    }

    while !queuePacific.isEmpty {
      let curPos = queuePacific.removeFirst()

      for direction in directions {
        let newRow = curPos.row + direction.0
        let newCol = curPos.col + direction.1

        if 0 <= newRow && newRow < rowLen && 0 <= newCol && newCol < colLen
          && heights[newRow][newCol] >= heights[curPos.row][curPos.col]
          && canReachPacific[newRow][newCol] == false
        {
          queuePacific.append((newRow, newCol))
          canReachPacific[newRow][newCol] = true
        }
      }
    }

    while !queueAtlantic.isEmpty {
      let curPos = queueAtlantic.removeFirst()

      for direction in directions {
        let newRow = curPos.row + direction.0
        let newCol = curPos.col + direction.1

        if 0 <= newRow && newRow < rowLen && 0 <= newCol && newCol < colLen
          && heights[newRow][newCol] >= heights[curPos.row][curPos.col]
          && canReachAtlantic[newRow][newCol] == false
        {
          queueAtlantic.append((newRow, newCol))
          canReachAtlantic[newRow][newCol] = true
        }
      }
    }

    for row in 0..<rowLen {
      for col in 0..<colLen {
        if canReachPacific[row][col] == true && canReachAtlantic[row][col] == true {
          results.append([row, col])
        }
      }
    }

    return results
  }
}
