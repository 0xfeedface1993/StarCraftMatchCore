import XCTest
@testable import StarCraftMatchCore

final class StarCraftMatchCoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(StarCraftMatchCore().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample), ("testTeamDB", testTeamDB)
    ]
    
    func testTeamDB() {
        configDatabase()
        
        deleteAllTeamRecords()
        deleteAllZoneRecords()
        deleteAllTeamZoneRecords()
        
        save(zone: "美洲") { (isSuccess) in
            XCTAssert(isSuccess, "*** 插入或更新赛区数据失败")
        }
    }
}
