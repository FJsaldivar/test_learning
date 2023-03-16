//
//  DecoderContainerDummy.swift
//  UalaTesting
//
//  Created by Francisco J. Saldivar on 28/11/22.
//

struct DummyContainer<DummyCodinKey>: KeyedDecodingContainerProtocol where DummyCodinKey: CodingKey  {
    typealias Key = DummyCodinKey
    
    var codingPath: [CodingKey] = []
    
    var allKeys: [DummyCodinKey] = []
    var decoder: DummyDecoder
    
    init(decoder: DummyDecoder) {
        self.decoder = decoder
    }

    func contains(_ key: DummyCodinKey) -> Bool {
        true
    }

    func decodeNil(forKey key: DummyCodinKey) throws -> Bool {
        !decoder.config.decodeNil
    }
    
    func decode(_ type: Bool.Type, forKey key: DummyCodinKey) throws -> Bool {
        decoder.propertyLetKeys?.getDummyValue(key: key.stringValue) ?? .init()
    }
    
    func decode(_ type: String.Type, forKey key: DummyCodinKey) throws -> String {
        decoder.propertyLetKeys?.getDummyValue(key: key.stringValue) ?? .init()
    }
    
    func decode(_ type: Double.Type, forKey key: DummyCodinKey) throws -> Double {
        decoder.propertyLetKeys?.getDummyValue(key: key.stringValue) ?? .init()
    }
    
    func decode(_ type: Float.Type, forKey key: DummyCodinKey) throws -> Float {
        decoder.propertyLetKeys?.getDummyValue(key: key.stringValue) ?? .init()
    }
    
    func decode(_ type: Int.Type, forKey key: DummyCodinKey) throws -> Int {
        decoder.propertyLetKeys?.getDummyValue(key: key.stringValue) ?? .init()
    }
    
    func decode(_ type: Int8.Type, forKey key: DummyCodinKey) throws -> Int8 {
        decoder.propertyLetKeys?.getDummyValue(key: key.stringValue) ?? .init()
    }
    
    func decode(_ type: Int16.Type, forKey key: DummyCodinKey) throws -> Int16 {
        decoder.propertyLetKeys?.getDummyValue(key: key.stringValue) ?? .init()
    }
    
    func decode(_ type: Int32.Type, forKey key: DummyCodinKey) throws -> Int32 {
        decoder.propertyLetKeys?.getDummyValue(key: key.stringValue) ?? .init()
    }
    
    func decode(_ type: Int64.Type, forKey key: DummyCodinKey) throws -> Int64 {
        decoder.propertyLetKeys?.getDummyValue(key: key.stringValue) ?? .init()
    }
    
    func decode(_ type: UInt.Type, forKey key: DummyCodinKey) throws -> UInt {
        decoder.propertyLetKeys?.getDummyValue(key: key.stringValue) ?? .init()
    }
    
    func decode(_ type: UInt8.Type, forKey key: DummyCodinKey) throws -> UInt8 {
        decoder.propertyLetKeys?.getDummyValue(key: key.stringValue) ?? .init()
    }
    
    func decode(_ type: UInt16.Type, forKey key: DummyCodinKey) throws -> UInt16 {
        decoder.propertyLetKeys?.getDummyValue(key: key.stringValue) ?? .init()
    }
    
    func decode(_ type: UInt32.Type, forKey key: DummyCodinKey) throws -> UInt32 {
        decoder.propertyLetKeys?.getDummyValue(key: key.stringValue) ?? .init()
    }
    
    func decode(_ type: UInt64.Type, forKey key: DummyCodinKey) throws -> UInt64 {
        decoder.propertyLetKeys?.getDummyValue(key: key.stringValue) ?? .init()
    }
    
    func decode<T>(_ type: T.Type, forKey key: DummyCodinKey) throws -> T where T : Decodable {
        if let result: T = decoder.propertyLetKeys?.getDummyValue(key: key.stringValue) {
                   return result
        }
        
        guard let letKeys = decoder.propertyLetKeys else {
            return try .init(from: decoder)
        }

        let newKeys = PropertyLetKeys(with: letKeys.mainkey,
                                      at: key.stringValue,
                                      values: (letKeys.dumyValues, letKeys.defaultNil))
        return try .init(from: DummyDecoder(config: decoder.config,
                                            propertyLetKeys: newKeys))

    }
    
    func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type,
                                    forKey key: DummyCodinKey) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        try decoder.container(keyedBy: type)
    }
    
    func nestedUnkeyedContainer(forKey key: DummyCodinKey) throws -> UnkeyedDecodingContainer {
        DummyUnkeyedContainer(decoder: decoder)
    }
    
    func superDecoder() throws -> Decoder {
        decoder
    }
    
    func superDecoder(forKey key: DummyCodinKey) throws -> Decoder {
        decoder
    }
}

