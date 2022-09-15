//
//  PhoneLeading.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import SwiftUI

struct PhoneLeading: View {
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(.cyan)
                .frame(width: 58, height: 58)
            
            VStack(alignment: .leading) {
                Text("iPhone")
                    .opacity(0.8)
                    .font(.caption)
                Text("John AppleSeed")
                    .font(.body)
                    .fontWeight(.medium)
            }
            .foregroundColor(.white)
        }
    }
}

struct PhoneLeading_Previews: PreviewProvider {
    static var previews: some View {
        PhoneLeading()
    }
}
