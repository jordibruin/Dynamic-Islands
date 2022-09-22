//
//  AreasDetail.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import SwiftUI

struct AreasDetail: View {
    var body: some View {
        VStack {
            activityPreview
//            lifeCycle
            Spacer()
        }
//        .enableInjection()
        .navigationTitle(Island.areas.rawValue.capitalized)
    }
    
    var activityPreview: some View {
        RoundedRectangle(cornerRadius: 40)
            .foregroundColor(.black)
            .overlay(
                HStack {
//                    Island.areas.leading
                    Spacer()
//                    Island.areas.trailing
                }
                .padding(.horizontal, 12)
                .foregroundColor(.white)
            )
            .padding(.horizontal)
            .frame(height: 80)
    }
    
    var lifeCycle: some View {
        HStack {
            Button {
//                Island.areas.startLiveActivity()
//                UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
            } label: {
                Text("Start Live Activity")
            }
            .buttonStyle(.borderedProminent)
            
            Button {
//                Island.areas.stopLiveActivity()
            } label: {
                Text("Stop Live Activity")
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
    }
}

struct AreasDetail_Previews: PreviewProvider {
    static var previews: some View {
        AreasDetail()
    }
}
