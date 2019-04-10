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
        
        // 单个添加记录
        save(zone: "美洲") { (isSuccess) in
            XCTAssert(isSuccess, "*** 插入或更新赛区数据失败")
        }
        
        // 批量添加记录
        save(zones: ["美洲", "太平洋", "亚洲"]) { (isSuccess) in
            XCTAssert(isSuccess, "*** 批量插入或更新赛区数据失败")
        }
        
        let z = Zone()
        try? z.findAll()
        
        update(zone: z.rows()[0].id, name: "大风州") { (isSuccess) in
            XCTAssert(isSuccess, "*** 批量更新赛区数据失败")
        }
        
    
        
    }
}
