import SwiftUI

enum DecisionImpact: String, CaseIterable, Identifiable {
  case low
  case medium
  case high

  var id: String { rawValue }

  var title: String {
    switch self {
    case .low: "Low"
    case .medium: "Medium"
    case .high: "High"
    }
  }

  var tint: Color {
    switch self {
    case .low: .secondary
    case .medium: .orange
    case .high: .red
    }
  }
}
