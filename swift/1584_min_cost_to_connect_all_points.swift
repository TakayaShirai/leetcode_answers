import HeapModule

struct Path: Comparable {
  let cost: Int
  let node: Int

  init(_ cost: Int, _ node: Int) {
    self.cost = cost
    self.node = node
  }

  static func < (lhs: Path, rhs: Path) -> Bool {
    return lhs.cost < rhs.cost
  }

  static func == (lhs: Path, rhs: Path) -> Bool {
    return lhs.cost == rhs.cost && lhs.node == rhs.node
  }
}

class Solution {
  func minCostConnectPoints(_ points: [[Int]]) -> Int {
    let adjList: [[Path]] = createAdjList(points)
    var minCost: Int = 0
    var minHeap: Heap<Path> = [Path(0, 0)]
    var visitedNodes: Set<Int> = []

    var existNonVisitedNodes: Bool {
      visitedNodes.count < points.count
    }

    while existNonVisitedNodes {
      guard let path = minHeap.popMin() else { break }
      let cost: Int = path.cost
      let node: Int = path.node

      if visitedNodes.contains(node) {
        continue
      }

      minCost += cost
      visitedNodes.insert(node)

      for adjacent in adjList[node] {
        if !visitedNodes.contains(adjacent.node) {
          minHeap.insert(Path(adjacent.cost, adjacent.node))
        }
      }
    }

    return minCost
  }

  private func createAdjList(_ points: [[Int]]) -> [[Path]] {
    let pointsLen: Int = points.count
    var adjList = Array(repeating: [Path](), count: pointsLen)

    for i in 0..<pointsLen {
      let x1 = points[i][0]
      let y1 = points[i][1]

      for j in (i + 1)..<pointsLen {
        let x2 = points[j][0]
        let y2 = points[j][1]

        let manhDist: Int = abs(x1 - x2) + abs(y1 - y2)
        adjList[i].append(Path(manhDist, j))
        adjList[j].append(Path(manhDist, i))
      }
    }

    return adjList
  }
}
