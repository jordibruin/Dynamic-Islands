//
//  PhoneViews.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct PhoneCompactLeading: View {
    var body: some View {
        Image(systemName: "phone.fill")
            .foregroundColor(.green)
    }
}

struct PhoneCompactLeading_Previews: PreviewProvider {
    static var previews: some View {
        PhoneCompactTrailing()
    }
}

struct PhoneCompactTrailing: View {
    var body: some View {
        Image(systemName: "phone.fill")
            .foregroundColor(.green)
    }
}

struct PhoneCompactTrailing_Previews: PreviewProvider {
    static var previews: some View {
        PhoneCompactTrailing()
    }
}

struct PhoneMinimal: View {
    var body: some View {
        Image(systemName: "phone.fill")
            .foregroundColor(.green)
    }
}


struct PhoneMinimal_Previews: PreviewProvider {
    static var previews: some View {
        PhoneMinimal()
    }
}

// MARK: LEADING
struct PhoneLeading: View {
    
    let caller: String
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(.cyan)
                .frame(width: 58, height: 58)
            
            VStack(alignment: .leading) {
                Text("iPhone")
                    .opacity(0.8)
                    .font(.caption)
                Text(caller)
                    .font(.body)
                    .fontWeight(.medium)
            }
            .fixedSize(horizontal: true, vertical: false)
            .foregroundColor(.white)
        }
//        .dynamicIsland(verticalPlacement: .belowIfTooWide)
    }
}

struct PhoneLeading_Previews: PreviewProvider {
    static var previews: some View {
        PhoneLeading(caller: "Jordi Bruin")
    }
}

// MARK: TRAILING

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

// MARK: BOTTOM

struct PhoneBottom: View {
    var body: some View {
        Text("")
//        ProgressView(value: 40, total: 100)
//            .tint(.red)
//            .progressViewStyle(.linear)
    }
}

struct PhoneBottom_Previews: PreviewProvider {
    static var previews: some View {
        PhoneBottom()
    }
}

// MARK: CENTER
struct PhoneCenter: View {
    var body: some View {
        Text("")
    }
}

struct PhoneCenter_Previews: PreviewProvider {
    static var previews: some View {
        PhoneCenter()
    }
}

struct PhoneLockScreen: View {
    let context: ActivityViewContext<PhoneAttributes>
    
    var body: some View {
        HStack {
            Text("Credit card")
            Text("This is the live activity")
        }
        .foregroundColor(.white)
        .activityBackgroundTint(.purple)
    }
}
