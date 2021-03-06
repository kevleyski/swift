// RUN: %target-run-simple-swift
// REQUIRES: executable_test
// REQUIRES: objc_interop

// UNSUPPORTED: OS=watchos
// UNSUPPORTED: OS=tvos

import Intents
import StdlibUnittest

let IntentsTestSuite = TestSuite("Intents")

if #available(OSX 10.12, iOS 10.0, *) {

  IntentsTestSuite.test("ErrorDomain") {
    expectEqual("IntentsErrorDomain", INIntentErrorDomain)
  }

  IntentsTestSuite.test("extension") {
    expectEqual("IntentsErrorDomain", INIntentError._nsErrorDomain)
  }
}

#if os(iOS)
if #available(iOS 11.0, *) {

  IntentsTestSuite.test("INParameter KeyPath") {
    let param = INParameter(keyPath: \INRequestRideIntent.pickupLocation)
    expectEqual("pickupLocation", param?.parameterKeyPath)
    if let typ = param?.parameterClass {
      expectEqual(INRequestRideIntent.self, typ)
    }
    else {
      expectUnreachable()
    }
  }
}

#endif

runAllTests()
