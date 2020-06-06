// swift-tools-version:5.2

import PackageDescription

let package = Package(
        name: "Swift_Atomics",
        products: [
            .library(name: "Swift_Atomics", type: .dynamic, targets: ["SwiftAtomics"]),
            .library(name: "CAtomics", type: .dynamic, targets: ["CAtomics"]),
        ],
        targets: [
            .target(name: "SwiftAtomics",  dependencies: ["CAtomics"]),
            .testTarget(name: "SwiftAtomicsTests", dependencies: ["SwiftAtomics"]),
            .target(name: "CAtomics", dependencies: []),
            .testTarget(name: "CAtomicsTests", dependencies: ["CAtomics"]),
        ]/*,
  swiftLanguageVersions: [.v4, .v4_2, .v5]*/
)
