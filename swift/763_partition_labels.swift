class Solution {
  func partitionLabels(_ s: String) -> [Int] {
    let arrayS = Array(s)

    var charLastIndexes: [Character: Int] = [:]
    var partitions: [Int] = []

    for i in 0..<arrayS.count {
      charLastIndexes[arrayS[i]] = i
    }

    var start: Int = 0
    var end: Int = charLastIndexes[arrayS[start]]!

    while end < arrayS.count {
      end = updateEnd(start, end)
      partitions.append(end - start + 1)

      if end == arrayS.count - 1 {
        return partitions
      }

      start = end + 1
      end = charLastIndexes[arrayS[start]]!
    }

    return [-1]

    func updateEnd(_ start: Int, _ end: Int) -> Int {
      var idx: Int = start + 1
      var curEnd: Int = end

      while idx < curEnd {
        curEnd = max(curEnd, charLastIndexes[arrayS[idx]]!)
        idx += 1
      }

      return curEnd
    }
  }
}
