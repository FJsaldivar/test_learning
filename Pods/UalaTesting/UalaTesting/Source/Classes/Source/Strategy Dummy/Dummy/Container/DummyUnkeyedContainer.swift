//
//  DummyUnkeyedContainer.swift
//  UalaTesting
//
//  Created by Francisco J. Saldivar on 28/11/22.
//

struct DummyUnkeyedContainer: UnkeyedDecodingContainer {
    var count: Int? = 0
    
    var isAtEnd: Bool = false
    
    var currentIndex: Int = 0
    
    mutating func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        self
    }
    
    mutating func superDecoder() throws -> Decoder {
        decoder
    }
    
    let codingPath: [CodingKey] = []
    var decoder: DummyDecoder
    
    init(decoder: DummyDecoder) {
        self.decoder = decoder
        count = decoder.config.arrayElements
        isAtEnd = count == 0
    }
    
    mutating func decodeNil() throws -> Bool {
        !decoder.config.decodeNil
    }
    
    mutating func decode(_ type: Bool.Type) throws -> Bool {
        return .init()
    }
    
    mutating func decode(_ type: String.Type) throws -> String {
        String()
    }
    
    mutating func decode(_: Double.Type) throws -> Double {
        .init()
    }
    
    mutating func decode(_: Float.Type) throws -> Float {
        .init()
    }
    
    mutating func decode(_: Int.Type) throws -> Int {
        .init()
    }
    
    mutating func decode(_: Int8.Type) throws -> Int8 {
        .init()
    }
    
    mutating func decode(_: Int16.Type) throws -> Int16 {
        .init()
    }
    
    mutating func decode(_: Int32.Type) throws -> Int32 {
        .init()
    }
    
    mutating func decode(_: Int64.Type) throws -> Int64 {
        .init()
    }
    
    mutating func decode(_: UInt.Type) throws -> UInt {
        .init()
    }
    
    mutating func decode(_: UInt8.Type) throws -> UInt8 {
        .init()
    }
    
    mutating func decode(_: UInt16.Type) throws -> UInt16 {
        .init()
    }
    
    mutating func decode(_: UInt32.Type) throws -> UInt32 {
        .init()
    }
    
    mutating func decode(_: UInt64.Type) throws -> UInt64 {
        .init()
    }
    
    mutating func decode<T>(_: T.Type) throws -> T where T: Decodable {
        nextIndex()
        guard let letKeys = decoder.propertyLetKeys else {
            return try .init(from: decoder)
        }
        
        let newKeys = PropertyLetKeys(with: letKeys.mainkey,
                                      at: "\(T.self)_value",
                                      values: (letKeys.dumyValues, letKeys.defaultNil))
        
        return try .init(from: DummyDecoder(config: decoder.config,
                                            propertyLetKeys: newKeys))
    }
    
    mutating func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws
    -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        try decoder.container(keyedBy: type)
    }
    
    mutating func nextIndex() {
        currentIndex += 1
        isAtEnd = currentIndex >= count ?? 0
    }
}
