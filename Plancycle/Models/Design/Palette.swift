import SwiftUI

/// A small fixed palette used for categories, people, and tags so colors are
/// persisted as stable hex strings (CloudKit-friendly) and rendered consistently.
enum Palette {
  static let hexes: [String] = [
    "8E4CDB", // indigo/purple (accent family)
    "E0398A", // pink
    "E84F4F", // red
    "F08A24", // orange
    "F2B807", // amber
    "39B54A", // green
    "16B8A6", // teal
    "2E8BE6", // blue
    "7A8794"  // slate
  ]

  static func color(forHex hex: String) -> Color {
    Color(hex: hex) ?? .accentColor
  }

  static func randomHex() -> String {
    hexes.randomElement() ?? "8E4CDB"
  }

  static func name(forHex hex: String) -> String {
    switch hex {
    case "8E4CDB": "Purple"
    case "E0398A": "Pink"
    case "E84F4F": "Red"
    case "F08A24": "Orange"
    case "F2B807": "Amber"
    case "39B54A": "Green"
    case "16B8A6": "Teal"
    case "2E8BE6": "Blue"
    case "7A8794": "Slate"
    default: "Custom color"
    }
  }
}

extension Color {
  /// Creates a color from a 6-character RGB hex string (no leading `#`).
  init?(hex: String) {
    var cleaned = hex
    if cleaned.hasPrefix("#") { cleaned.removeFirst() }
    guard cleaned.count == 6, let value = Int(cleaned, radix: 16) else { return nil }
    let red = Double((value >> 16) & 0xFF) / 255
    let green = Double((value >> 8) & 0xFF) / 255
    let blue = Double(value & 0xFF) / 255
    self = Color(.sRGB, red: red, green: green, blue: blue, opacity: 1)
  }
}
