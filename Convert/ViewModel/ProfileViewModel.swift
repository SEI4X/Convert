//
//  ProfileViewModel.swift
//  Convert
//
//  Created by Alexei Mashkov on 21.07.2021.
//

import UIKit

protocol ProfileProtocol {
    var name: String { get set }
    var age: String { get set }
    var mainPhotos: [UIImage] { get set }
}
