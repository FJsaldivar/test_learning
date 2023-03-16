//
//  DummyDecoder.swift
//  UalaTesting
//
//  Created by Francisco J. Saldivar on 28/11/22.
//

final class DummyDecoder: Decoder {
    var codingPath: [CodingKey] = []
    var userInfo: [CodingUserInfoKey : Any] = [:]
    var config: DummyConfig
    var propertyLetKeys: PropertyLetKeys?
    
    init(config: DummyConfig, propertyLetKeys: PropertyLetKeys? = nil) {
        self.config = config
        self.propertyLetKeys = propertyLetKeys
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        return DummyUnkeyedContainer(decoder: self)
    }
    
    func singleValueContainer() throws -> SingleValueDecodingContainer {
        DummySingleValueContainer(decoder: self)
    }
    
    func container<Key>(keyedBy type: Key.Type) throws ->  KeyedDecodingContainer<Key> where Key : CodingKey {
        .init(DummyContainer<Key>(decoder: self))
    }
}


final class PropertyLetKeys {
    var dumyValues: [String: Any?] = [:]
    var defaultNil: [String] = []
    var mainkey: String
    
    init(mainkey: String) {
        self.mainkey = mainkey
    }
    
    init(with parentKey: String,
         at subKey: String,
         values: ([String: Any?], [String]) ) {
        self.mainkey = "\(parentKey):\(subKey)"
        
        self.dumyValues = values.0
        self.defaultNil = values.1
    }
    
    @discardableResult
    public func setDummyValue(at attribute: String, with value: Any?) -> Self {
        let key = "\(mainkey):\(attribute)"
        if value != nil {
            dumyValues[key] = value
            return self
        }
        guard defaultNil.contains(key) else {
            defaultNil.append(key)
            return self
        }
        
        return self
    }
    
    func getDummyValue<T>(key: String) -> T? {
        dumyValues["\(self.mainkey).\(key)"] as? T
    }
    
    func decodeNil(key: String) -> Bool {
        let key = "\(self.mainkey).\(key)"
        return defaultNil.contains(key)
    }
}

public struct PropertyDummyValue {
    var attribute: String
    var value: Any?

    public init(at attribute: String, with value: Any?) {
        self.attribute = attribute
        self.value = value
    }
}
