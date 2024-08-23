class Solution {
  func isValidSudoku(_ board: [[Character]]) -> Bool {
    var colsSet = [Set<Character>](repeating: Set<Character>(), count: 9)
    var rowsSet = [Set<Character>](repeating: Set<Character>(), count: 9)
    var squaresSet = [Set<Character>](repeating: Set<Character>(), count: 9)

    for c in 0..<9 {
      for r in 0..<9 {
        if board[c][r] == "." {
          continue
        }

        let squareIndex: Int = (r / 3) * 3 + (c / 3)

        if colsSet[c].contains(board[c][r])
          || rowsSet[r].contains(board[c][r])
          || squaresSet[squareIndex].contains(board[c][r])
        {
          return false
        }

        colsSet[c].insert(board[c][r])
        rowsSet[r].insert(board[c][r])
        squaresSet[squareIndex].insert(board[c][r])
      }
    }

    return true
  }
}
