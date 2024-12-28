import Foundation

public struct User: Codable, Identifiable {
  public var id = UUID()

  public let name: String
  public let thumbnailURL: String
  
  enum CodingKeys: String, CodingKey {
    case name, thumbnailURL
  }

  public init(name: String, thumbnailURL: String) {
    self.name = name
    self.thumbnailURL = thumbnailURL
  }
}
