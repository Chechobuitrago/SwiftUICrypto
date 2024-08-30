//
//  XMarkButton.swift
//  SwiftUICrypto
//
//  Created by Sergio Buitrago on 29/08/24.
//

import SwiftUI


struct XMarkButton: View {
    
    @Environment(\.dismiss) var dismissScreen
    
    var body: some View {
        Button(action: {
            dismissScreen()
        }, label: {
            Image(systemName: "xmark")
        })
    }
}

#Preview {
    XMarkButton()
}
