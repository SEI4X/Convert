//
//  SearchCellProtocol.swift
//  Convert
//
//  Created by Alexei Mashkov on 26.06.2021.
//

import UIKit

protocol SearchConfiguredCell {
    static var reusedId: String { get }
    func configure(with intValue: Int)
}
