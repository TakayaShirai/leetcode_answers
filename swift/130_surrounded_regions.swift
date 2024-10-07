class Solution {
  func solve(_ board: inout [[Character]]) {
    let rowLen: Int = board.count
    let colLen: Int = board[0].count
    let directions = [(-1, 0), (0, 1), (0, -1), (1, 0)]

    var queue: [(row: Int, col: Int)] = []
    var isNotSurrondedGrids = Array(
      repeating: Array(repeating: false, count: colLen), count: rowLen)

    for row in 0..<rowLen {
      if board[row][0] == "O" {
        queue.append((row, 0))
        isNotSurrondedGrids[row][0] = true
      }

      if board[row][colLen - 1] == "O" {
        queue.append((row, colLen - 1))
        isNotSurrondedGrids[row][colLen - 1] = true
      }
    }

    for col in 0..<colLen {
      if board[0][col] == "O" && isNotSurrondedGrids[0][col] == false {
        queue.append((0, col))
        isNotSurrondedGrids[0][col] = true
      }

      if board[rowLen - 1][col] == "O" && isNotSurrondedGrids[rowLen - 1][col] == false {
        queue.append((rowLen - 1, col))
        isNotSurrondedGrids[rowLen - 1][col] = true
      }
    }

    while !queue.isEmpty {
      let curGrid = queue.removeFirst()

      for direction in directions {
        let newRow = curGrid.row + direction.0
        let newCol = curGrid.col + direction.1

        if 0 <= newRow && newRow < rowLen && 0 <= newCol && newCol < colLen
          && isNotSurrondedGrids[newRow][newCol] == false && board[newRow][newCol] == "O"
        {
          isNotSurrondedGrids[newRow][newCol] = true
          queue.append((newRow, newCol))
        }
      }
    }

    for row in 0..<rowLen {
      for col in 0..<colLen {
        if board[row][col] == "O" && isNotSurrondedGrids[row][col] == false {
          board[row][col] = "X"
        }
      }
    }
  }
}
