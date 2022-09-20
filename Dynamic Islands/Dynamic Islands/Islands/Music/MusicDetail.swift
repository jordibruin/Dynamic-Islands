//
//  PhoneDetail.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import SwiftUI

struct MusicDetailView: View {
    
    var body: some View {
        VStack {
            activityPreview
            
            lifeCycle
            Spacer()
            
        }
        .navigationTitle(Island.phone.rawValue.capitalized)
//        .enableInjection()
    }
    
    var activityPreview: some View {
        RoundedRectangle(cornerRadius: 40)
            .foregroundColor(.black)
            .overlay(
                HStack {
                    Island.music.leading
                    Spacer()
                    Island.music.trailing
                }
                    .foregroundColor(.white)
                // to compensate for extra padding we add to the top in the island
                    .padding(.top, -4)
                .padding(.horizontal, 12)
            )
            .padding(.horizontal)
            .frame(height: 80)
    }
    
    var lifeCycle: some View {
        HStack {
            Button {
                Island.music.startLiveActivity()
//                UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
            } label: {
                Text("Start Live Activity")
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                Island.music.stopLiveActivity()
            } label: {
                Text("Stop Live Activity")
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
    }
}
