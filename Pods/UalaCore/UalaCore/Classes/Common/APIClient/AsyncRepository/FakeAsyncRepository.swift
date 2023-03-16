//
//  FakeAsyncRepository.swift
//  UalaCore
//
//  Created by Andrés Abraham Bonilla Gómex on 25/02/23.
//

import UalaCore
import UalaUtils

public final class FakeAsyncRepository: AsyncRepository {

    public init() {}
    
    public func request<Response>(request: APIRequest,
                                  responseType: Response.Type,
                                  retries: Int) async throws -> Response where Response: Decodable {
        
        if let sampleData: Data = request.mocks {
            return try JSONDecoder().decode(responseType.self, from: sampleData)
        } else {
            throw "Without data sample, please added"
        }
    }
    
    public func emptyResponseRequest(request: APIRequest, retries: Int) async throws {
        LogManager.shared.debug(info: "Not implemented")
    }
    
    public func requestData(request: APIRequest, retries: Int) async throws -> Data {
        if let sampleData: Data = request.mocks {
            return sampleData
        } else {
            throw "Without data sample, please added"
        }
    }
}
