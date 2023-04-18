//
//  NetworkService+Error.swift
//  AlbertsonsCodingChallenge
//
//  Created by 2423675 on 17/04/23.
//


import Foundation

typealias ServerError = NetworkService.ResponseError

extension NetworkService {
    
    /// The network response related error has been declared here.
    enum ResponseError: Error {
        case noInternet
        case networkRespose
        case requestNotFound
        case requestValidation
        case internalServer
        case unexpected(Int)
        case wrapperFailed
        case tryCatch(Error)
        case emptyData
        case none
        
        
        /// `String` represents the error in detail.
        var message: String {
            switch self {
            case .noInternet:
                return Constant.noInternet
            case .networkRespose:
                return Constant.networkRespose
            case .requestNotFound:
                return Constant.requestNotFound
            case .requestValidation:
                return Constant.requestValidation
            case .internalServer:
                return Constant.internalServer
            case .unexpected(let code):
                return "\(Constant.unexpected) - \(code)"
            case .wrapperFailed:
                return Constant.wrapperFailed
            case .tryCatch(let error):
                return "\(Constant.tryCatch) - \(error.localizedDescription)"
            case .emptyData:
                return Constant.emptyData
            case .none:
                return Constant.none
            }
        }
    }
}
