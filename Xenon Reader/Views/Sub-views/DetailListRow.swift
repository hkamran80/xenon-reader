//
//  DetailListRow.swift
//  Xenon Reader
//
//  Created by H. Kamran on 3/11/21.
//

import SwiftUI

struct DetailListRow: View {
    let name: String
    let detail: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(detail)
                .font(.headline)
                .bold()

            Text(name)
                .font(.subheadline)
        }
    }
}

#if DEBUG
struct DetailListRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailListRow(name: "Example", detail: "Example Detail")
    }
}
#endif
