class Solution {
  func numTrees(_ n: Int) -> Int {
    var bstCnts: [Int] = Array(repeating: 0, count: n + 1)
    bstCnts[0] = 1
    bstCnts[1] = 1

    for nodeCnt in 2..<(n + 1) {
      for topNodeVal in 1...nodeCnt {
        let leftSubtreeCnt: Int = bstCnts[topNodeVal - 1]
        let rightSubtreeCnt: Int = bstCnts[nodeCnt - topNodeVal]
        bstCnts[nodeCnt] += leftSubtreeCnt * rightSubtreeCnt
      }
    }

    return bstCnts[n]
  }
}
