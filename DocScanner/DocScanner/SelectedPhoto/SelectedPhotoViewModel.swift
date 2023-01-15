//
//  SelectedPhotoViewModel.swift
//  DocScanner
//
//  Created by Vladimir Stasenko on 15.01.2023.
//

import UIKit

class SelectedPhotoViewModel: ObservableObject {

//    private let textRecognizer

    let image: UIImage

    init(_ image: UIImage) {
        self.image = image
    }
}
