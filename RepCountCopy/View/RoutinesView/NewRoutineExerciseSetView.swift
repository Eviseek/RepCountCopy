//
//  NewRoutineExerciseSetView.swift
//  RepCountCopy
//
//  Created by Eva Chlpikova on 21.10.2023.
//

import SwiftUI

struct NewRoutineExerciseSetView: View {
    
    var setCount: Int
    
    @State private var inputSetCount: String = ""
    @EnvironmentObject var newRoutineObject: RoutineObservableObject
    @Environment(\.dismiss) private var dismiss
    
    var exercise: Exercise
    
    var body: some View {
        VStack {
            HStack {
                Text("Sets")
                    .foregroundColor(.black)
                Spacer()
                TextField(setCount.description, text: $inputSetCount)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            .background(.white)
            .cornerRadius(5)
            
            Button {
                newRoutineObject.updateExerciseSetArray(exerciseId: exercise.id, setCount: Int(inputSetCount) ?? 1)
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
                    Text("Save")
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                }
            }
            .frame(maxHeight: 40)
            
            Button {
                dismiss()
                newRoutineObject.removeExerciseFromList(exercise.id)
                
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
                    Text("Delete")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                }
            }
            .frame(maxHeight: 40)
            .padding(.top, 20)

            Spacer()
            
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGray6))
    }
}

struct NewRoutineExerciseSetView_Previews: PreviewProvider {
    static var previews: some View {
        NewRoutineExerciseSetView(setCount: 1, exercise: Exercise.MOCK_EXERCISES[0])
    }
}
