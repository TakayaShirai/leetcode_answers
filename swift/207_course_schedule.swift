class Solution {
  func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var preMap = Array(repeating: [Int](), count: numCourses)
    var visited = Set<Int>()

    for prereq in prerequisites {
      let course = prereq[0]
      let prerequisite = prereq[1]
      preMap[course].append(prerequisite)
    }

    func dfs(_ course: Int) -> Bool {
      if visited.contains(course) {
        return false
      }

      if preMap[course].isEmpty {
        return true
      }

      visited.insert(course)

      for pre in preMap[course] {
        if !dfs(pre) {
          return false
        }
      }

      visited.remove(course)
      preMap[course] = []
      return true
    }

    for course in 0..<numCourses {
      if !dfs(course) {
        return false
      }
    }

    return true
  }
}
