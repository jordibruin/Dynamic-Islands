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
            .foregroundStyle(LinearGradient(colors: [.orange, .white], startPoint: .top, endPoint: .bottom))
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
        HStack(spacing: 20) {
            Image("albumart")
                .resizable()
                .frame(width: 62, height: 62)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            VStack(alignment: .leading) {
                Text("As it was")
                    .font(.system(.subheadline))
                    .bold()
                Text("Harry Styles")
                    .font(.system(.subheadline))
                    .foregroundStyle(.secondary)
            }
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
            .foregroundStyle(LinearGradient(colors: [.orange, .white], startPoint: .top, endPoint: .bottom))
            .padding([.top, .trailing], 12)
    }
}


// MARK: BOTTOM

struct MusicBottom: View {
    var body: some View {
        VStack(spacing: 0) {
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
                .scaleEffect(x: 1, y: 1.5, anchor: .center)
                .tint(Color(white: 0.5))
            Text("-02:43")
                .font(.system(.caption))
                .opacity(0.7)
        }
    }
    
    var buttons: some View {
        HStack {
            Spacer()
            HStack(spacing: 40) {
                Button {
                } label: {
                    Image(systemName: "backward.fill")
                        .font(.title2)
                }
                Button {
                } label: {
                    Image(systemName: "play.fill")
                        .font(.largeTitle)
                }
                Button {
                } label: {
                    Image(systemName: "forward.fill")
                        .font(.title2)
                }
            }
            .tint(.white)
            .frame(width: 150)
            Spacer()
        }
        .frame(height: 40)
        .overlay {
            HStack {
                Spacer()
                Button {
                } label: {
                    Image(systemName: "airplayaudio")
                        .font(.title2)
                }
                .tint(.gray)
                .padding()
            }
        }
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
