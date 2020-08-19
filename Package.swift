// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Zip",
    products: [
        .library(name: "Zip", type:.dynamic,targets: ["Zip"])
    ],
    targets: [
        .target(
            name: "Minizip",
            dependencies: [],
            path: "Zip/minizip",
            exclude: [
                "module"
            ],
            linkerSettings: [
                .linkedLibrary("z"),
                .unsafeFlags([ "-Xlinker","-soname=libZip.so"],.when(platforms: [.android])),
            ]),
        .target(
            name: "Zip",
            dependencies: ["Minizip"],
            path: "Zip",
            exclude: ["minizip", "zlib","Info.plist","Info-tvOS.plist"]),
        .testTarget(
            name: "ZipTests",
            dependencies: ["Zip"],
            path: "ZipTests",
            exclude: [
            "Resources/unsupported_permissions.zip",
              "Resources/3crBXeO.gif",
              "Resources/bb8.zip",
              "Resources/permissions.zip",
              "Resources/kYkLkPf.gif",
              "Info.plist",
            ]
            ),
    ]
)
