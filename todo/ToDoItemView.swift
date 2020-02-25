
//
//  ToDoItemView.swift
//  todo
//
//  Created by Kelven Irvine Borges Galvão on 25/02/20.
//  Copyright © 2020 Kelven Irvine Borges Galvão. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    var title:String = ""
    var createdAt:String = ""
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title).font(.headline)
                Text(createdAt).font(.caption)
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView()
    }
}
