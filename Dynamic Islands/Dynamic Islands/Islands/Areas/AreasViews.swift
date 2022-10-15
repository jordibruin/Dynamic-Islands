//
//  AreasViews.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import SwiftUI
import ActivityKit
import WidgetKit

// MARK: - Leading

struct AreasCompactLeading: View {
    var body: some View {
        ZStack {
            Color.blue
            Text("Leading")
        }
        // Smaller area with width modifier
//        .frame(width: 24)
    }
}

struct AreasLeading: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Color.blue
            Text("Leading")
        }
        .frame(width: 175, height: 60)
        // If you want your view to reach the side of the dynamic island you can use a negative padding
//        .padding(-20)
    }
}

// MARK: - Trailing

struct AreasTrailing: View {
    var body: some View {
        ZStack(alignment: .trailing) {
            Color.green
            Text("Trailing")
        }
        .frame(width: 175, height: 60)
        // If you want your view to reach the side of the dynamic island you can use a negative padding
//        .padding(-20)
    }
}

struct AreasCompactTrailing: View {
    var body: some View {
        ZStack {
            Color.green
            Text("Trailing")
        }
    }
}

// MARK: - Minimal

struct AreasMinimal: View {
    var body: some View {
        ZStack {
            Color.orange
            Text("Min")
        }
    }
}

// MARK: - Center

struct AreasCenter: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.red)
                .frame(width: 100, height: 28)
            Text("Center")
        }
    }
}

// MARK: - Bottom

struct AreasBottom: View {
    var body: some View {
        ZStack {
            Color.purple
            Text("Bottom")
        }
        .frame(width: 350, height: 60)
    }
}

// MARK: - Lock screen live activity

struct AreasLockScreen: View {
    let context: ActivityViewContext<AreasAttributes>
    
    var body: some View {
        VStack {
            HStack {
                AreasLeading()
                Spacer()
                AreasTrailing()
            }
            .overlay {
                AreasCenter()
            }
            AreasBottom()
        }
    }
}
