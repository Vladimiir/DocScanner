//
//  DashboardViewModel.swift
//  DocScanner
//
//  Created by Vladimir Stasenko on 14.01.2023.
//

import Foundation
import SwiftUI
import PhotosUI

class DashboardViewModel: ObservableObject {
    @Published var isScannerPresented = false
    @Published var isGalleryPresented = false
    @Published var selectedImages: [PhotosPickerItem] = []
    @Published var selectedPhotosData: [Data] = []
}
