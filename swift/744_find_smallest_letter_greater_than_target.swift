class Solution {
  func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
    guard letters[letters.count - 1] > target else { return letters[0] }

    var left: Int = 0
    var right: Int = letters.count - 1

    while left < right {
      let mid: Int = left + (right - left) / 2

      if letters[mid] <= target {
        left += 1
      } else {
        right = mid
      }
    }

    return letters[left]
  }
}
