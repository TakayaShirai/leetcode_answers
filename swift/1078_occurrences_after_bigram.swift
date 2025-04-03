class Solution {
  func findOcurrences(_ text: String, _ first: String, _ second: String) -> [String] {
    var thirdStrs: [String] = []
    let inputStrs: [String] = text.split(separator: " ").map { String($0) }

    guard inputStrs.count >= 3 else { return [] }

    let maxFirstIdx: Int = inputStrs.count - 3

    for firstIdx in 0...maxFirstIdx {
      let firstStr: String = inputStrs[firstIdx]
      let secondStr: String = inputStrs[firstIdx + 1]
      guard firstStr == first && secondStr == second else { continue }
      thirdStrs.append(inputStrs[firstIdx + 2])
    }

    return thirdStrs
  }
}
