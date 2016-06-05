//
//  atomic-types.swift
//  Atomics
//
//  Created by Guillaume Lessard on 31/05/2016.
//  Copyright © 2016 Guillaume Lessard. All rights reserved.
//

import clang_atomics

public struct AtomicUInt { var value: UInt = 0 }

public struct AtomicInt32 { var value: Int32 = 0 }
public struct AtomicUInt32 { var value: UInt32 = 0 }

public struct AtomicInt64 { var value: Int64 = 0 }
public struct AtomicUInt64 { var value: UInt64 = 0 }
