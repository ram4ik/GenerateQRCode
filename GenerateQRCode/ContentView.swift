//
//  ContentView.swift
//  GenerateQRCode
//
//  Created by Ramill Ibragimov on 04.08.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var qrCodeUrl: String = ""
    
    var body: some View {
        VStack {
            Text("Simple QR Code Generator")
                .font(.title)
            if !qrCodeUrl.isEmpty {
                QRCodeView(url: qrCodeUrl)
            } else {
                Image(systemName: "qrcode")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .opacity(0.5)
                    .padding()
            }
            Text("from URL: \(qrCodeUrl)")
                .foregroundColor(.secondary)
            TextField("URL address", text: $qrCodeUrl)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
