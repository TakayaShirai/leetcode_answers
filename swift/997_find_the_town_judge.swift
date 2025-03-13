class Solution {
  func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
    var incomingEdgesCounter: [Int: Int] = [:]
    var outgoingEdgesCounter: [Int: Int] = [:]

    for item in trust {
      let trusting: Int = item[0]
      let trusted: Int = item[1]

      incomingEdgesCounter[trusted, default: 0] += 1
      outgoingEdgesCounter[trusting, default: 0] += 1
    }

    for person in 1...n {
      let incomingEdges = incomingEdgesCounter[person, default: 0]
      let outgoingEdges = outgoingEdgesCounter[person, default: 0]

      if incomingEdges == (n - 1) && outgoingEdges == 0 {
        return person
      }
    }

    return -1
  }
}
