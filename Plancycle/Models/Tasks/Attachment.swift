import Foundation
import SwiftData
import UniformTypeIdentifiers

@Model
final class Attachment {
  var id: UUID = UUID()
  var originalFileName: String = ""
  var contentTypeIdentifier: String = UTType.data.identifier
  @Attribute(.externalStorage) var data: Data?
  var createdAt: Date = Date.now

  var project: Project?
  var task: ProjectTask?
  var subtask: ProjectSubtask?

  init(
    originalFileName: String = "",
    contentTypeIdentifier: String = UTType.data.identifier,
    data: Data? = nil
  ) {
    self.id = UUID()
    self.originalFileName = originalFileName
    self.contentTypeIdentifier = contentTypeIdentifier
    self.data = data
    self.createdAt = .now
  }

  var displayName: String {
    originalFileName.isEmpty ? "Attachment" : originalFileName
  }
}
