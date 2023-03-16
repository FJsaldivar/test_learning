//
//  WeakObjectContainer.swift
//  UalaFareUI
//
//  Created by Luis Perez on 20/07/22.
//

/// A container for weak reference objects
final class WeakObjectContainer<T: AnyObject> {
    
    /// Weak referenced object
    weak var object: T?
                                                    
    init(object: T) {
        self.object = object
    }
}
