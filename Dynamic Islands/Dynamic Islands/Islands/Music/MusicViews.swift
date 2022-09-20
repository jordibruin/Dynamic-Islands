//
//  PhoneViews.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct MusicCompactLeading: View {
    var body: some View {
        Image("albumart")
            .resizable()
            .frame(width: 22, height: 22)
            .cornerRadius(5)
    }
}

struct MusicCompactTrailing: View {
    var body: some View {
        Image(systemName: "lines.measurement.horizontal")
            .font(.system(size: 12, weight: .heavy))
            .foregroundColor(.yellow)
    }
}

struct MusicMinimal: View {
    var body: some View {
        Image("albumart")
            .resizable()
            .frame(width: 22, height: 22)
            .cornerRadius(5)
    }
}

// MARK: LEADING
struct MusicLeading: View {
    var body: some View {
        HStack {
            Image("albumart")
                .resizable()
                .frame(width: 62, height: 62)
                .cornerRadius(18)
            
            VStack(alignment: .leading) {
                Text("As it was")
                    .font(.system(.subheadline))
                    .bold()
                Text("Harry Styles")
                    .font(.system(.subheadline))
                    .opacity(0.8)
            }
            .padding(.top, 8)
            .fixedSize(horizontal: true, vertical: false)
        }
        .padding(.top, 4)
    }
}


// MARK: TRAILING

struct MusicTrailing: View {
    var body: some View {
        Image(systemName: "lines.measurement.horizontal")
            .font(.system(size: 30, weight: .medium))
            .foregroundColor(.yellow)
            .padding([.top, .trailing], 12)
    }
}


// MARK: BOTTOM

struct MusicBottom: View {
    var body: some View {
        VStack {
            progress
            buttons
        }
    }
    
    var progress: some View {
        HStack {
            Text("00:23")
                .font(.system(.caption))
                .opacity(0.7)
            
            ProgressView(value: 0.13, total: 1)
                .tint(.white)
            
            Text("-02:43")
                .font(.system(.caption))
                .opacity(0.7)
        }
    }
    
    var buttons: some View {
        HStack {
            Spacer()
            HStack {
                
                Button {
                    
                } label: {
                    Image(systemName: "backward.fill")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "play.fill")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "forward.fill")
                }
                
            }
            .frame(width: 150)
            
            Spacer()
        }
        .font(.title)
        .padding(.bottom, 4)
        .frame(height: 40)
    }
}


// MARK: CENTER
struct MusicCenter: View {
    var body: some View {
        Text("")
    }
}

struct MusicLockScreen: View {
    let context: ActivityViewContext<MusicAttributes>
    
    var body: some View {
        Text("This is the music live activity")
    }
}
