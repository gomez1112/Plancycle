import Foundation

struct ProjectHealthSnapshot: Identifiable {
  var id: UUID { project.id }
  var project: Project
  var score: Int
  var level: ProjectHealthLevel
  var overdueCount: Int
  var dueSoonCount: Int
  var openCount: Int
  var reasons: [String]
}
