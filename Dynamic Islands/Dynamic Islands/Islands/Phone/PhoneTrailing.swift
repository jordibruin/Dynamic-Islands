//
//  PhoneTrailing.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import SwiftUI

struct PhoneTrailing: View {
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(.red)
                .frame(width: 50, height: 50)
                .overlay(
                    Image(systemName: "phone.down.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                )
            
            Circle()
                .foregroundColor(.green)
                .frame(width: 50, height: 50)
                .overlay(
                    Image(systemName: "phone.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                )
        }
    }
}

struct PhoneTrailing_Previews: PreviewProvider {
    static var previews: some View {
        PhoneTrailing()
    }
}
