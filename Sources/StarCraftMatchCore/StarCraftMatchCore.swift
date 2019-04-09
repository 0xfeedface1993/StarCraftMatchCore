struct StarCraftMatchCore {
    var text = "Hello, World!"
}


/// 添加赛区，若存在相同名称的赛区则忽略
///
/// - Parameters:
///   - zone: 赛区名称
///   - completion: 执行回调，成功返回true
public func save(zone: String, completion: ExcuteCompletion?) {
    let data = Zone()
    data.name = zone
    do {
        try data.save(set: { (id) in
            data.id = id as! Int
        })
        log(message: ">>>>>> update zone: \(data.name)")
        completion?(true)
    } catch {
        print(error)
        log(error: error.localizedDescription)
        completion?(false)
    }
}

/// 删除战队，根据id删除
///
/// - Parameters:
///   - zone: 赛区ID
///   - completion: 执行回调，成功返回true
public func remove(zoneID: Int, completion: ExcuteCompletion?) {
    let data = Zone()
    do {
        try data.find([("id", zoneID)])
        try data.update(data: [("state", false)], idValue: zoneID)
        log(message: "------ delete zone: \(data.name)")
        completion?(true)
    } catch {
        print(error)
        log(error: error.localizedDescription)
        completion?(false)
    }
}

/// 删除战队，根据名称删除
///
/// - Parameters:
///   - zone: 赛区名称
///   - completion: 执行回调，成功返回true
public func remove(zoneName: String, completion: ExcuteCompletion?) {
    let data = Zone()
    do {
        try data.find([("name", zoneName), ("state", true)])
        try data.update(data: [("state", false)], idValue: data.id)
        log(message: "------ delete zone: \(data.name)")
        completion?(true)
    } catch {
        print(error)
        log(error: error.localizedDescription)
        completion?(false)
    }
}

/// 更新赛区名
///
/// - Parameters:
///   - zone: 赛区id
///   - name: 新赛区名
///   - completion: 执行回调，成功返回true
public func update(zone: Int, name: String, completion: ExcuteCompletion?) {
    let data = Zone()
    do {
        try data.find([("id", zone), ("state", true)])
        let oldName = data.name
        try data.update(data: [("name", name)], idValue: data.id)
        log(message: ">>>>>> update zone: \(oldName) -> \(data.name)")
        completion?(true)
    } catch {
        print(error)
        log(error: error.localizedDescription)
        completion?(false)
    }
}

/// 删除所有赛区数据
public func deleteAllZoneRecords() {
    let data = Zone()
    deleteAll(record: data)
    //    do {
    //        try data.findAll()
    //        data.rows().map({ $0.id }).forEach({
    //            do {
    //                try data.delete($0)
    //            }   catch   {
    //                log(error: error.localizedDescription)
    //            }
    //        })
    //        log(message: "****** delete all zone")
    //    } catch {
    //        log(error: error.localizedDescription)
    //    }
}

/// 删除所有战队数据
public func deleteAllTeamRecords() {
    let data = Team()
    deleteAll(record: data)
    //    do {
    //        try data.findAll()
    //        data.rows().map({ $0.id }).forEach({
    //            do {
    //                try data.delete($0)
    //            }   catch   {
    //                log(error: error.localizedDescription)
    //            }
    //        })
    //        log(message: "****** delete all zone")
    //    } catch {
    //        log(error: error.localizedDescription)
    //    }
}

/// 删除所有战队-赛区数据
public func deleteAllTeamZoneRecords() {
    let data = TeamInZone()
    deleteAll(record: data)
}

