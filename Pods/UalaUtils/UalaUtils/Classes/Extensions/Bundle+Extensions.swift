//
//  Bundle+Extensions.swift
//  UalaUtils
//
//  Created by Monserrath Castro on 16/08/22.
//

public enum FileType: String {
    case json
    case pdf
    case plist

    var fullExtension: String {
        "." + self.rawValue
    }
}

public extension Bundle {
    func getJsonFromFile<T: Codable>(_ file: String) -> T? {
        do {
            guard let data = try getDataFromLocalFile(file, ofType: .json) else { return nil }
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            return nil
        }
    }

    func getDataFromLocalFile(_ file: String, ofType type: FileType) throws -> Data? {
        guard let path = Bundle.main.path(forResource: file, ofType: type.rawValue) else { return nil }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            return data
        } catch {
            return nil
        }
    }
}
