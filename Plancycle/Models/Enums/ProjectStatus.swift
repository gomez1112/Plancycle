import SwiftUI

/// Lifecycle status of a project.
enum ProjectStatus: String, Codable, CaseIterable, Identifiable, Sendable {
  case notStarted
  case inProgress
  case completed
  case archived

  var id: String { rawValue }

  var title: String {
    switch self {
    case .notStarted: "Not Started"
    case .inProgress: "In Progress"
    case .completed: "Completed"
    case .archived: "Archived"
    }
  }

  var symbolName: String {
    switch self {
    case .notStarted: "circle"
    case .inProgress: "circle.bottomhalf.filled"
    case .completed: "checkmark.circle.fill"
    case .archived: "archivebox.fill"
    }
  }

  var tint: Color {
    switch self {
    case .notStarted: .secondary
    case .inProgress: .blue
    case .completed: .green
    case .archived: .gray
    }
  }
}
