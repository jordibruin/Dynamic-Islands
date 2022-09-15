//
//  PhoneDetail.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import SwiftUI

struct PhoneDetailView: View {
    
    var body: some View {
        VStack {
            activityPreview
            
            lifeCycle
            Spacer()
            
        }
        .navigationTitle(Island.phone.rawValue.capitalized)
        .enableInjection()
    }
    
    var activityPreview: some View {
        RoundedRectangle(cornerRadius: 40)
            .foregroundColor(.black)
            .overlay(
                HStack {
                    Island.phone.leading
                    Spacer()
                    Island.phone.trailing
                }
                .padding(.horizontal, 12)
            )
            .padding(.horizontal)
            .frame(height: 80)
    }
    
    var lifeCycle: some View {
        HStack {
            Button {
                Island.phone.startLiveActivity()
            } label: {
                Text("Start Live Activity")
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                Island.phone.startLiveActivity()
            } label: {
                Text("Stop Live Activity")
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
    }
}

struct PhoneDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneDetailView()
    }
}
