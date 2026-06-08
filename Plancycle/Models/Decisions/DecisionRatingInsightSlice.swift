import SwiftUI

struct DecisionRatingInsightSlice: Identifiable {
  var rating: DecisionRating
  var count: Int

  var id: String { rating.rawValue }
  var title: String { rating.title }
  var tint: Color { rating.tint }
}
