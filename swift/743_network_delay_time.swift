import HeapModule

struct Path: Comparable {
  let node: Int
  let time: Int

  init(_ node: Int, _ time: Int) {
    self.node = node
    self.time = time
  }

  static func == (lhs: Path, rhs: Path) -> Bool {
    return lhs.node == rhs.node && lhs.time == rhs.time
  }

  static func < (lhs: Path, rhs: Path) -> Bool {
    return lhs.time < rhs.time
  }
}

class Solution {
  func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
    let adjList: [[Path]] = createAdjList(times, n)
    var timeTable: [Int] = createInitialTimeTable(n, k)
    var visitedNodes: Set<Int> = []

    var paths: Heap<Path> = [Path(k, 0)]

    while !paths.isEmpty {
      let path = paths.popMin()!
      let curNode = path.node
      let curCost = path.time

      if visitedNodes.contains(curNode) {
        continue
      }

      visitedNodes.insert(curNode)

      for adjacent in adjList[curNode] {
        let adjNode = adjacent.node
        let adjTime = adjacent.time

        if curCost + adjTime < timeTable[adjNode] {
          timeTable[adjNode] = curCost + adjTime
          paths.insert(Path(adjNode, timeTable[adjNode]))
        }
      }
    }

    let maxTime = timeTable.max()!
    return visitedNodes.count == n ? maxTime : -1
  }

  private func createAdjList(_ times: [[Int]], _ n: Int) -> [[Path]] {
    var adjList = Array(repeating: [Path](), count: n + 1)

    for time in times {
      let sourceNode = time[0]
      let targetNode = time[1]
      let cost = time[2]

      adjList[sourceNode].append(Path(targetNode, cost))
    }

    return adjList
  }

  private func createInitialTimeTable(_ n: Int, _ k: Int) -> [Int] {
    var times: [Int] = Array(repeating: Int.max, count: n + 1)
    times[0] = 0
    times[k] = 0
    return times
  }
}
