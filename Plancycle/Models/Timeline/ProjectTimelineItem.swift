import Foundation

struct ProjectTimelineItem: Identifiable {
  var id: String
  var title: String
  var projectName: String
  var detail: String
  var date: Date
  var kind: ProjectTimelineKind
}
