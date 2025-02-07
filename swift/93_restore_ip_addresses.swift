class Solution {
  func restoreIpAddresses(_ s: String) -> [String] {
    let inputChars = Array(s)
    var validIPs: [String] = []
    var currentSegments: [String] = []
    backtrack(inputChars, start: 0, curSegments: &currentSegments, validIPs: &validIPs)
    return validIPs
  }

  private func backtrack(
    _ inputChars: [Character], start: Int, curSegments: inout [String], validIPs: inout [String]
  ) {
    if curSegments.count == 4 {
      if start == inputChars.count {
        validIPs.append(curSegments.joined(separator: "."))
      }
      return
    }

    for length in 1...3 {
      let end = start + length
      guard end <= inputChars.count else { break }

      let segment = String(inputChars[start..<end])
      if isValidSegment(segment) {
        curSegments.append(segment)
        backtrack(inputChars, start: end, curSegments: &curSegments, validIPs: &validIPs)
        curSegments.removeLast()
      }
    }
  }

  private func isValidSegment(_ segment: String) -> Bool {
    if segment.isEmpty || (segment.count > 1 && segment.first == "0") {
      return false
    }

    guard let num = Int(segment) else { return false }
    return num >= 0 && num <= 255
  }
}
