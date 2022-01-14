//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Student on 1/13/22.
//

import Foundation
class AssignmentList: ObservableObject {
    @Published var items = [AssignmentItem(course: "Pre Calc", description: "", dueDate: Date()),
                            AssignmentItem(course: "Mobile Apps Development", description: "", dueDate: Date()),
                            AssignmentItem(course: "U.S. History", description: "", dueDate: Date()),
                            AssignmentItem(course: "English RA", description: "", dueDate: Date()),
                            AssignmentItem(course: "Spanish", description: "", dueDate: Date()),
                            AssignmentItem(course: "Physics", description: "", dueDate: Date())]
}
