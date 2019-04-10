//
//  Team.swift
//  PerfectTemplate
//
//  Created by virus1994 on 2019/4/9.
//

import StORM
import SQLiteStORM

public typealias ExcuteCompletion = (Bool) -> ()

/// 赛区
public class Zone: SQLiteStORM {
    var id: Int = 0
    /// 赛区名
    var name: String = ""
    /// 删除标记
    var activeState: Int = 0
    
    override open func table() -> String {
        return "zone"
    }
    
    override public func to(_ this: StORMRow) {
        id = this.data["id"] as? Int ?? 0
        name = this.data["name"] as? String ?? ""
        activeState = this.data["activeState"] as? Int ?? 0
    }
    
    func rows() -> [Zone] {
        var rows = [Zone]()
        for i in 0..<self.results.rows.count {
            let item = Zone()
            item.to(self.results.rows[i])
            rows.append(item)
        }
        return rows
    }
}

/// 战队
public class Team: SQLiteStORM {
    var id: Int = 0
    /// 名称
    var name: String = ""
    /// 负责人（默认经理）
    var mananger: String = ""
    /// 删除标记
    var activeState: Int = 0
    
    override open func table() -> String {
        return "team"
    }
    
    override public func to(_ this: StORMRow) {
        id = this.data["id"] as? Int ?? 0
        name = this.data["name"] as? String ?? ""
        mananger = this.data["mananger"] as? String ?? ""
        activeState = this.data["activeState"] as? Int ?? 0
    }
    
    func rows() -> [Team] {
        var rows = [Team]()
        for i in 0..<self.results.rows.count {
            let item = Team()
            item.to(self.results.rows[i])
            rows.append(item)
        }
        return rows
    }
}

/// 赛区-战队关系
public class TeamInZone: SQLiteStORM {
    var id: Int = 0
    var teamid: Int = 0
    var zoneid: Int = 0
    /// 删除标记
    var activeState: Int = 0
    
    override open func table() -> String {
        return "team_relate_zone"
    }
    
    override public func to(_ this: StORMRow) {
        id = this.data["id"] as? Int ?? 0
        teamid = this.data["deviceid"] as? Int ?? 0
        zoneid = this.data["userid"] as? Int ?? 0
        activeState = this.data["activeState"] as? Int ?? 0
    }
    
    func rows() -> [TeamInZone] {
        var rows = [TeamInZone]()
        for i in 0..<self.results.rows.count {
            let item = TeamInZone()
            item.to(self.results.rows[i])
            rows.append(item)
        }
        return rows
    }
    
    /// 请求赛区内战队列表
    ///
    /// - Parameter zone: 赛区id
    /// - Returns: 赛区+战队列表，若没有有效战队信息则返回nil
    func request(teamInZone zone: Int) -> (Zone, [Team])? {
        do {
            try self.find([("zoneid", zone), ("activeState", 1)])
            let zone = Zone()
            try zone.get(zoneid)
            var teams = [Team]()
            for item in self.rows() {
                let team = Team()
                try? team.get(item.teamid)
                guard team.id != 0 else { continue }
                teams.append(team)
            }
            log(message: "<<<<<< request team in zone: \(self.zoneid)")
            return (zone, teams)
        } catch {
            print(error)
            log(error: error.localizedDescription)
            return nil
        }
    }
}
