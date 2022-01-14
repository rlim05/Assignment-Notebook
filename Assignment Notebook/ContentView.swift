//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Student on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignmentView = false
    var body: some View {
        NavigationView {
            List {
                Text("Restart App if You Can't Edit")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                ForEach(assignmentList.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.course)
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                            Text(item.description)
                                .fontWeight(.light)
                                .foregroundColor(.orange)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                    }
                }
                .onMove(perform: {indices, newOffset in assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentList.items.remove(atOffsets: indexSet)
                })
            }
            .sheet(isPresented: $showingAddAssignmentView, content: {
                AddAssignmentView(assignmentList: assignmentList)
            })
            .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                                                    showingAddAssignmentView = true}) {
                                    Image(systemName: "plus")
                                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
