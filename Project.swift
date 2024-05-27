import ProjectDescription

let project = Project(
    name: "TuistCacheIssue",
    targets: [
        .target(
            name: "TuistCacheIssueApp",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.TuistCacheIssueApp",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["TuistCacheIssueApp/Sources/**"],
            resources: ["TuistCacheIssueApp/Resources/**"],
            dependencies: [
            ]
        ),
        .target(
            name: "Swiftlint",
            destinations: .macOS,
            product: .framework,
            bundleId: "",
            sources: [],
            scripts: [
                .pre(
                    script: """
                    echo "Project.swift:1:1: error: swiftlint failed"
                    exit 1
                    """,
                    name: "Script",
                    basedOnDependencyAnalysis: false
                )
            ]
        ),
    ]
)
