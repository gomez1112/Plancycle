import SwiftUI

enum ProjectTimelineKind: String {
  case projectDue
  case taskDue
  case completed

  var title: String {
    switch self {
    case .projectDue: "Project Due"
    case .taskDue: "Task Due"
    case .completed: "Completed"
    }
  }

  var symbolName: String {
    switch self {
    case .projectDue: "calendar.badge.clock"
    case .taskDue: "checklist"
    case .completed: "checkmark.circle.fill"
    }
  }

  var tint: Color {
    switch self {
    case .projectDue: .accentColor
    case .taskDue: .orange
    case .completed: .green
    }
  }
}
