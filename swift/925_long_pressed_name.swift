class Solution {
  func isLongPressedName(_ name: String, _ typed: String) -> Bool {
    guard name.count <= typed.count else { return false }
    guard name != typed else { return true }

    let nameChars: [Character] = Array(name)
    let typedChars: [Character] = Array(typed)

    var nameIdx: Int = 0
    var typedIdx: Int = 0

    while typedIdx < typed.count {
      if nameIdx < name.count && nameChars[nameIdx] == typedChars[typedIdx] {
        nameIdx += 1
        typedIdx += 1
      } else if typedIdx > 0 && typedChars[typedIdx] == typedChars[typedIdx - 1] {
        typedIdx += 1
      } else {
        return false
      }
    }

    return nameIdx == name.count
  }
}
