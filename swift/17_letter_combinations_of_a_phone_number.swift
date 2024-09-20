class Solution {
  func letterCombinations(_ digits: String) -> [String] {
    guard digits != "" else { return [] }

    var possibleComb: [String] = []
    let digitsArray = Array(digits)
    let numToStr: [Character: [Character]] = [
      "2": ["a", "b", "c"],
      "3": ["d", "e", "f"],
      "4": ["g", "h", "i"],
      "5": ["j", "k", "l"],
      "6": ["m", "n", "o"],
      "7": ["p", "q", "r", "s"],
      "8": ["t", "u", "v"],
      "9": ["w", "x", "y", "z"],
    ]

    var curComb: [String] = []

    func backtrack(_ index: Int, _ comb: [Character]) {
      if index == digits.count {
        possibleComb.append(String(comb))
        return
      }

      guard let chars = numToStr[digitsArray[index]] else { return }
      var curComb = comb

      for char in chars {
        curComb.append(char)
        backtrack(index + 1, curComb)
        curComb.removeLast()
      }
    }

    backtrack(0, [])
    return possibleComb
  }
}
