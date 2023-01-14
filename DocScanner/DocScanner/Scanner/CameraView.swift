//
//  CameraView.swift
//  DocScanner
//
//  Created by Vladimir Stasenko on 14.01.2023.
//

import Foundation
import SwiftUI
import VisionKit

struct CameraView: UIViewControllerRepresentable {

    typealias CameraResult = Result<VNDocumentCameraScan, Error>
    typealias CancelAction = () -> Void
    typealias ResultAction = (CameraResult) -> Void

    let cancelAction: CancelAction
    let resultAction: ResultAction

    init(cancelAction: @escaping CancelAction,
         resultAction: @escaping ResultAction) {
        self.cancelAction = cancelAction
        self.resultAction = resultAction
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(cancelAction: cancelAction,
                    resultAction: resultAction)
    }

    func makeUIViewController(context: Context) -> VNDocumentCameraViewController  {
        let cameraView = VNDocumentCameraViewController()
        cameraView.delegate = context.coordinator
        return cameraView
    }

    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController,
                                context: Context) {}
}

extension CameraView {

    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {

        let cancelAction: CancelAction
        let resultAction: ResultAction

        init(cancelAction: @escaping CancelAction,
             resultAction: @escaping ResultAction) {
            self.cancelAction = cancelAction
            self.resultAction = resultAction
        }

        func documentCameraViewController(_ controller: VNDocumentCameraViewController,
                                          didFinishWith scan: VNDocumentCameraScan) {
            resultAction(.success(scan))
        }

        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            cancelAction()
        }

        func documentCameraViewController(_ controller: VNDocumentCameraViewController,
                                          didFailWithError error: Error) {
            resultAction(.failure(error))
        }
    }
}
