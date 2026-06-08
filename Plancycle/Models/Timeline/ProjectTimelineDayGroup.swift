import Foundation

struct ProjectTimelineDayGroup: Identifiable {
  var id: Date { day }
  var day: Date
  var items: [ProjectTimelineItem]
}
