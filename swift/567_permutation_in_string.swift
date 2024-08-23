class Solution {
  func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    if s1.count > s2.count {
      return false
    }

    var arrayS1 = Array(s1)
    var arrayS2 = Array(s2)

    var seenS1: [Character: Int] = [:]
    var seenS2: [Character: Int] = [:]

    for char in arrayS1 {
      seenS1[char, default: 0] += 1
    }

    var left: Int = 0
    var right: Int = -1

    while (right - left + 1) < arrayS1.count {
      right += 1
      if let seen = seenS1[arrayS2[right]] {
        seenS2[arrayS2[right], default: 0] += 1
      }
    }

    while right < arrayS2.count {
      if seenS1 == seenS2 {
        return true
      }

      if let seen = seenS2[arrayS2[left]] {
        seenS2[arrayS2[left]]! -= 1
      }

      left += 1
      right += 1

      if right >= arrayS2.count {
        return false
      }

      if let seen = seenS1[arrayS2[right]] {
        seenS2[arrayS2[right], default: 0] += 1
      }
    }

    return false
  }
}

// TLE in Swift
// class Solution {
//     func checkInclusion(_ s1: String, _ s2: String) -> Bool {
//         if s1.count > s2.count {
//             return false
//         }

//         var arrayS1 = Array(s1)
//         var arrayS2 = Array(s2)

//         var seenS1 = Array(repeating: 0, count: 26)
//         var seenS2 = Array(repeating: 0, count: 26)

//         let aAsciiValue = Int(Character("a").asciiValue!)

//         for i in 0..<arrayS1.count {
//             seenS1[Int(arrayS1[i].asciiValue!) - aAsciiValue] += 1
//             seenS2[Int(arrayS2[i].asciiValue!) - aAsciiValue] += 1
//         }

//         var matches = 0

//         for i in 0..<26 {
//             if seenS1[i] == seenS2[i] {
//                 matches += 1
//             }
//         }

//         var left = 0
//         var right = s1.count - 1

//         while right < s2.count {
//             if matches == 26 {
//                 return true
//             }

//             let leftIndex = Int(arrayS2[left].asciiValue!) - aAsciiValue
//             seenS2[leftIndex] -= 1
//             if seenS1[leftIndex] == seenS2[leftIndex] {
//                 matches += 1
//             } else if seenS1[leftIndex] - 1 == seenS2[leftIndex] {
//                 matches -= 1
//             }

//             left += 1
//             right += 1

//             if right >= s2.count {
//                 return false
//             }

//             let rightIndex = Int(arrayS2[right].asciiValue!) - aAsciiValue
//             seenS2[rightIndex] += 1
//             if seenS1[rightIndex] == seenS2[rightIndex] {
//                 matches += 1
//             } else if seenS1[rightIndex] + 1 == seenS2[rightIndex] {
//                 matches -= 1
//             }
//         }

//         return false
//     }
// }
