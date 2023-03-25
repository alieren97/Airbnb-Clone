//
//  ProfileViewModel.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import UIKit

final class ProfileViewModel: ProfileViewModelProtocol {
    
    var delegate: ProfileViewModelDelegate?

    private func notify(_ output: ProfileViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
