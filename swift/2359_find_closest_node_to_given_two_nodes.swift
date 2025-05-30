class Solution {
  func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
    guard node1 < edges.count && node2 < edges.count else { return -1 }

    var distancesFromNode1: [Int] = Array(repeating: edges.count, count: edges.count)
    var distancesFromNode2: [Int] = Array(repeating: edges.count, count: edges.count)

    calcDistance(from: node1, edges: edges, distances: &distancesFromNode1)
    calcDistance(from: node2, edges: edges, distances: &distancesFromNode2)

    var closestNode: Int = -1
    var closestDistance: Int = Int.max

    for node in 0..<edges.count {
      let distanceToNode1: Int = distancesFromNode1[node]
      let distanceToNode2: Int = distancesFromNode2[node]

      guard distanceToNode1 != edges.count && distanceToNode2 != edges.count else {
        continue
      }

      let maxDistance: Int = max(distanceToNode1, distanceToNode2)

      if maxDistance < closestDistance {
        closestDistance = maxDistance
        closestNode = node
      } else if maxDistance == closestDistance {
        closestNode = min(node, closestNode)
      }
    }

    return closestNode
  }

  private func calcDistance(from node: Int, edges: [Int], distances: inout [Int]) {
    var curDis: Int = 0
    var curNode: Int = node
    var visitedNodes = Set<Int>()

    while curNode != -1 && !visitedNodes.contains(curNode) {
      distances[curNode] = curDis
      visitedNodes.insert(curNode)
      curDis += 1
      curNode = edges[curNode]
    }
  }
}
