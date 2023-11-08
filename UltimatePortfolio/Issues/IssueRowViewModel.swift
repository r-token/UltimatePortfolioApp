//
//  IssueRowViewModel.swift
//  UltimatePortfolio
//
//  Created by Ryan Token on 11/8/23.
//

import Foundation

extension IssueRow {
    @dynamicMemberLookup
    class ViewModel: ObservableObject {
        let issue: Issue

        var iconOpacity: Double {
            issue.priority == 2 ? 1 : 0
        }

        var iconIdentifier: String {
            issue.priority == 2 ? "\(issue.issueTitle) High Priority" : ""
        }

        var accessibilityHint: String {
            issue.priority == 2 ? "High priority" : ""
        }

        var accessibilityCreationDate: String {
            issue.issueCreationDate.formatted(date: .abbreviated, time: .omitted)
        }

        var creationDate: String {
            issue.issueCreationDate.formatted(date: .numeric, time: .omitted)
        }

        init(issue: Issue) {
            self.issue = issue
        }

        // make all the properties within Issue look like they exist on the ViewModel
        // they don't actually exist inside Issue (like issueTitle, issueCreationDate, issuePriority, etc)
        // but now we can use them like viewModel.issueTitle instead of viewModel.issue.issueTitle
        subscript<Value>(dynamicMember keyPath: KeyPath<Issue, Value>) -> Value {
            issue[keyPath: keyPath]
        }
    }
}
