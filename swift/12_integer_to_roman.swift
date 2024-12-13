class Solution {
  func intToRoman(_ num: Int) -> String {
    let symbolValueList: [(symbol: String, value: Int)] = [
      ("M", 1000), ("CM", 900), ("D", 500), ("CD", 400),
      ("C", 100), ("XC", 90), ("L", 50), ("XL", 40),
      ("X", 10), ("IX", 9), ("V", 5), ("IV", 4), ("I", 1),
    ]

    var curNum: Int = num
    var resRoman: String = ""

    for item in symbolValueList {
      let symbol: String = item.symbol
      let value: Int = item.value

      let requiredNumOfSymbol = curNum / value

      if requiredNumOfSymbol > 0 {
        resRoman = addSymbols(resRoman, symbol, requiredNumOfSymbol)
        curNum %= value
      }
    }

    return resRoman
  }

  private func addSymbols(_ roman: String, _ symbol: String, _ numOfSymbols: Int) -> String {
    var curRoman: String = roman

    for _ in 0..<numOfSymbols {
      curRoman += symbol
    }

    return curRoman
  }
}
