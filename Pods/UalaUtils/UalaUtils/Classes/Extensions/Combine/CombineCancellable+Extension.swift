//
//  CombineCancellable+Extension.swift
//  UalaUtils
//
//  Created by Mobile Dev on 30/01/23.
//

import Foundation
import Combine

typealias CancelBag = Set<AnyCancellable>

public extension CancelBag {
    public mutating func cancelAll() {
        forEach { $0.cancel() }
        removeAll()
    }
}
