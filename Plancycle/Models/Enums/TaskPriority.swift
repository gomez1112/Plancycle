import SwiftUI

/// Optional task priority.
enum TaskPriority: Int, Codable, CaseIterable, Identifiable, Sendable {
  case none = 0
  case low = 1
  case medium = 2
  case high = 3

  var id: Int { rawValue }

  var title: String {
    switch self {
    case .none: "None"
    case .low: "Low"
    case .medium: "Medium"
    case .high: "High"
    }
  }

  var symbolName: String? {
    switch self {
    case .none: nil
    case .low: "arrow.down"
    case .medium: "equal"
    case .high: "exclamationmark"
    }
  }

  var tint: Color {
    switch self {
    case .none: .secondary
    case .low: .blue
    case .medium: .orange
    case .high: .red
    }
  }
}
