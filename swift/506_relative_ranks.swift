class Solution {
  func findRelativeRanks(_ score: [Int]) -> [String] {
    // Bucket Sorting
    let maxScore: Int = score.max()!
    var relativeRanks: [String] = Array(repeating: "", count: score.count)
    var scoreToIndexMap: [Int] = Array(repeating: -1, count: maxScore + 1)

    for (idx, curScore) in score.enumerated() {
      scoreToIndexMap[curScore] = idx
    }

    var rank: Int = 1

    for scoreIndex in scoreToIndexMap.reversed() {
      guard scoreIndex != -1 else { continue }
      guard rank <= score.count else { break }

      if rank == 1 {
        relativeRanks[scoreIndex] = "Gold Medal"
      } else if rank == 2 {
        relativeRanks[scoreIndex] = "Silver Medal"
      } else if rank == 3 {
        relativeRanks[scoreIndex] = "Bronze Medal"
      } else {
        relativeRanks[scoreIndex] = String(rank)
      }

      rank += 1
    }

    return relativeRanks

    // Normal Sorting
    // var scoreWithIdx: [(score: Int, idx: Int)] = []

    // for (idx, curScore) in score.enumerated() {
    //     scoreWithIdx.append((curScore, idx))
    // }

    // var ranksArray: [String] = Array(repeating: "", count: score.count)
    // var sortedScoreWithIdx: [(score: Int, idx: Int)] = scoreWithIdx.sorted { $0.score > $1.score }

    // for (idx, scoreWithIdx) in sortedScoreWithIdx.enumerated() {
    //     if idx == 0 {
    //         ranksArray[scoreWithIdx.idx] = "Gold Medal"
    //     } else if idx == 1 {
    //         ranksArray[scoreWithIdx.idx] = "Silver Medal"
    //     } else if idx == 2 {
    //         ranksArray[scoreWithIdx.idx] = "Bronze Medal"
    //     } else {
    //         ranksArray[scoreWithIdx.idx] = String(idx + 1)
    //     }
    // }

    // return ranksArray
  }
}
