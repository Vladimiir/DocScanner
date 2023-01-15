//
//  SelectedPhotoViewModel.swift
//  DocScanner
//
//  Created by Vladimir Stasenko on 15.01.2023.
//

import UIKit

class SelectedPhotoViewModel: ObservableObject {

    let textRecognizer = TextRecognizer()
    let image: UIImage
    @Published var recognizedText = ""

    init(_ image: UIImage) {
        self.image = image
    }

    func onAppearAction() {
        textRecognizer.recognizeTextInImage(image)
        textRecognizer.handler = { text in
            DispatchQueue.main.async {
                self.recognizedText = text
            }
        }
    }
}
