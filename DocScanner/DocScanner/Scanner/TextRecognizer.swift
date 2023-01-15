//
//  TextRecognizer.swift
//  DocScanner
//
//  Created by Vladimir Stasenko on 15.01.2023.
//

import UIKit
import Vision

class TextRecognizer {

    private var textRecognitionRequest = VNRecognizeTextRequest(completionHandler: nil)
    private let textRecognitionWorkQueue = DispatchQueue(label: "TextRecognitionQueue",
                                                         qos: .userInitiated,
                                                         attributes: [],
                                                         autoreleaseFrequency: .workItem)
    var handler: ((String) -> ())?

    init() {
        textRecognitionRequest = VNRecognizeTextRequest { [self] (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }

            var detectedText = ""

            // Vision will separate each line, phrase or sentence automatically
            // into separate observations, which we can iterate over
            for observation in observations {
                // Each observation contains a list of possible 'candidates'
                // that the observation could be, such as ['lol', '1o1', '101']
                // We can ask for all the topCandidates up to a certain limit.
                // Each candidate contains the string and the confidence level that it is accurate.
                guard let topCandidate = observation.topCandidates(1).first else { return }

                detectedText += topCandidate.string
                detectedText += "\n"
            }

            self.handler?(detectedText)
        }
    }

    func recognizeTextInImage(_ image: UIImage) {
        guard let cgImage = image.cgImage else { return }

        textRecognitionWorkQueue.async {
            let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            do {
                try requestHandler.perform([self.textRecognitionRequest])
            } catch {
                // You should handle errors appropriately in your app.
                print(error)
            }
        }
    }
}
