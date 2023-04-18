//
//  Constant.swift
//  AlbertsonsCodingChallenge
//
//  Created by 2423675 on 17/04/23.
//


import Foundation

enum Constant {
    /// Server URL
    static let serverURL = "http://www.nactem.ac.uk/"
    static let acromineAPI = "software/acromine/dictionary.py"
    
    /// API errors message
    static let noInternet = "Internet appears to be offline. Try again after some times"
    static let networkRespose = "Cloud server is not responding. Try again after some times"
    static let requestNotFound = "Request not found"
    static let requestValidation = "Internal request failed, check the request once again."
    static let internalServer = "Internal server error."
    static let unexpected = "Unexpected error occured, Error Code"
    static let wrapperFailed = "Optional unwrapping failed. Check the response model"
    static let tryCatch = "Error Occurred in Try-Catch block"
    static let emptyData = "Not found any data."
    static let none = "No error"
    
    /// Tableview cell
    static let longForm = "Long Form"
    static let frequency = "Frequency"
    static let since = "Since"
    static let variationObjects = "Variation objects"
}
