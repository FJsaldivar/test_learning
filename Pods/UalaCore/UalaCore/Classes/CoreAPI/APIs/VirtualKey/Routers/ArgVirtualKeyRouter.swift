import Alamofire

struct ArgVirtualKeyRouter: VirtualKeyRouteable {
    var route: VirtualKeyRoute = .getClabeCVU
    var cvuCOELSA = {
        FeatureFlaggingManager.shared.featureEnabled(.coelsaCVU)
    }
    
    var baseUrl: String {
        cvuCOELSA() ? String.getConfigurationValue(forKey: .baseUrlTransactional, from: .Core) : String.getConfigurationValue(forKey: .baseUrlDebit, from: .Core)
    }
    
    var path: String {
        switch route {
        case .getClabeCVU, .postClabeCVU:
            return cvuCOELSA() ? "api/v1/address" : "/2/cvu"
        }
    }
    
    var mapper: Mappeable {
        switch route {
        case .getClabeCVU, .postClabeCVU:
            return ArgCVUMapper()
        }
    }
    
    var method: HTTPMethod {
        switch route {
        case .getClabeCVU:
            return .get
        case .postClabeCVU:
            return .post
        }
    }
}
