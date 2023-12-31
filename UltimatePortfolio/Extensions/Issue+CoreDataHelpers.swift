//
//  Issue+CoreDataHelpers.swift
//  UltimatePortfolio
//
//  Created by Ryan Token on 10/3/23.
//

import Foundation

extension Issue {
    var issueTitle: String {
        get { title ?? "" }
        set { title = newValue}
    }

    var issueContent: String {
        get { content ?? "" }
        set { content = newValue }
    }

    var issueCreationDate: Date {
        creationDate ?? .now
    }

    var issueModificationDate: Date {
        modificationDate ?? .now
    }

    var issueTags: [Tag] {
        let result = tags?.allObjects as? [Tag] ?? []
        return result.sorted()
    }

    var issueTagsList: String {
        let noTags = String(localized: "No tags")
        guard let tags else { return noTags }

        if tags.count == 0 {
            return noTags
        } else {
            return issueTags.map(\.tagName).formatted()
        }
    }

    var issueStatus: String {
        if completed {
            return String(localized: "Closed")
        } else {
            return String(localized: "Open")
        }
    }

    static var example: Issue {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext

        let issue = Issue(context: viewContext)
        issue.title = String(localized: "Example Issue")
        issue.content = String(localized: "This is an example issue")
        issue.priority = 2
        issue.creationDate = .now
        return issue
    }
}

extension Issue: Comparable {
    public static func <(lhs: Issue, rhs: Issue) -> Bool {
        let left = lhs.issueTitle.localizedLowercase
        let right = rhs.issueTitle.localizedLowercase
        if left == right {
            return lhs.issueCreationDate < rhs.issueCreationDate
        } else {
            return left < right
        }
    }
}
