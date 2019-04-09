//
//  Loger.swift
//  PerfectTemplate
//
//  Created by virus1994 on 2019/4/9.
//

import PerfectLogger

public func log(error: String) {
    LogFile.debug(error, logFile: "log.txt")
}

public func log(message: String) {
    LogFile.debug(message, logFile: "log.txt")
}
