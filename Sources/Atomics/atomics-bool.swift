//
//  atomics-bool.swift
//  Atomics
//
//  Created by Guillaume Lessard on 10/06/2016.
//  Copyright © 2016 Guillaume Lessard. All rights reserved.
//

import ClangAtomics

public struct AtomicBool
{
  @_versioned var val = ClangAtomicsBoolean()

  public init(_ value: Bool = false)
  {
    ClangAtomicsBooleanInit(value, &val)
  }

  public var value: Bool {
    @inline(__always)
    mutating get { return ClangAtomicsBooleanLoad(&val, .relaxed) }
  }
}

extension AtomicBool
{
  @inline(__always)
  public mutating func load(order: LoadMemoryOrder = .relaxed)-> Bool
  {
    return ClangAtomicsBooleanLoad(&val, order)
  }

  @inline(__always)
  public mutating func store(_ value: Bool, order: StoreMemoryOrder = .relaxed)
  {
    ClangAtomicsBooleanStore(value, &val, order)
  }

  @inline(__always) @discardableResult
  public mutating func swap(_ value: Bool, order: MemoryOrder = .relaxed)-> Bool
  {
    return ClangAtomicsBooleanSwap(value, &val, order)
  }

  @inline(__always) @discardableResult
  public mutating func or(_ value: Bool, order: MemoryOrder = .relaxed)-> Bool
  {
    return ClangAtomicsBooleanOr(value, &val, order)
  }

  @inline(__always) @discardableResult
  public mutating func xor(_ value: Bool, order: MemoryOrder = .relaxed)-> Bool
  {
    return ClangAtomicsBooleanXor(value, &val, order)
  }

  @inline(__always) @discardableResult
  public mutating func and(_ value: Bool, order: MemoryOrder = .relaxed)-> Bool
  {
    return ClangAtomicsBooleanAnd(value, &val, order)
  }

  @inline(__always) @discardableResult
  public mutating func loadCAS(current: UnsafeMutablePointer<Bool>, future: Bool,
                               type: CASType = .weak,
                               orderSwap: MemoryOrder = .relaxed,
                               orderLoad: LoadMemoryOrder = .relaxed) -> Bool
  {
    switch type {
    case .strong:
      return ClangAtomicsBooleanStrongCAS(current, future, &val, orderSwap, orderLoad)
    case .weak:
      return ClangAtomicsBooleanWeakCAS(current, future, &val, orderSwap, orderLoad)
    }
  }

  @inline(__always) @discardableResult
  public mutating func CAS(current: Bool, future: Bool,
                           type: CASType = .weak,
                           order: MemoryOrder = .relaxed) -> Bool
  {
    var expect = current
    return loadCAS(current: &expect, future: future, type: type, orderSwap: order, orderLoad: .relaxed)
  }
}
