import Foundation
import SwiftData

@Model
final class ProjectDebrief {
  var id: UUID = UUID()
  var promptAnswers: String = ""
  var summary: String = ""
  var createdAt: Date = Date.now
  var usedAppleIntelligence: Bool = false

  var project: Project?

  init(
    promptAnswers: String = "",
    summary: String = "",
    createdAt: Date = .now,
    usedAppleIntelligence: Bool = false
  ) {
    self.id = UUID()
    self.promptAnswers = promptAnswers
    self.summary = summary
    self.createdAt = createdAt
    self.usedAppleIntelligence = usedAppleIntelligence
  }
}
