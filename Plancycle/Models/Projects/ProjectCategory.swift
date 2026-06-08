import SwiftData
import SwiftUI

/// A user-defined grouping for projects and todos (Work, Family, Travel, …).
/// Each category carries its own color, symbol, and a default priority that new
/// items inherit.
@Model
final class ProjectCategory {
  var id: UUID = UUID()
  var name: String = ""
  var symbolName: String = "folder.fill"
  var colorHex: String = Palette.randomHex()
  var defaultPriorityRaw: Int = TaskPriority.none.rawValue
  var createdAt: Date = Date.now

  @Relationship(inverse: \Project.category)
  var projects: [Project]? = []

  @Relationship(inverse: \StandaloneTodo.category)
  var todos: [StandaloneTodo]? = []

  init(
    name: String = "",
    symbolName: String = "folder.fill",
    colorHex: String = Palette.randomHex(),
    defaultPriority: TaskPriority = .none
  ) {
    self.id = UUID()
    self.name = name
    self.symbolName = symbolName
    self.colorHex = colorHex
    self.defaultPriorityRaw = defaultPriority.rawValue
    self.createdAt = .now
  }

  var color: Color { Palette.color(forHex: colorHex) }

  var defaultPriority: TaskPriority {
    get { TaskPriority(rawValue: defaultPriorityRaw) ?? .none }
    set { defaultPriorityRaw = newValue.rawValue }
  }
}
