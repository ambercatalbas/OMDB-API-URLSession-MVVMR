//
//  Callbacks.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 29.10.2023.
//

import UIKit

public typealias VoidClosure = (() -> Void)
public typealias IntClosure = ((Int) -> Void)
public typealias BoolClosure = ((Bool) -> Void)
public typealias StringClosure = ((String) -> Void)
public typealias IndexPathClosure = ((IndexPath) -> Void)
public typealias UIImageClosure = ((UIImage) -> Void)
public typealias DateRangeClosure = (([Date]) -> Void)
typealias SearchTypeClosure = ((SearchType) -> Void)
typealias SearchCallback = ((SearchResponse) -> ())?
typealias ErrorCallback = ((Error?) -> ())?
