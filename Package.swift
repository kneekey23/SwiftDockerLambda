// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftDockerLambda",
    platforms: [
        .macOS(.v10_13),
    ],
    products: [
      .executable(name: "SwiftDockerLambda", targets: ["SwiftDockerLambda"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/swift-server/swift-aws-lambda-runtime.git", .upToNextMajor(from:"0.2.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftDockerLambda",
            dependencies: [
                .product(name: "AWSLambdaRuntime", package: "swift-aws-lambda-runtime")
            ]),
        .testTarget(
            name: "SwiftDockerLambdaTests",
            dependencies: ["SwiftDockerLambda"]),
    ]
)
