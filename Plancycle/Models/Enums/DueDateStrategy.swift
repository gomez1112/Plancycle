/// How due dates are handled when reusing a project.
enum DueDateStrategy: String, CaseIterable, Identifiable, Sendable {
  case keep
  case clear
  case shift

  var id: String { rawValue }

  var title: String {
    switch self {
    case .keep: "Keep Dates"
    case .clear: "Clear Dates"
    case .shift: "Shift Dates"
    }
  }

  var detail: String {
    switch self {
    case .keep: "Copy the original due dates exactly."
    case .clear: "Remove every due date for a fresh start."
    case .shift: "Move every date relative to a new start date."
    }
  }

  var symbolName: String {
    switch self {
    case .keep: "calendar"
    case .clear: "calendar.badge.minus"
    case .shift: "calendar.badge.clock"
    }
  }
}
