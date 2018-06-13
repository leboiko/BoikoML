//
//  Header.swift
//  BoikoML
//
//  Created by Luis Eduardo Boiko Ferreira on 13/06/2018.
//  Copyright © 2018 Luis Eduardo Boiko Ferreira. All rights reserved.
//

import Foundation

// This class holds the name (string) of the features associated with the keys in the DataFrame dictionary

public class Header {
    
    private var featureNames : [Int : String]
    private var nominalFeatureKeys : [Int]
    private var classIndex : Int
    
    init(featureNames : [Int : String], nominalFeatureKeys : [Int], classIndex : Int) {
        self.featureNames = featureNames
        self.nominalFeatureKeys = nominalFeatureKeys
        self.classIndex = classIndex
    }
    
    public func getNominalFeatureKeys() -> [Int]{
        return self.nominalFeatureKeys
    }
    
    public func getNominalFeatureNames() -> [String] {
        var names : [String] = []
        for key in self.nominalFeatureKeys {
            names.append(self.featureNameAtIndex(index: key))
        }
        return names
    }
    
    public func getClassIndex() -> Int {
        return self.classIndex
    }
    
    public func getClassName() -> String {
        return featureNameAtIndex(index: self.classIndex)
    }
    
    public func featureNameAtIndex(index : Int) -> String {
        return self.featureNames[index]!
    }
    
}
