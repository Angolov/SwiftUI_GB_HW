//
//  Friend.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 02.08.2022.
//

import Foundation

struct FriendModel: Identifiable {
    let id = UUID()
    let firstName: String
    let familyName: String
    let imageUrlString: String
    
    var fullName: String {
        firstName + " " + familyName
    }
}

struct FriendsInSections: Identifiable {
    let id = UUID()
    let sectionChar: String
    let friends: [FriendModel]
}

struct FriendViewModel: Identifiable {
    let id = UUID()
    let myFriends: [FriendsInSections]
    
    init() {
        myFriends = [
            FriendsInSections(sectionChar: "А", friends: [
                FriendModel(firstName: "Анастасия", familyName: "Аверина", imageUrlString: ""),
                FriendModel(firstName: "Виталий", familyName: "Артемов", imageUrlString: "")
            ]),
            FriendsInSections(sectionChar: "И", friends: [
                FriendModel(firstName: "Артем", familyName: "Иванов", imageUrlString: ""),
                FriendModel(firstName: "Виктор", familyName: "Иванов", imageUrlString: ""),
                FriendModel(firstName: "Иван", familyName: "Иванов", imageUrlString: ""),
                FriendModel(firstName: "Сергей", familyName: "Исаев", imageUrlString: "")
            ]),
            FriendsInSections(sectionChar: "П", friends: [
                FriendModel(firstName: "Аркадий", familyName: "Павлов", imageUrlString: ""),
                FriendModel(firstName: "Виктор", familyName: "Петров", imageUrlString: ""),
                FriendModel(firstName: "Екатерина", familyName: "Петрова", imageUrlString: "")
            ]),
            FriendsInSections(sectionChar: "С", friends: [
                FriendModel(firstName: "Валентина", familyName: "Сидорова", imageUrlString: "")
            ])
        ]
    }
}
