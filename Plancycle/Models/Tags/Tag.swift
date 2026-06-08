import SwiftData
import SwiftUI

/// A user-defined label that can be attached to projects and tasks.
@Model
final class Tag {
  var id: UUID = UUID()
  var name: String = ""
  var colorHex: String = Palette.randomHex()
  var createdAt: Date = Date.now

  init(name: String = "", colorHex: String = Palette.randomHex()) {
    self.id = UUID()
    self.name = name
    self.colorHex = colorHex
    self.createdAt = .now
  }

  var color: Color { Palette.color(forHex: colorHex) }
}
