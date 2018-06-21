//
//  Header.swift
//  BoikoML
//
//  Created by Luis Eduardo Boiko Ferreira on 13/06/2018.
//  Copyright © 2018 Luis Eduardo Boiko Ferreira. All rights reserved.
//

import Foundation

// This class holds the name (string) of the features associated with the keys in the DataFrame dictionary

public class Header<T> : CustomStringConvertible {

    private var features : [Feature<Any>]
//    private var metaAttributeIndex : Int
    
    public init(features : [Feature<Any>]) {
        self.features = features
//        self.metaAttributeIndex = metaAttributeIndex
    }
    
    public var description: String {
        var featuresList : String = ""
        for i in 0..<self.features.count {
            if featuresList != "" {
               featuresList = featuresList + ", " + self.featureNameAtIndex(index: i)
            } else {
                featuresList = self.featureNameAtIndex(index: i)
            }
        }
        return featuresList
    }
    
//    public func getMetaAttributeIndex() -> Int {
//        return self.metaAttributeIndex
//    }
//
//    public func getMetaAttributeName() -> String {
//        return featureNameAtIndex(index: self.metaAttributeIndex)
//    }
    
    public func featureNameAtIndex(index : Int) -> String {
        var featureName : String = ""
        for feature in self.features {
            if feature.getIndex() == index {
                featureName = feature.getName()
            }
        }
        
        return featureName
    }
    
    public func header() -> [Feature<Any>] {
        return self.features
    }
    
    // This function expect a dictionary with the feature name as the key and the possible values as a generic array
    public func setNominalFeatures(features : [String : [T]]) {
        for nominalFeature in features.keys {
            for feature in self.features {
                if feature.getName() == nominalFeature {
                    feature.setPossibleValues(values: features[nominalFeature]!)
                    feature.setDType(dType: .nominal)
                }
            }
        }
    }
    
}
