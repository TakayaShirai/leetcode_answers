class Solution {
  func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
    var adjList = [Int: [Int]]()
    var visited = Set<Int>()

    func dfs(_ source: Int, _ target: Int) -> Bool {
      if source == target { return true }
      visited.insert(source)

      for neighbor in adjList[source, default: []] {
        if !visited.contains(neighbor) && dfs(neighbor, target) {
          return true
        }
      }

      return false
    }

    for edge in edges {
      let (u, v) = (edge[0], edge[1])

      visited = Set()

      if !adjList[u, default: []].isEmpty && !adjList[v, default: []].isEmpty {
        if dfs(u, v) {
          return edge
        }
      }

      adjList[u, default: []].append(v)
      adjList[v, default: []].append(u)
    }

    return []
  }
}
