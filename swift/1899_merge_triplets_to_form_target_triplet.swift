class Solution {
  func mergeTriplets(_ triplets: [[Int]], _ target: [Int]) -> Bool {
    var isFirstDigValid: Bool = false
    var isSecondDigValid: Bool = false
    var isThirdDigValid: Bool = false

    for triplet in triplets {
      let firstDig = triplet[0]
      let secondDig = triplet[1]
      let thirdDig = triplet[2]

      if firstDig == target[0] && secondDig <= target[1] && thirdDig <= target[2] {
        isFirstDigValid = true
      }

      if secondDig == target[1] && firstDig <= target[0] && thirdDig <= target[2] {
        isSecondDigValid = true
      }

      if thirdDig == target[2] && firstDig <= target[0] && secondDig <= target[1] {
        isThirdDigValid = true
      }

      if isFirstDigValid == true && isSecondDigValid == true && isThirdDigValid == true {
        return true
      }
    }

    return false
  }
}
