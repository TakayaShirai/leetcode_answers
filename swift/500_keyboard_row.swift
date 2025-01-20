class Solution {

  private enum Row {
    case firstRow
    case secondRow
    case thirdRow
  }

  func findWords(_ words: [String]) -> [String] {
    var res: [String] = []

    for word in words {
      var prevRow: Row = defineRow(String(word[word.startIndex]).lowercased())

      for (idx, char) in word.enumerated() {
        let curRow: Row = defineRow(String(char).lowercased())

        if curRow != prevRow {
          break
        }

        prevRow = curRow

        if idx == word.count - 1 {
          res.append(word)
        }
      }
    }

    return res
  }

  private func defineRow(_ str: String) -> Row {
    var firstRowSet = Set("qwertyuiop")
    var secondRowSet = Set("asdfghjkl")
    var thirsRowSet = Set("zxcvbnm")

    if firstRowSet.contains(str) {
      return Row.firstRow
    } else if secondRowSet.contains(str) {
      return Row.secondRow
    } else {
      return Row.thirdRow
    }
  }
}
