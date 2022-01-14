//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Student on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems =
        [AssignmentItem(course: "Pre Calc", description: "", dueDate: Date()),
         AssignmentItem(course: "Mobile Apps Development", description: "", dueDate: Date()),
         AssignmentItem(course: "U.S. History", description: "", dueDate: Date()),
         AssignmentItem(course: "English RA", description: "", dueDate: Date()),
         AssignmentItem(course: "Spanish", description: "", dueDate: Date()),
         AssignmentItem(course: "Physics", description: "", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItems) { item in
                    Text(item.description)
                }
                .onMove(perform: {indices, newOffset in assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentItems.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
