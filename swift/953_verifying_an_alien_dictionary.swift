class Solution {
  func isAlienSorted(_ words: [String], _ order: String) -> Bool {
    let orderMap: [Character: Int] = createOrderMap(order)
    var leftWord: String = words[0]

    for (idx, rightWord) in words.enumerated() {
      if idx == 0 {
        continue
      }

      guard isSorted(leftWord: leftWord, rightWord: rightWord, orderMap: orderMap) else {
        return false
      }
      leftWord = rightWord
    }

    return true
  }

  private func isSorted(leftWord: String, rightWord: String, orderMap: [Character: Int]) -> Bool {
    for (leftChar, rightChar) in zip(leftWord, rightWord) {
      let leftCharPos: Int = orderMap[leftChar, default: -1]
      let rightCharPos: Int = orderMap[rightChar, default: -1]

      if leftCharPos < rightCharPos {
        return true
      } else if leftCharPos == rightCharPos {
        continue
      } else {
        return false
      }
    }

    return leftWord.count <= rightWord.count
  }

  private func createOrderMap(_ order: String) -> [Character: Int] {
    var orderMap: [Character: Int] = [:]

    for (idx, char) in order.enumerated() {
      orderMap[char] = idx
    }

    return orderMap
  }
}
