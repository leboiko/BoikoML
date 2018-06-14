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
    
    private var features : [Feature]
    private var metaAttributeIndex : Int
    
    public init(features : [Feature], metaAttributeIndex : Int) {
        self.features = features
        self.metaAttributeIndex = metaAttributeIndex
    }
    
    
    public func getMetaAttributeIndex() -> Int {
        return self.metaAttributeIndex
    }
    
    public func getMetaAttributeName() -> String {
        return featureNameAtIndex(index: self.metaAttributeIndex)
    }
    
    public func featureNameAtIndex(index : Int) -> String {
        var featureName : String = ""
        for feature in self.features {
            if feature.getIndex() == index {
                featureName = feature.getName()
            }
        }
        
        return featureName
    }
    
}
