//
//  Egg.swift
//  Tamagotchi
//
//  Created by James Hughes, Benjamin on 07/11/2017.
//  Copyright © 2017 Tammo Team. All rights reserved.
//

import Foundation

class Egg {
    
    var size: Int
    var age: Int
    var temp: Int
    var cracked: Bool /* Why are these here, what do they do */
    var wearingHat = false

    
    init(size: Int, age: Int, temp: Int, cracked: Bool) {
        self.size = size;
        self.age = age;
        self.temp = temp;
        self.cracked = cracked;
    }
    
    func isEggCracked() -> Bool {
        return cracked
    }
    
    func crackEgg() -> Bool {
        cracked = true
        return cracked
    }
 
    //    Temporary methods for playing for interface; will be deleted
    func crackEggManual(){
        cracked = true
    }
    func healEggManual(){
        cracked = false
    }
//    Temporary methods etc etc
    
    func updateTemp(item: String) -> Int {
        if item == "Hat" {
            temp += 1
            return 1
        }
        else if item == "Hot Water Bottle" {
            temp += 2
            return 2
        }
        else if item == "Fan" {
            temp -= 1
            return -1
        }
        else if item == "Cold Lemonade" {
            temp -= 2
            return -2
        } else {
            return temp
        }
    }
    
    func increaseAge(day: String) -> Int {
        if day == "Next" {
            age += 1
            return 1
        } else {
            return age
        }
    }
    
    func updateSize(day: String) -> Int {
        if day == "Next" {
            size += 1
            return 1
        } else {
            return size
        }
    }
    
    func helpEgg(item: String) -> String {
        let result = self.updateTemp(item: item)
        if result > 0 {
            return "\(item) warmed up egg by \(result) degree"
        } else if result < 0 {
            return "\(item) cooled egg by \(result) degree"
        } else {
            return ""
        }
    }
    
    
    func hatchEgg(temp: Int, age: Int) -> String {
        if temp >= 15 && age >= 5 {
            _ = crackEgg()
            return "The egg has cracked"
        } else {
            return "Turn up the temperature and be patient"
        }
    }
   
    func grow() {
        _ = increaseAge(day: "Next")
        _ = updateSize(day: "Next")
    }
    
    func die(temp: Int, age: Int) -> String {
        if temp < 10 && age > 3 {
            return "Egg has caught hypothermia and died"
    } else if temp > 30 && age > 3 {
            return "Egg has overheated and died"
        } else {
         return ""
        }
    }
}




