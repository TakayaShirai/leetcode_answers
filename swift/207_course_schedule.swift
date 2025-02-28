class Solution {
  func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var prereqMap: [Int: [Int]] = createPrereqMap(of: prerequisites)
    var seenCourse: Set<Int> = []

    for course in 0..<numCourses {
      guard !hasCycle(from: course, prereqMap: &prereqMap, seenCourse: &seenCourse) else {
        return false
      }
    }

    return true
  }

  private func createPrereqMap(of prereqs: [[Int]]) -> [Int: [Int]] {
    var prereqMap: [Int: [Int]] = [:]

    for prereq in prereqs {
      let course: Int = prereq[0]
      let prereqCourse: Int = prereq[1]
      prereqMap[course, default: []].append(prereqCourse)
    }

    return prereqMap
  }

  private func hasCycle(from course: Int, prereqMap: inout [Int: [Int]], seenCourse: inout Set<Int>)
    -> Bool
  {
    guard !seenCourse.contains(course) else { return true }

    seenCourse.insert(course)
    for prereq in prereqMap[course, default: []] {
      guard !hasCycle(from: prereq, prereqMap: &prereqMap, seenCourse: &seenCourse) else {
        return true
      }
    }
    seenCourse.remove(course)
    prereqMap[course] = []

    return false
  }
}
