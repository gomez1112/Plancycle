import SwiftUI

enum DecisionRating: String, CaseIterable, Identifiable {
  case unrated
  case excellent
  case good
  case mixed
  case missed

  var id: String { rawValue }

  var title: String {
    switch self {
    case .unrated: "Unrated"
    case .excellent: "Excellent"
    case .good: "Good"
    case .mixed: "Mixed"
    case .missed: "Missed"
    }
  }

  var symbolName: String {
    switch self {
    case .unrated: "clock.badge.questionmark"
    case .excellent: "sparkles"
    case .good: "checkmark.seal.fill"
    case .mixed: "arrow.left.arrow.right"
    case .missed: "exclamationmark.triangle.fill"
    }
  }

  var colors: [Color] {
    switch self {
    case .unrated: [.gray.opacity(0.22), .secondary.opacity(0.08)]
    case .excellent: [.green.opacity(0.35), .mint.opacity(0.14)]
    case .good: [.blue.opacity(0.30), .cyan.opacity(0.12)]
    case .mixed: [.orange.opacity(0.34), .yellow.opacity(0.14)]
    case .missed: [.red.opacity(0.30), .pink.opacity(0.12)]
    }
  }

  var tint: Color {
    switch self {
    case .unrated: .secondary
    case .excellent: .green
    case .good: .blue
    case .mixed: .orange
    case .missed: .red
    }
  }
}
