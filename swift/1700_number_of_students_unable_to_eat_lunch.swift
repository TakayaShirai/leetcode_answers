class Solution {
  func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
    // Solution 1
    var restStudents: [Int] = Array(repeating: 0, count: students.max()! + 1)

    for student in students {
      restStudents[student] += 1
    }

    for sandwich in sandwiches {
      if restStudents[sandwich] > 0 {
        restStudents[sandwich] -= 1
      } else {
        return restStudents.reduce(0, +)
      }
    }

    return 0

    // Solution 2
    // var studentsStack: [Int] = students
    // var notServedCnt: Int = 0

    // var sandIdx: Int = 0

    // var canServeSandwich: Bool {
    //     !studentsStack.isEmpty && notServedCnt < studentsStack.count
    // }

    // while canServeSandwich {
    //     let curStudent: Int = studentsStack.removeFirst()
    //     let curSandwich: Int = sandwiches[sandIdx]

    //     if curStudent == curSandwich {
    //         sandIdx += 1
    //         notServedCnt = 0
    //     } else {
    //         studentsStack.append(curStudent)
    //         notServedCnt += 1
    //     }
    // }

    // return studentsStack.count
  }
}
