//
//  AreasViews.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import SwiftUI

struct AreasCompactLeading: View {
    var body: some View {
        Text("Leading")
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
        Text("Leading")
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
        Text("Trailing")
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
        Text("Center")
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
        Text("Bottom")
    }
}

struct AreasBottom_Previews: PreviewProvider {
    static var previews: some View {
        AreasBottom()
    }
}
