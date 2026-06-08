import Foundation
import SwiftData

@Model
final class ProjectDecisionEntry {
  var id: UUID = UUID()
  var title: String = ""
  var rationale: String = ""
  var expectedOutcome: String = ""
  var outcome: String = ""
  var impactRaw: String = DecisionImpact.medium.rawValue
  var ratingRaw: String = DecisionRating.unrated.rawValue
  var createdAt: Date = Date.now

  var project: Project?

  init(
    title: String = "",
    rationale: String = "",
    expectedOutcome: String = "",
    outcome: String = "",
    impact: DecisionImpact = .medium,
    rating: DecisionRating = .unrated,
    createdAt: Date = .now
  ) {
    self.id = UUID()
    self.title = title
    self.rationale = rationale
    self.expectedOutcome = expectedOutcome
    self.outcome = outcome
    self.impactRaw = impact.rawValue
    self.ratingRaw = rating.rawValue
    self.createdAt = createdAt
  }

  var impact: DecisionImpact {
    get { DecisionImpact(rawValue: impactRaw) ?? .medium }
    set { impactRaw = newValue.rawValue }
  }

  var rating: DecisionRating {
    get { DecisionRating(rawValue: ratingRaw) ?? .unrated }
    set { ratingRaw = newValue.rawValue }
  }
}
