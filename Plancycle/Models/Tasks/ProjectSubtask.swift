import SwiftData
import Foundation

/// A small unit of work nested inside a `ProjectTask`.
@Model
final class ProjectSubtask {
  var id: UUID = UUID()
  var title: String = ""
  var isComplete: Bool = false
  var sortIndex: Int = 0
  var completedAt: Date?

  @Relationship(deleteRule: .nullify)
  var assignee: Person?

  @Relationship(deleteRule: .cascade, inverse: \Attachment.subtask)
  var attachments: [Attachment]? = []

  var task: ProjectTask?

  init(
    title: String = "",
    isComplete: Bool = false,
    sortIndex: Int = 0,
    assignee: Person? = nil
  ) {
    self.id = UUID()
    self.title = title
    self.isComplete = isComplete
    self.sortIndex = sortIndex
    self.assignee = assignee
    self.completedAt = isComplete ? .now : nil
  }

  func setComplete(_ complete: Bool) {
    isComplete = complete
    completedAt = complete ? .now : nil
  }
}
