//
//  NewRoutineView.swift
//  RepCountCopy
//
//  Created by Eva Chlpikova on 08.10.2023.
//

import SwiftUI
import Foundation

struct NewRoutineView: View {
    
    @State private var isExerciseListPresented = false
    
    @EnvironmentObject var newRoutineObject: NewRoutineObject
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Button {
                    //start this workout
                } label: {
                    Text("Start this Workout")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(.white)
                .cornerRadius(5)
                .padding(.bottom, 30)
                
                VStack(spacing: 0) {
                    
                    TextField("Name", text: $newRoutineObject.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background(.white)
                    
                    Divider()
                    
                    Button {
                        //choose targets
                    } label: {
                        HStack {
                            Text("Targets")
                                .foregroundColor(.black)
                            Spacer()
                            Text("Latest")
                                .foregroundColor(.black)
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(.systemGray3))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 10)
                    .background(.white)
                    
                    Divider()
                    
                    Button {
                        //add note
                    } label: {
                        HStack {
                            Text("Notes")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(Color(.systemGray3))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 10)
                    .background(.white)
                }
                .cornerRadius(5)
                
                // Exercises
                VStack(spacing: 0) {
                    if newRoutineObject.selectedExercisesList.count > 0 {
                        ForEach(newRoutineObject.selectedExercisesList, id: \.id) { exercise in
                            NewRoutineExerciseItem(exercise: exercise)
                                .environmentObject(newRoutineObject)
                            Divider()
                        }
                    }
                }
                .cornerRadius(5)
                .padding(.top, 30)
                
                Button {
                    isExerciseListPresented = true
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 10)
                            .background(.white)
                            .foregroundColor(.white)
                            .tint(.pink)
                            .cornerRadius(5)
                        Text("Add Exercise")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10)
                    }
                }
                .padding(.top, 30)
                .sheet(isPresented: $isExerciseListPresented, content: {
                    ExerciseCategoriesView()
                        .environmentObject(newRoutineObject)
                })
                
                if newRoutineObject.selectedExercisesList.count > 0 {
                    Button {
                        newRoutineObject.saveNewRoutine()
                        dismiss()
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 15)
                                .padding(.horizontal, 10)
                                .background(.white)
                                .foregroundColor(.white)
                                .tint(.pink)
                                .cornerRadius(5)
                            Text("Save new routine")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 10)
                        }
                    }
                }
                
            }
            .toolbar {
                if newRoutineObject.selectedExercisesList.count > 0 {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            newRoutineObject.saveNewRoutine()
                            dismiss()
                        } label: {
                            Text("Save")
                        }
                    }
                }
            }
            .navigationTitle(newRoutineObject.name)
            .padding(.horizontal, 10)
        }
        .toolbar(.hidden, for: .tabBar)
        .background(Color(.systemGray6))
    }
}

struct NewRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        NewRoutineView()
            .environmentObject(NewRoutineObject(routine: nil))
    }
}
