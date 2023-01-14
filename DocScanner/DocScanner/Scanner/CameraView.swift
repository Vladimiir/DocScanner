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

    func makeCoordinator() -> Coordinator {
        Coordinator()
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

        func documentCameraViewController(_ controller: VNDocumentCameraViewController,
                                          didFinishWith scan: VNDocumentCameraScan) {

        }

        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {

        }

        func documentCameraViewController(_ controller: VNDocumentCameraViewController,
                                          didFailWithError error: Error) {

        }
    }
}
