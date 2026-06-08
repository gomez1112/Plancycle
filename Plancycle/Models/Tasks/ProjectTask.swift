import SwiftData
import Foundation

/// A task within a project. May optionally contain subtasks.
@Model
final class ProjectTask {
  var id: UUID = UUID()
  var title: String = ""
  var notes: String = ""
  var isComplete: Bool = false
  var dueDate: Date?
  var priorityRaw: Int = TaskPriority.none.rawValue
  var relationshipSignalRaw: String = RelationshipSignal.none.rawValue
  var relationshipNote: String = ""
  var sortIndex: Int = 0
  var completedAt: Date?

  @Relationship(deleteRule: .nullify)
  var assignee: Person?

  @Relationship(deleteRule: .nullify)
  var tags: [Tag]? = []

  @Relationship(deleteRule: .cascade, inverse: \ProjectSubtask.task)
  var subtasks: [ProjectSubtask]? = []

  @Relationship(deleteRule: .cascade, inverse: \Attachment.task)
  var attachments: [Attachment]? = []

  var project: Project?

  init(
    title: String = "",
    notes: String = "",
    isComplete: Bool = false,
    dueDate: Date? = nil,
    priority: TaskPriority = .none,
    sortIndex: Int = 0,
    assignee: Person? = nil
  ) {
    self.id = UUID()
    self.title = title
    self.notes = notes
    self.isComplete = isComplete
    self.dueDate = dueDate
    self.priorityRaw = priority.rawValue
    self.sortIndex = sortIndex
    self.assignee = assignee
    self.completedAt = isComplete ? .now : nil
  }

  var priority: TaskPriority {
    get { TaskPriority(rawValue: priorityRaw) ?? .none }
    set { priorityRaw = newValue.rawValue }
  }

  var relationshipSignal: RelationshipSignal {
    get { RelationshipSignal(rawValue: relationshipSignalRaw) ?? .none }
    set { relationshipSignalRaw = newValue.rawValue }
  }

  var sortedSubtasks: [ProjectSubtask] {
    (subtasks ?? []).sorted { $0.sortIndex < $1.sortIndex }
  }

  var hasSubtasks: Bool { !(subtasks ?? []).isEmpty }

  /// Whether this task counts as done. A task with subtasks is done when all of
  /// its subtasks are done; otherwise it follows its own completion flag.
  var isEffectivelyComplete: Bool {
    if hasSubtasks {
      return sortedSubtasks.allSatisfy(\.isComplete)
    }
    return isComplete
  }

  /// Fractional progress (0…1) for this task, including subtask completion.
  var fractionComplete: Double {
    let subs = subtasks ?? []
    if subs.isEmpty { return isComplete ? 1 : 0 }
    let done = subs.filter(\.isComplete).count
    return Double(done) / Double(subs.count)
  }

  func setComplete(_ complete: Bool) {
    isComplete = complete
    completedAt = complete ? .now : nil
    for subtask in subtasks ?? [] {
      subtask.setComplete(complete)
    }
  }

  /// Recomputes this task's own completion flag from its subtasks, if any.
  func syncCompletionFromSubtasks() {
    guard hasSubtasks else { return }
    let complete = sortedSubtasks.allSatisfy(\.isComplete)
    isComplete = complete
    completedAt = complete ? (completedAt ?? .now) : nil
  }
}
