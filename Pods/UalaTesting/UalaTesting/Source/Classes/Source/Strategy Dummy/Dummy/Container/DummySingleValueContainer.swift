//
//  DummySingleValueContainer.swift
//  UalaTesting
//
//  Created by Francisco J. Saldivar on 28/11/22.
//

struct DummySingleValueContainer: SingleValueDecodingContainer {
    let decoder: DummyDecoder
    let codingPath: [CodingKey] = []
    
    init(decoder: DummyDecoder) {
        self.decoder = decoder
    }
    
    func decodeNil() -> Bool {
        !decoder.config.decodeNil
    }
    
    func decode(_: Bool.Type) throws -> Bool {
        .init()
    }
    
    func decode(_: String.Type) throws -> String {
        .init()
    }
    
    func decode(_: Double.Type) throws -> Double {
        .init()
    }
    
    func decode(_: Float.Type) throws -> Float {
        .init()
    }
    
    func decode(_: Int.Type) throws -> Int {
        .init()
    }
    
    func decode(_: Int8.Type) throws -> Int8 {
        .init()
    }
    
    func decode(_: Int16.Type) throws -> Int16 {
        .init()
    }
    
    func decode(_: Int32.Type) throws -> Int32 {
        .init()
    }
    
    func decode(_: Int64.Type) throws -> Int64 {
        .init()
    }
    
    func decode(_: UInt.Type) throws -> UInt {
        .init()
    }
    
    func decode(_: UInt8.Type) throws -> UInt8 {
        .init()
    }
    
    func decode(_: UInt16.Type) throws -> UInt16 {
        .init()
    }
    
    func decode(_: UInt32.Type) throws -> UInt32 {
        .init()
    }
    
    func decode(_: UInt64.Type) throws -> UInt64 {
        .init()
    }
    
    func decode<T>(_: T.Type) throws -> T where T: Decodable {
        guard let letKeys = decoder.propertyLetKeys else {
            return try .init(from: decoder)
        }
        
        let newKeys = PropertyLetKeys(with: letKeys.mainkey,
                                      at: "\(T.self)_value",
                                      values: (letKeys.dumyValues, letKeys.defaultNil))
        
        return try .init(from: DummyDecoder(config: decoder.config,
                                            propertyLetKeys: newKeys))
    }
}
