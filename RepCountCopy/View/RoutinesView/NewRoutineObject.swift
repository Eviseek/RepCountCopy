//
//  SelectedExercises.swift
//  RepCountCopy
//
//  Created by Eva Chlpikova on 21.10.2023.
//

import Foundation
import Combine

class NewRoutineObject: ObservableObject {
    
    @Published var existingRoutine: Routine? {
        didSet {
            if existingRoutine != nil {
                setUpExistingRoutine(routine: existingRoutine!)
            }
        }
    }
    
    @Published var selectedExercisesList: [Exercise]
    @Published var name: String = "Unnamed Routine"
    @Published var notes: String = ""
    
    @Published var exercisesSets: [ExerciseSet] = []
    
    init(routine: Routine?) { //TODO: delete routine and rewrite it everywhere
        
        selectedExercisesList = []
        
//        if routine != nil {
//            setUpExistingRoutine(routine: routine!)
//        }
        
    }
    
    private func setUpExistingRoutine(routine: Routine) {
        name = routine.name
        notes = routine.notes
        
        var foundExerciseSets: [ExerciseSet] {
            var foundex = ExerciseSet.MOCK_SETS.filter({ $0.routineId == routine.id })
            print("found: \(foundex)")
            return foundex
        }
        
        self.exercisesSets = foundExerciseSets
        
        var exerciseList: [Exercise] {
            var list: [Exercise] = []
            exercisesSets.forEach { item in
                var foundItem = Exercise.MOCK_EXERCISES.filter({ $0.id == item.exerciseId})
                print("found list: \(list)")
            }
            return list
        }
        selectedExercisesList = exerciseList
            
    }
    
    func appendExerciseToList(_ exercise: Exercise) {
        print("appending")
        selectedExercisesList.append(exercise)
        print("list is \(selectedExercisesList)")
    }
    
    func removeExerciseFromList(_ removalId: String) {
        
        var index = 0
        var removalIndex: Int? = nil
        
        selectedExercisesList.forEach { item in
            if item.id == removalId {
                removalIndex = index
            }
            index += 1
        }
        
        if let index = removalIndex {
            selectedExercisesList.remove(at: index)
        }
        
        //TODO: remove exerciseSets
        
    }
    
    func createExerciseSet(exerciseId: String, setCount: Int?) {
        var newSet = ExerciseSet(exerciseId: exerciseId, setCount: setCount ?? 0, weight: [], reps: [], notes: "")
        exercisesSets.append(newSet)
    }
    
    func saveNewRoutine() {
        
        let routineId = UUID().uuidString
        //TODO: assign routineId to sets
        
        print("routine is \(name) and \(selectedExercisesList)")
        //save to db
    }
    
    
}