//
//  Dummy.swift
//  UalaTesting
//
//  Created by Francisco J. Saldivar on 28/11/22.
//

public protocol UalaDummy: Decodable, UalaPseudoEquatable, Reflectable {
    func asDictionary() -> [String: Any]
}

public struct DummyConfig {
    var decodeNil: Bool
    var arrayElements: Int
    
    public init(decodeNil: Bool = true, arrayElements: Int = 0) {
        self.decodeNil = decodeNil
        self.arrayElements = arrayElements
    }
}

extension UalaDummy {
    
    public static func dummy(with config: DummyConfig = .init()) throws -> Self {
        let instance = try Self.init(from: DummyDecoder(config: config))
        return instance
    }
    
    public static func dummyLet(_ dummyValue: PropertyDummyValue ...,
                                config: DummyConfig = .init()) throws -> Self {
        let propertyLeyKeys = PropertyLetKeys(mainkey: String(describing: Self.self))
        dummyValue.forEach { item in
            propertyLeyKeys.setDummyValue(at: item.attribute, with: item.value)
            
        }

        return try Self.init(from: DummyDecoder(config: config, propertyLetKeys: propertyLeyKeys))
    }
    
    public func set<T>(key: WritableKeyPath<Self, T>, value: T) -> Self {
        var newDummy = self
        newDummy[keyPath: key] = value
        return newDummy
    }
}

extension UalaDummy {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        compare(lhs, rhs).status
    }

    public func asDictionary() -> [String: Any] {
        let mirror = Mirror(reflecting: self)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
            guard let label = label else { return nil }
            return (label, value)
        }).compactMap { $0 })
        return dict
    }
}

public struct UalaDummyKeys: CodingKey {
    public var stringValue: String = String()
    
    public init?(stringValue: String) { }
    
    public var intValue: Int?
    
    public init?(intValue: Int) {}
    init() {}
}

extension Decoder {
    public func dummy<T: Decodable>() throws -> T {
        let containter = try self.container(keyedBy: UalaDummyKeys.self)
        
        return try containter.decode(T.self, forKey: .init())
    }
}
