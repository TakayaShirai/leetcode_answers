import HeapModule

struct Point: Comparable {
  var pos: [Int]
  var disFromOrigin: Double {
    sqrt(Double(pos[0]) * Double(pos[0]) + Double(pos[1]) * Double(pos[1]))
  }

  static func < (lhs: Point, rhs: Point) -> Bool {
    return lhs.disFromOrigin < rhs.disFromOrigin
  }

  static func == (lhs: Point, rhs: Point) -> Bool {
    return lhs.disFromOrigin == rhs.disFromOrigin
  }
}

class Solution {
  func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    var kClosestPoints: Heap<Point> = []

    for point in points {
      let pointObj = Point(pos: point)
      kClosestPoints.insert(pointObj)
      if kClosestPoints.count > k {
        kClosestPoints.popMax()
      }
    }

    var resPoints: [[Int]] = []
    while !kClosestPoints.isEmpty {
      if let point = kClosestPoints.popMax() {
        resPoints.append(point.pos)
      }
    }

    return resPoints
  }
}
