//
//  AreasViews.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct AreasCompactLeading: View {
    var body: some View {
        ZStack {
            Color.blue
            Text("Leading")
        }
        
        // Smaller area with width modifier
//        ZStack {
//            Color.blue
//            Text("Leading")
//        }
//        .frame(width: 24)
    }
}

struct AreasCompactLeading_Previews: PreviewProvider {
    static var previews: some View {
        AreasCompactTrailing()
    }
}

struct AreasCompactTrailing: View {
    var body: some View {
        Text("Trailing")
    }
}

struct AreasCompactTrailing_Previews: PreviewProvider {
    static var previews: some View {
        AreasCompactTrailing()
    }
}

struct AreasMinimal: View {
    var body: some View {
        Image(systemName: "alert")
            .foregroundColor(.green)
            .font(.title2)
    }
}

struct AreasMinimal_Previews: PreviewProvider {
    static var previews: some View {
        AreasMinimal()
    }
}

//MARK: LEADING
struct AreasLeading: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
//            .edgesIgnoringSafeArea(.all)
            .frame(width: 200, height: 100)
            .foregroundColor(.blue)
        
            // If you want your view to reach the side of the dynamic island you can use a negative padding
            .padding(-20)
        
//        Circle()
//            .edgesIgnoringSafeArea(.all)
//            .frame(width: 200, height: 200)
//            .foregroundColor(.purple)
//
//            // If you want your view to reach the side of the dynamic island you can use a negative padding
//            .padding(-20)
    }
}

struct AreasLeading_Previews: PreviewProvider {
    static var previews: some View {
        AreasLeading()
    }
}


//MARK: TRAILING

struct AreasTrailing: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
//            .edgesIgnoringSafeArea(.all)
            .frame(width: 200, height: 100)
            .foregroundColor(.green)
        
            // If you want your view to reach the side of the dynamic island you can use a negative padding
            .padding(-20)
    }
}

struct AreasTrailing_Previews: PreviewProvider {
    static var previews: some View {
        AreasTrailing()
    }
}

//MARK: CENTER
struct AreasCenter: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .edgesIgnoringSafeArea(.all)
            .frame(width: 200, height: 40)
            .foregroundColor(.red)
            .overlay(
                    Text("Center")
            )
    }
}

struct AreasCenter_Previews: PreviewProvider {
    static var previews: some View {
        AreasCenter()
    }
}

//MARK: BOTTOM
struct AreasBottom: View {
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20)
            .edgesIgnoringSafeArea(.all)
            .frame(width: 300, height: 80)
            .foregroundColor(.purple)
            .overlay(
                    Text("Bottom")
            )
    }
}

struct AreasBottom_Previews: PreviewProvider {
    static var previews: some View {
        AreasBottom()
    }
}



struct AreasLockScreen: View {
    let context: ActivityViewContext<AreasAttributes>
    
    var body: some View {
        Text("This is the live activity")
    }
}


