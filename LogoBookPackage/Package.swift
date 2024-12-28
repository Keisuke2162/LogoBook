// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LogoBookPackage",
    platforms: [.iOS(.v17)],
    products: [
      .library(name: "Features", targets: ["Features"]),
    ],
    dependencies: [
      .package(url: "https://github.com/firebase/firebase-ios-sdk", exact: "11.6.0"),
      .package(url: "https://github.com/google/GoogleSignIn-iOS", exact: "8.0.0"),
      .package(url: "https://github.com/onevcat/Kingfisher.git", exact: "8.1.2"),
    ],
    targets: [
      .target(name: "Entities"),
      .target(name: "Extensions"),
      .target(name: "Features"),
      .target(name: "Repositories",
              dependencies: [
                "Entities",
                "Extensions",
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseStorage", package: "firebase-ios-sdk"),
              ]),
      .target(name: "UseCases"),
    ]
)
