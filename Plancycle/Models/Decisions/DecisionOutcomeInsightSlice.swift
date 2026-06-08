import SwiftUI

struct DecisionOutcomeInsightSlice: Identifiable {
  var title: String
  var count: Int
  var symbolName: String
  var tint: Color

  var id: String { title }
}
