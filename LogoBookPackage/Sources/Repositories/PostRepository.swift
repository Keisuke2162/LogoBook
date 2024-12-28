import Entities
import Extensions
import FirebaseStorage
import FirebaseFirestore
import Foundation

protocol PostRepositoryProtocol: AnyObject {
  func postImage(image: UIImage) async throws -> URL
  func post(user: User, title: String, imageURL: URL) async throws
}

public class PostRepository: PostRepositoryProtocol {
  func postImage(image: UIImage) async throws -> URL {
    let storageRef = Storage.storage().reference().child("post_images/\(UUID().uuidString).jpg")
    
    guard let imageData = image.jpegData(compressionQuality: 0.75) else {
      throw URLError.jpegDataError
    }

    let data = try await storageRef.putDataAsync(imageData)
    let imageURL = try await storageRef.downloadURL()
    return imageURL
  }
  
  func post(user: User, title: String, imageURL: URL) async throws {
    let postData: [String: Any] = [
      "userID": user.userID,
      "title": title,
      "imageURL": imageURL.absoluteString,
      "createdAt": Date()
    ]
    // FireStoreのpostsコレクション内にUIDでドキュメントを作る
    let db = Firestore.firestore()
    try await db.collection("posts").document(UUID().uuidString).setData(postData)
  }
}

enum URLError: Error {
    case jpegDataError
}
