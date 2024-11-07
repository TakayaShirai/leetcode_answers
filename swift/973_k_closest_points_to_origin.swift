class Solution {
  func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    var pointsWithDist: [[Int]] = []
    var res: [[Int]] = []

    for point in points {
      let dist = (point[0] * point[0] + point[1] * point[1])
      pointsWithDist.append([dist, point[0], point[1]])
    }

    pointsWithDist.sort { $0[0] < $1[0] }

    for i in 0..<k {
      res.append([pointsWithDist[i][1], pointsWithDist[i][2]])
    }

    return res
  }
}
