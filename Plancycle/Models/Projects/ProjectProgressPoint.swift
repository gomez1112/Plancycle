import Foundation

struct ProjectProgressPoint: Identifiable {
  var id: String { name }
  var name: String
  var progress: Double
}
