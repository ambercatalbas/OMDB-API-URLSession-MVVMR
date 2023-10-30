//
//  Logger.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 29.10.2023.
//

import Foundation
import os.log

class Logger {

    /// shared instance
    static var shared = Logger()

    private init(){}

    /// is Loggerging enable
    var isEnabled: Bool {
        return true
    }

    /// Logger for success. Will add ✅ emoji to see better
    ///
    /// - Parameter message: Loggerging message
    static func info(_ message: Any!) {
        guard Logger.shared.isEnabled else { return }
        Logger.shared.debug(type: "✅", message: message)
    }

    /// Logger for warning. Will add ⚠️ emoji to see better
    ///
    /// - Parameter message: Loggerging message
    static func warning(_ message: Any!) {
        guard Logger.shared.isEnabled else { return }
        Logger.shared.debug(type: "⚠️", message: message)
    }

    /// Logger for error. Will add ❌ emoji to see better
    ///
    /// - Parameter message: Loggerging message
    static func error(_ message: Any!) {
        guard Logger.shared.isEnabled else { return }
        Logger.shared.debug(type: "❌", message: message)
    }

    private func debug(type: Any?, message: Any?) {
        guard Logger.shared.isEnabled else { return }
        DispatchQueue.main.async {
            os_log("%@", type: .debug, "\(type ?? "") -> \(message ?? "")")
        }
    }
}
