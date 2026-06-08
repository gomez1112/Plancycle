import SwiftUI

enum RelationshipSignal: String, CaseIterable, Identifiable {
  case none
  case waitingOn
  case needsReply
  case needsReview
  case needsApproval

  var id: String { rawValue }

  var title: String {
    switch self {
    case .none: "No follow-up"
    case .waitingOn: "Waiting on"
    case .needsReply: "Needs reply"
    case .needsReview: "Needs review"
    case .needsApproval: "Needs approval"
    }
  }

  var symbolName: String {
    switch self {
    case .none: "checkmark"
    case .waitingOn: "hourglass"
    case .needsReply: "arrowshape.turn.up.left"
    case .needsReview: "doc.text.magnifyingglass"
    case .needsApproval: "checkmark.seal"
    }
  }

  var tint: Color {
    switch self {
    case .none: .secondary
    case .waitingOn: .orange
    case .needsReply: .blue
    case .needsReview: .purple
    case .needsApproval: .green
    }
  }
}
