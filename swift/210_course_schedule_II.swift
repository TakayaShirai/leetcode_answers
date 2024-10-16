class Solution {
  func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var preMap = Array(repeating: [Int](), count: numCourses)
    var res = [Int]()
    var visited = Set<Int>()
    var cycle = Set<Int>()

    for prereq in prerequisites {
      let course = prereq[0]
      let prerequisite = prereq[1]
      preMap[course].append(prerequisite)
    }

    func dfs(_ course: Int) -> Bool {
      if cycle.contains(course) {
        return false
      }

      if visited.contains(course) {
        return true
      }

      cycle.insert(course)

      for pre in preMap[course] {
        if !dfs(pre) {
          return false
        }
      }

      cycle.remove(course)
      visited.insert(course)
      res.append(course)
      return true
    }

    for course in 0..<numCourses {
      if !dfs(course) {
        return []
      }
    }

    return res
  }
}
