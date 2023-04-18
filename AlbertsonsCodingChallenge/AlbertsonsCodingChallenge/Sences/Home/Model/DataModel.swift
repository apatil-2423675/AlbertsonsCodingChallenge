//
//  DataModel.swift
//  AlbertsonsCodingChallenge
//
//  Created by 2423675 on 17/04/23.
//

import Foundation

struct AcromineModel: Decodable {
    // MARK: - Variables
    let sf: String?
    let lfs: [LongFormModel]?
    
    // MARK: - Init
    init(sf: String? = nil,
         lfs: [LongFormModel]? = nil
    ){
        self.sf = sf
        self.lfs = lfs
    }
    
    /// API unique key name
    enum CodingKeys: String, CodingKey {
        case sf = "sf"
        case lfs = "lfs"
    }
}

struct LongFormModel: Decodable {
    
    // MARK: - Variable
    
    let lf: String?
    let freq: Int?
    let since: Int?
    let vars: [VarsModel]?
    
    // MARK: - Init
    
  
    init(lf: String? = nil,
         freq: Int? = nil,
         since: Int? = nil,
         vars: [VarsModel]? = nil
    ) {
        self.lf = lf
        self.freq = freq
        self.since = since
        self.vars = vars
    }
    
    /// API unique key name
    enum CodingKeys: String, CodingKey {
        case lf = "lf"
        case freq = "freq"
        case since = "since"
        case vars = "vars"
    }
}

struct VarsModel: Decodable {
    
    // MARK: - Variables
    
    let lf: String?
    let freq: Int?
    let since: Int?
    
    // MARK: - Init
   
    init(lf: String? = nil,
         freq: Int? = nil,
         since: Int? = nil
    ) {
        self.lf = lf
        self.freq = freq
        self.since = since
    }
    
    /// API unique key name
    enum CodingKeys: String, CodingKey {
        case lf = "lf"
        case freq = "freq"
        case since = "since"
    }
}
