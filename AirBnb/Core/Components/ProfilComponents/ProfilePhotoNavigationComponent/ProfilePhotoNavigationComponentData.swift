//
//  ProfilePhotoNavigationComponentData.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import Foundation

class ProfilePhotoNavigationComponentData {
    
    private(set) var name: String
    private(set) var userImage: String

    init(name: String, userImage: String) {
        self.name = name
        self.userImage = userImage
    }
}
