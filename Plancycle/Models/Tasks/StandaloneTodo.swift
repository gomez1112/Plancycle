import Foundation
import SwiftData

@Model
final class StandaloneTodo {
  var id: UUID = UUID()
  var title: String = ""
  var notes: String = ""
  var isComplete: Bool = false
  var dueDate: Date?
  var priorityRaw: Int = TaskPriority.none.rawValue
  var createdAt: Date = Date.now
  var updatedAt: Date = Date.now
  var completedAt: Date?

  @Relationship(deleteRule: .nullify)
  var category: ProjectCategory?

  @Relationship(deleteRule: .nullify)
  var tags: [Tag]? = []

  init(
    title: String = "",
    notes: String = "",
    dueDate: Date? = nil,
    priority: TaskPriority = .none
  ) {
    self.id = UUID()
    self.title = title
    self.notes = notes
    self.dueDate = dueDate
    self.priorityRaw = priority.rawValue
    self.createdAt = .now
    self.updatedAt = .now
  }

  var priority: TaskPriority {
    get { TaskPriority(rawValue: priorityRaw) ?? .none }
    set { priorityRaw = newValue.rawValue }
  }

  var sortedTags: [Tag] {
    (tags ?? []).sorted { $0.name.localizedStandardCompare($1.name) == .orderedAscending }
  }

  func setComplete(_ complete: Bool) {
    isComplete = complete
    completedAt = complete ? .now : nil
    updatedAt = .now
  }

  func touch() {
    updatedAt = .now
  }
}
