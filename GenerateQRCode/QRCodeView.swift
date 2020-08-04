//
//  QRCodeView.swift
//  GenerateQRCode
//
//  Created by Ramill Ibragimov on 04.08.2020.
//

import SwiftUI
import Foundation
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var url: String
    
    var body: some View {
        Image(uiImage: generateQRCode(url))
            .interpolation(.none)
            .resizable()
            .frame(width: 150, height: 150)
    }
    
    func generateQRCode(_ string: String) -> UIImage {
        let data = Data(url.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let qrCodeImage = filter.outputImage {
            if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent) {
            
                return UIImage(cgImage: qrCodeCGImage)
            }
        }
        
        return UIImage(systemName: "mark") ?? UIImage()
    }
}

