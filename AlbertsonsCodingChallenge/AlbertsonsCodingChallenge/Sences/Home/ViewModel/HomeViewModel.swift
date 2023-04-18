//
//  HomeViewModel.swift
//  AlbertsonsCodingChallenge
//
//  Created by 2423675 on 17/04/23.
//


import Foundation

protocol HomeViewModelProtocol {
    var networkService: NetworkServiceProtocol { get }
    var acromineModel: [AcromineModel] { get set }
    
    func getAcromine(sf: String, lf: String)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - Variables
    var acromineModel: [AcromineModel] = []
    var networkService: NetworkServiceProtocol
    var completion: (([AcromineModel]?, ServerError) -> ())?
    
    //MARK: - Init
    init(acromineModel: [AcromineModel] = [],
         networkService: NetworkServiceProtocol = NetworkService()
    ) {
        self.acromineModel = acromineModel
        self.networkService = networkService
    }
    
    // MARK: - Methods
    
    /// Get data from cloud server
    func getAcromine(sf: String, lf: String = "") {
        if !sf.isEmpty {
            let param = RequestModel.AcromineInfo(sf: sf, lf: lf)
            Task {
                let result = await networkService.getAcromine(param: param)
                switch result {
                case .success(let model):
                    if let model {
                        self.acromineModel = model
                        
                        /// Send result to view with the help of completion block
                        if model.isEmpty {
                            completion?(model, ServerError.emptyData)
                        } else {
                            completion?(model, ServerError.none)
                        }
                    }
                case .failure(let error):
                    completion?(nil, error)
                }
            }
        }
    }
}
