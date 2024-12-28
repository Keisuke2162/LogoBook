import Foundation

public struct Post: Codable, Identifiable {
  public var id = UUID()

  public let userID: String
  public let title: String
  public let imageURL: URL
  public let createdAt: Date
  
  enum CodingKeys: String, CodingKey {
    case userID, title, imageURL, createdAt
  }

  public init(id: UUID = UUID(), userID: String, title: String, imageURL: URL, createdAt: Date) {
    self.id = id
    self.userID = userID
    self.title = title
    self.imageURL = imageURL
    self.createdAt = createdAt
  }
}
