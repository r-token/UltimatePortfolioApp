//
//  IssueRow.swift
//  UltimatePortfolio
//
//  Created by Ryan Token on 10/3/23.
//

import SwiftUI

struct IssueRow: View {
    @StateObject var viewModel: ViewModel

    init(issue: Issue) {
        let viewModel = ViewModel(issue: issue)
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationLink(value: viewModel.issue) {
            HStack {
                Image(systemName: "exclamationmark.circle")
                    .imageScale(.large)
                    .opacity(viewModel.iconOpacity)
                    .accessibilityIdentifier(viewModel.iconIdentifier)

                VStack(alignment: .leading) {
                    Text(viewModel.issueTitle)
                        .font(.headline)
                        .lineLimit(1)

                    Text(viewModel.issueTagsList)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Text(viewModel.creationDate)
                        .accessibilityLabel(viewModel.accessibilityCreationDate)
                        .font(.subheadline)

                    if viewModel.completed {
                        Text("CLOSED")
                            .font(.body.smallCaps())
                    }
                }
                .foregroundStyle(.secondary)
            }
        }
        .accessibilityHint(viewModel.accessibilityHint)
        .accessibilityIdentifier(viewModel.issueTitle) // used to identify this row for UI tests
    }
}

#Preview {
    IssueRow(issue: .example)
}
