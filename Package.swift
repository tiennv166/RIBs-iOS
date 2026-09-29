// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "RIBs",
    platforms: [
        .iOS("15.0"),
    ],
    products: [
        .library(name: "RIBs", targets: ["RIBs"]),
    ],
    dependencies: [
        // Latest commit from RxSwift's main branch as of 2026-09-29.
        .package(
            url: "https://github.com/ReactiveX/RxSwift",
            revision: "3e33f90c1bcd3cdea25bdb49bd4a594a50c3ab84"
        ),
        .package(url: "https://github.com/mattgallagher/CwlPreconditionTesting.git", from: "2.2.2"), // for testTarget only
    ],
    targets: [
        .target(
            name: "RIBs",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxRelay", package: "RxSwift")
            ],
            path: "RIBs"
        ),
        .testTarget(
            name: "RIBsTests",
            dependencies: ["RIBs", "CwlPreconditionTesting"],
            path: "RIBsTests"
        ),
    ]
)
