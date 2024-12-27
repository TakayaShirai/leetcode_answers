class Solution {
  func getRow(_ rowIndex: Int) -> [Int] {
    var curRowValues: [Int] = [1]

    for i in 0..<rowIndex {
      var nextRowValues: [Int] = Array(repeating: 0, count: curRowValues.count + 1)

      for j in 0..<curRowValues.count {
        nextRowValues[j] += curRowValues[j]
        nextRowValues[j + 1] += curRowValues[j]
      }

      curRowValues = nextRowValues
    }

    return curRowValues

    // if rowIndex == 0 {
    //   return [1]
    // }

    // let prevRow = getRow(rowIndex - 1)
    // var left: Int = -1
    // var curRow: [Int] = []

    // while left < prevRow.count {
    //   if left == -1 {
    //     curRow.append(prevRow[0])
    //   } else if left == prevRow.count - 1 {
    //     curRow.append(prevRow[left])
    //   } else {
    //     curRow.append(prevRow[left] + prevRow[left + 1])
    //   }

    //   left += 1
    // }

    // return curRow
  }
}
