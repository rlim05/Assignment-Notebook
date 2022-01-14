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
         AssignmentItem(course: "Physics", description: "", dueDate: Date()),
         AssignmentItem(course: "Englsh RA", description: "", dueDate: Date()),
         AssignmentItem(course: "Mobile Apps Development", description: "", dueDate: Date())]
    var body: some View {
        Text("Hello, world!")
            .padding()
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
