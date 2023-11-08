//
//  TagTests.swift
//  UltimatePortfolioTests
//
//  Created by Ryan Token on 11/7/23.
//

import CoreData
import XCTest
@testable import UltimatePortfolio

final class TagTests: BaseTestCase {
    func testCreatingTagsAndIssues() {
        // Given
        let targetCount = 10

        // When
        for _ in 0..<targetCount {
            let tag = Tag(context: managedObjectContext)

            for _ in 0..<targetCount {
                let issue = Issue(context: managedObjectContext)
                tag.addToIssues(issue)
            }
        }

        // Then
        XCTAssertEqual(
            dataController.count(for: Tag.fetchRequest()),
            targetCount,
            "There should be \(targetCount) tags."
        )
        XCTAssertEqual(
            dataController.count(for: Issue.fetchRequest()),
            targetCount * targetCount,
            "There should be \(targetCount * targetCount) tags."
        )
    }

    func testDeletingTagDoesNotDeleteIssues() throws {
        // Given
        dataController.createSampleData()

        let request = NSFetchRequest<Tag>(entityName: "Tag")
        let tags = try managedObjectContext.fetch(request)

        // When
        dataController.delete(tags[0])

        // Then
        XCTAssertEqual(
            dataController.count(for: Tag.fetchRequest()),
            4,
            "There should be 4 tags after deleting 1 from our sample data"
        )
        XCTAssertEqual(
            dataController.count(for: Issue.fetchRequest()),
            50,
            "There should still be 50 issues after deleting a tag from our sample data"
        )
    }
}
