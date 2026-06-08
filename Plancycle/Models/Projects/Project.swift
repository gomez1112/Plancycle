import SwiftData
import Foundation

/// A project: the central entity. It owns tasks, references a category, tags,
/// and people, and can be reused to produce a fresh copy at any time.
@Model
final class Project {
  var id: UUID = UUID()
  var name: String = ""
  var detail: String = ""
  var startDate: Date?
  var dueDate: Date?
  var statusRaw: String = ProjectStatus.notStarted.rawValue
  var kindRaw: String = ProjectKind.active.rawValue
  var createdAt: Date = Date.now
  var updatedAt: Date = Date.now

  /// Lineage so reused copies can be traced back to their origin.
  var sourceProjectID: UUID?
  /// How many times this project has been reused (shown as a badge).
  var reuseCount: Int = 0

  @Relationship(deleteRule: .nullify)
  var category: ProjectCategory?

  @Relationship(deleteRule: .nullify)
  var tags: [Tag]? = []

  @Relationship(deleteRule: .nullify)
  var people: [Person]? = []

  @Relationship(deleteRule: .cascade, inverse: \ProjectTask.project)
  var tasks: [ProjectTask]? = []

  @Relationship(deleteRule: .cascade, inverse: \Attachment.project)
  var attachments: [Attachment]? = []

  init(
    name: String = "",
    detail: String = "",
    startDate: Date? = nil,
    dueDate: Date? = nil,
    status: ProjectStatus = .notStarted,
    kind: ProjectKind = .active,
    category: ProjectCategory? = nil
  ) {
    self.id = UUID()
    self.name = name
    self.detail = detail
    self.startDate = startDate
    self.dueDate = dueDate
    self.statusRaw = status.rawValue
    self.kindRaw = kind.rawValue
    self.category = category
    self.createdAt = .now
    self.updatedAt = .now
  }

  var status: ProjectStatus {
    get { ProjectStatus(rawValue: statusRaw) ?? .notStarted }
    set { statusRaw = newValue.rawValue }
  }

  var kind: ProjectKind {
    get { ProjectKind(rawValue: kindRaw) ?? .active }
    set { kindRaw = newValue.rawValue }
  }

  var isTemplate: Bool { kind == .template }
  var isArchived: Bool { status == .archived }

  var sortedTasks: [ProjectTask] {
    (tasks ?? []).sorted { $0.sortIndex < $1.sortIndex }
  }

  // MARK: Progress

  var totalUnitCount: Int {
    (tasks ?? []).reduce(0) { partial, task in
      partial + max(1, (task.subtasks ?? []).count)
    }
  }

  var completedUnitCount: Int {
    (tasks ?? []).reduce(0) { partial, task in
      let subs = task.subtasks ?? []
      if subs.isEmpty {
        return partial + (task.isComplete ? 1 : 0)
      }
      return partial + subs.filter(\.isComplete).count
    }
  }

  /// Overall completion 0…1 across tasks and subtasks.
  var fractionComplete: Double {
    let total = totalUnitCount
    guard total > 0 else { return 0 }
    return Double(completedUnitCount) / Double(total)
  }

  var isFullyComplete: Bool {
    totalUnitCount > 0 && completedUnitCount == totalUnitCount
  }

  /// Recomputes `status` from progress, unless archived.
  func refreshStatus() {
    guard status != .archived else { return }
    if isFullyComplete {
      status = .completed
    } else if completedUnitCount > 0 {
      status = .inProgress
    } else {
      status = .notStarted
    }
    updatedAt = .now
  }

  func touch() { updatedAt = .now }
}
