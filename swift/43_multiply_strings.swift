class Solution {
  func multiply(_ num1: String, _ num2: String) -> String {
    guard num1 != "0" && num2 != "0" else { return "0" }

    let num1Array = Array(num1)
    let num2Array = Array(num2)
    var curMulResArray: [Int] = Array(repeating: 0, count: num1.count + num2.count)

    for idx1 in (0..<num1Array.count).reversed() {
      for idx2 in (0..<num2Array.count).reversed() {
        let curNum1 = convertCharToInt(num1Array[idx1])
        let curNum2 = convertCharToInt(num2Array[idx2])
        let existingNum = extractExistingNum(curMulResArray, idx1, idx2)

        let curSum = curNum1 * curNum2 + existingNum
        curMulResArray = updateMulResArray(curMulResArray, curSum, idx1, idx2)
        print(curMulResArray)
      }
    }

    curMulResArray = deletePrefixZero(curMulResArray)

    let resString = convertIntArrayToString(curMulResArray)

    return resString
  }

  private func convertCharToInt(_ char: Character) -> Int {
    let charToIntMap: [Character: Int] = [
      "0": 0,
      "1": 1,
      "2": 2,
      "3": 3,
      "4": 4,
      "5": 5,
      "6": 6,
      "7": 7,
      "8": 8,
      "9": 9,
    ]

    guard let convertedNum = charToIntMap[char] else { return -1 }

    return convertedNum
  }

  private func extractExistingNum(_ mulResArray: [Int], _ idx1: Int, _ idx2: Int) -> Int {
    let tensDigitIdx: Int = idx1 + idx2
    let onesDigitIdx: Int = idx1 + idx2 + 1

    return 10 * mulResArray[tensDigitIdx] + mulResArray[onesDigitIdx]
  }

  private func updateMulResArray(_ mulResArray: [Int], _ curSum: Int, _ idx1: Int, _ idx2: Int)
    -> [Int]
  {
    var mulResArray = mulResArray
    let tensDigitIdx: Int = idx1 + idx2
    let onesDigitIdx: Int = idx1 + idx2 + 1

    mulResArray[tensDigitIdx] = curSum / 10
    mulResArray[onesDigitIdx] = curSum % 10

    return mulResArray
  }

  private func deletePrefixZero(_ numArray: [Int]) -> [Int] {
    var curIdx: Int = 0

    while numArray[curIdx] == 0 {
      curIdx += 1
    }

    return Array(numArray[curIdx...])
  }

  private func convertIntArrayToString(_ mulResArray: [Int]) -> String {
    var resStr: String = ""

    for num in mulResArray {
      resStr += convertIntToStr(num)
    }

    return resStr
  }

  private func convertIntToStr(_ num: Int) -> String {
    let intToStrMap: [Int: String] = [
      0: "0",
      1: "1",
      2: "2",
      3: "3",
      4: "4",
      5: "5",
      6: "6",
      7: "7",
      8: "8",
      9: "9",
    ]

    guard let convertedStr = intToStrMap[num] else { return "" }

    return convertedStr
  }
}
