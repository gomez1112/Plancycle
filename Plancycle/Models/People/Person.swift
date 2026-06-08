import SwiftData
import SwiftUI

/// A person a task or subtask can be assigned to.
///
/// People are shared reference entities: reusing or duplicating a project keeps
/// pointing at the same `Person`, it does not clone them.
@Model
final class Person {
  var id: UUID = UUID()
  var name: String = ""
  var customInitials: String = ""
  var colorHex: String = Palette.randomHex()
  @Attribute(.externalStorage) var avatarImageData: Data?
  var createdAt: Date = Date.now

  init(
    name: String = "",
    customInitials: String = "",
    colorHex: String = Palette.randomHex()
  ) {
    self.id = UUID()
    self.name = name
    self.customInitials = customInitials
    self.colorHex = colorHex
    self.createdAt = .now
  }

  var color: Color { Palette.color(forHex: colorHex) }

  /// User-provided initials, falling back to initials derived from the name.
  var initials: String {
    let trimmed = customInitials.trimmingCharacters(in: .whitespaces)
    if !trimmed.isEmpty { return String(trimmed.prefix(2)).uppercased() }
    let parts = name.split(separator: " ").prefix(2)
    let derived = parts.compactMap(\.first)
    if derived.isEmpty { return "?" }
    return String(derived).uppercased()
  }
}
