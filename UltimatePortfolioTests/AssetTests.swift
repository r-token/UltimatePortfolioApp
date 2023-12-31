//
//  AssetTests.swift
//  UltimatePortfolioTests
//
//  Created by Ryan Token on 11/7/23.
//

import XCTest
@testable import UltimatePortfolio

final class AssetTests: XCTestCase {
    func testColorsExist() {
        // Given
        let allColors = ["Dark Blue", "Dark Gray", "Gold", "Gray", "Green",
        "Light Blue", "Midnight", "Orange", "Pink", "Purple", "Red", "Teal"]

        // Then
        for color in allColors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load color '\(color)' from asset catalog")
        }
    }

    func testAwardsLoadCorrectly() {
        // Then
        XCTAssertTrue(Award.allAwards.isEmpty == false, "Failed to load awards from JSON.")
    }
}
