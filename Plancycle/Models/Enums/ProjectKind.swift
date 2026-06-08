/// Distinguishes an active, working project from a saved template.
enum ProjectKind: String, Codable, CaseIterable, Sendable {
  case active
  case template
}
