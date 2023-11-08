//
//  ContentViewModel.swift
//  UltimatePortfolio
//
//  Created by Ryan Token on 11/8/23.
//

import Foundation

extension ContentView {
    @dynamicMemberLookup
    class ViewModel: ObservableObject {
        var dataController: DataController

        init(dataController: DataController) {
            self.dataController = dataController
        }

        // make dataController READABLE and add it directly to the View Model
        // so we can say viewModel.suggestedFilterTokens instead of viewModel.dataController.suggestedFilterTokens
        subscript<Value>(dynamicMember keyPath: KeyPath<DataController, Value>) -> Value {
            dataController[keyPath: keyPath]
        }

        // make dataController WRITABLE and add it directly to the View Model
        // so we can say viewModel.suggestedFilterTokens instead of viewModel.dataController.suggestedFilterTokens
        subscript<Value>(dynamicMember keyPath: ReferenceWritableKeyPath<DataController, Value>) -> Value {
            get { dataController[keyPath: keyPath] }
            set { dataController[keyPath: keyPath] = newValue }
        }

        func delete(_ offsets: IndexSet) {
            let issues = dataController.issuesForSelectedFilter()

            for offset in offsets {
                let item = issues[offset]
                dataController.delete(item)
            }
        }
    }
}
