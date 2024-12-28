import Foundation

public struct User: Codable {
  public let userID: String
  public let name: String
  public let thumbnailURL: String
  
  enum CodingKeys: String, CodingKey {
    case userID, name, thumbnailURL
  }

  public init(userID: String = "", name: String, thumbnailURL: String) {
    self.userID = userID
    self.name = name
    self.thumbnailURL = thumbnailURL
  }
}
