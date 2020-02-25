//
//  ContentView.swift
//  todo
//
//  Created by Kelven Irvine Borges Galvão on 25/02/20.
//  Copyright © 2020 Kelven Irvine Borges Galvão. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems:FetchedResults<ToDoItem>
    
    @State private var newTodoItem = ""
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Whats next")) {
                    HStack{
                        TextField("New Item", text: self.$newTodoItem)
                        Button(action: {
                            let toDoitem = ToDoItem(context: self.managedObjectContext)
                            
                            toDoitem.title = self.newTodoItem
                            toDoitem.createdAt = Date()
                            
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                print(error)
                            }
                            
                            self.newTodoItem = ""
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section(header: Text("To dos")) {
                    ForEach(self.toDoItems) {
                        toDoItem in ToDoItemView(title: toDoItem.title!, createdAt: "\(toDoItem.createdAt!)")
                    }.onDelete {
                        indexSet in let deleteItem = self.toDoItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("My list"))
            .navigationBarItems(trailing: EditButton())
        }
        
   
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
