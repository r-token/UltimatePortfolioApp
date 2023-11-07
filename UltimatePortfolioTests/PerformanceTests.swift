//
//  PerformanceTests.swift
//  UltimatePortfolioTests
//
//  Created by Ryan Token on 11/7/23.
//

import XCTest
@testable import UltimatePortfolio

final class PerformanceTests: BaseTestCase {
    func testAwardCalculationPerformance() {
        // Given
        for _ in 1...100 {
            dataController.createSampleData()
        }

        let awards = Array(repeating: Award.allAwards, count: 25).joined()

        // Then
        XCTAssertEqual(awards.count, 500, "This checks the awards count is constant. Change this if you add awards")

        measure {
            _ = awards.filter(dataController.hasEarned)
        }
    }
}
