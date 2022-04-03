//
//  CenterNetwork.swift
//  FindCoronaCenter
//
//  Created by Byoung_wook on 2022/04/03.
//

import Foundation
import Combine

class CenterNetwork {
    private let session: URLSession
    let api = CenterAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getCenterList() -> AnyPublisher<[Center], URLError> {
        guard let url = api.getCenterListComponents().url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.setValue("Infuser Jal07NPTACLcuaSB4PR2r/V2X/fL4Ux20cGMp0xJS2Li7NrxlyCjZGMKl2POqBw+4eOr08c3IOT1Xt/GYWHqGg==", forHTTPHeaderField: "Authorization")
        
        return session.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.unknown)
            }
                
                switch httpResponse.statusCode {
                case 200..<300:
                    return data
                case 400..<500:
                    throw URLError(.clientCertificateRejected)
                case 500..<599:
                    throw URLError(.badServerResponse)
                default:
                    throw URLError(.unknown)
                }
            }
            .decode(type: CenterAPIResponse.self, decoder: JSONDecoder())
            .map {$0.data}
            .mapError { $0 as! URLError}
            .eraseToAnyPublisher()
        
    }
    
}
