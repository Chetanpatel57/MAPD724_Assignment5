//
//  Constant.swift
//  MyRecipeHub
//  Group #12
//  Nirav Goswami (301252385)
//  Samir Patel (301286671)
//  Esha Naik (301297804)
//  Chetankumar Patel(301294334)
//
import Foundation


public enum Constants : String {
    case appshareurl = "http://itunes.apple.com/"
    case aboutusText = "aboutusText"
    
    func localizedString() -> String {
            return NSLocalizedString(self.rawValue, comment: "")
        }
        
        static func getTitleFor(title: Constants) -> String {
            return title.localizedString()
        }
}

