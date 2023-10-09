//
//  NoIssueView.swift
//  UltimatePortfolio
//
//  Created by Ryan Token on 10/8/23.
//

import SwiftUI

struct NoIssueView: View {
    @EnvironmentObject var dataController: DataController
    
    var body: some View {
        Text("No issue selected")
            .font(.title)
            .foregroundStyle(.secondary)
        
        Button("New Issue") {
            print("Making new issue")
        }
    }
}

#Preview {
    NoIssueView()
}
