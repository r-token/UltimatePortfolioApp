//
//  DevelopmentTests.swift
//  UltimatePortfolioTests
//
//  Created by Ryan Token on 11/7/23.
//

import CoreData
import XCTest
@testable import UltimatePortfolio

final class DevelopmentTests: BaseTestCase {
    func testSampleDataCreationWorks() {
        dataController.createSampleData()

        XCTAssertEqual(dataController.count(for: Tag.fetchRequest()), 5, "There should be 5 sample tags")
        XCTAssertEqual(dataController.count(for: Issue.fetchRequest()), 50, "There should be 50 sample issues")
    }

    // make sure deleteAll deletes everything
    func testDeleteAllDeletesEverything() {
        dataController.createSampleData()
        dataController.deleteAll()

        XCTAssertEqual(dataController.count(for: Tag.fetchRequest()), 0, "There should be no tags")
        XCTAssertEqual(dataController.count(for: Issue.fetchRequest()), 0, "There should be no issues")
    }

    // new tag created should have 0 issues inside
    func testExampleTagShouldHaveNoIssues() {
        let tag = Tag.example

        XCTAssertEqual(tag.issues?.count, 0, "Example tag should have no issues")
    }

    // new issue should have a high priority
    func testExampleIssueShouldHaveHighPriority() {
        let issue = Issue.example

        XCTAssertEqual(issue.priority, 2, "Example issue should have high priority by default")
    }
}
