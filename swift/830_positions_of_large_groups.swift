class Solution {
  func largeGroupPositions(_ s: String) -> [[Int]] {
    var largeGroups: [[Int]] = []
    let largeGroupThreshold: Int = 3

    var groupStartIdx: Int = 0
    var prevChar: Character? = nil
    var curGroupCnt: Int = 1

    for (curIdx, curChar) in s.enumerated() {
      if curIdx == 0 {
        prevChar = curChar
        continue
      }

      if prevChar! == curChar {
        curGroupCnt += 1
      } else {
        if curGroupCnt >= largeGroupThreshold {
          largeGroups.append([groupStartIdx, curIdx - 1])
        }

        groupStartIdx = curIdx
        curGroupCnt = 1
      }

      prevChar = curChar
    }

    if curGroupCnt >= largeGroupThreshold {
      largeGroups.append([groupStartIdx, s.count - 1])
    }

    return largeGroups
  }
}
