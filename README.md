This sample application (and test target) reproduces an issue with UserDefaults where:

* removing objects doesn't have effect
* removing persistentDomain doesn't have effect

The outcome of this investigation are the following rules:

1. If you use the `UserDefaults(suiteName:)` make sure that   
   * the `suiteName` is in the reverse domain format
   * you have the  `Host Applicaation` set

2. If you do unit tests without `Host Application`   
   * you have to mock UserDefaults
