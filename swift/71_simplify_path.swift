class Solution {
  func simplifyPath(_ path: String) -> String {
    // With Stack
    var stack: [String] = []
    var curFileName: String = ""

    for char in (path + "/") {
      if char == "/" {
        if curFileName == ".." {
          if !stack.isEmpty {
            stack.removeLast()
          }
        } else if curFileName != "." && curFileName != "" {
          stack.append(curFileName)
        }
        curFileName = ""
      } else {
        curFileName += String(char)
      }
    }

    return "/" + stack.joined(separator: "/")

    // Without Stack
    // let arrayPath: [Character] = Array(path)
    // var simplifiedPath: [Character] = []
    // var curIdx: Int = 0

    // while curIdx < arrayPath.count {
    //     let char: Character = arrayPath[curIdx]

    //     switch char {
    //         case ".":
    //             if isSingleColon(arrayPath, curIdx) {
    //                 print("hello")
    //                 curIdx += 1
    //                 curIdx = skipExtraSlashes(arrayPath, curIdx)
    //                 break
    //             } else if isDoubleColon(arrayPath, curIdx) {
    //                 simplifiedPath = returnBackToPreviousDirectory(simplifiedPath, curIdx)
    //                 curIdx += 2
    //                 curIdx = skipExtraSlashes(arrayPath, curIdx)
    //                 break
    //             } else {
    //                 while curIdx < path.count && arrayPath[curIdx] == "." {
    //                     simplifiedPath.append(arrayPath[curIdx])
    //                     curIdx += 1
    //                 }
    //                 break
    //             }
    //         case "/":
    //             simplifiedPath.append(char)
    //             curIdx = skipExtraSlashes(arrayPath, curIdx)
    //             break
    //         default:
    //             simplifiedPath.append(char)
    //             curIdx += 1
    //             break
    //     }
    // }

    // simplifiedPath = trimLastSlashes(simplifiedPath)

    // return String(simplifiedPath)
  }

  private func skipExtraSlashes(_ arrayPath: [Character], _ idx: Int) -> Int {
    var curIdx: Int = idx

    while curIdx < arrayPath.count && arrayPath[curIdx] == "/" {
      curIdx += 1
    }

    return curIdx
  }

  private func isSingleColon(_ arrayPath: [Character], _ idx: Int) -> Bool {
    let previousChar: Character? = idx - 1 >= 0 ? arrayPath[idx - 1] : nil
    let nextChar: Character? = idx + 1 < arrayPath.count ? arrayPath[idx + 1] : nil
    return previousChar == "/" && (nextChar == "/" || nextChar == nil)
  }

  private func isDoubleColon(_ arrayPath: [Character], _ idx: Int) -> Bool {
    let previousChar: Character? = idx - 1 >= 0 ? arrayPath[idx - 1] : nil
    let nextChar: Character? = idx + 1 < arrayPath.count ? arrayPath[idx + 1] : nil
    let secondNextChar: Character? = idx + 2 < arrayPath.count ? arrayPath[idx + 2] : nil
    return previousChar == "/"
      && ((nextChar == "." && secondNextChar == "/") || (nextChar == "." && secondNextChar == nil))
  }

  private func returnBackToPreviousDirectory(_ arrayPath: [Character], _ curIdx: Int) -> [Character]
  {
    var slashCnt: Int = 0
    var curIdx: Int = arrayPath.count - 1

    while curIdx >= 0 && slashCnt < 2 {
      if arrayPath[curIdx] == "/" {
        slashCnt += 1
      }

      curIdx -= 1
    }

    return Array(arrayPath[0...(curIdx + 1)])
  }

  private func trimLastSlashes(_ arrayPath: [Character]) -> [Character] {
    var curIdx: Int = arrayPath.count - 1
    var curPath: [Character] = arrayPath

    while curIdx > 0 && arrayPath[curIdx] == "/" {
      curIdx -= 1
    }

    return Array(arrayPath[0...curIdx])
  }
}
