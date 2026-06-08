import SwiftUI

enum ProjectHealthLevel: String, CaseIterable, Identifiable {
  case healthy
  case watch
  case atRisk

  var id: String { rawValue }

  var title: String {
    switch self {
    case .healthy: "Healthy"
    case .watch: "Watch"
    case .atRisk: "At Risk"
    }
  }

  var symbolName: String {
    switch self {
    case .healthy: "heart.fill"
    case .watch: "exclamationmark.triangle.fill"
    case .atRisk: "flame.fill"
    }
  }

  var tint: Color {
    switch self {
    case .healthy: .green
    case .watch: .orange
    case .atRisk: .red
    }
  }
}
