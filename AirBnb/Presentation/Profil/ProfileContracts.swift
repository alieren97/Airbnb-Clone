//
//  ProfileContracts.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import Foundation

protocol ProfileViewModelProtocol {
    var delegate: ProfileViewModelDelegate? { get set }
    
}

enum ProfileViewModelOutput {
    case setLoading(Bool)
}

protocol ProfileViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: ProfileViewModelOutput)
}
