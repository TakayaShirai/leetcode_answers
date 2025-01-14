class Solution {
  func licenseKeyFormatting(_ s: String, _ k: Int) -> String {
    var curGroup: [Character] = []
    var resKey: String = ""

    for char in s.reversed() {
      if char != "-" {
        curGroup.append(Character(char.uppercased()))

        if curGroup.count == k {
          if resKey != "" {
            resKey += ("-" + String(curGroup))
          } else {
            resKey += String(curGroup)
          }

          curGroup = []
        }
      }
    }

    if !curGroup.isEmpty {
      if resKey != "" {
        resKey += ("-" + String(curGroup))
      } else {
        resKey += String(curGroup)
      }
    }

    return String(resKey.reversed())

    // var curGroup: [Character] = []
    // var resKey: [String] = []

    // for char in s.reversed() {
    //     if char != "-" {
    //         curGroup.append(Character(char.uppercased()))

    //         if curGroup.count == k {
    //             resKey.append(String(curGroup.reversed()))
    //             curGroup = []
    //         }
    //     }
    // }

    // if !curGroup.isEmpty {
    //     resKey.append(String(curGroup.reversed()))
    // }

    // return resKey.reversed().joined(separator: "-")
  }
}
