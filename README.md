
This sample application (and test target) reproduces an issue with UserDefaults where:
- removing objects doesn't have effect
- removing persistentDomain doesn't have effect

The outcome of this investigation is:
1. If you use the `UserDefaults(suiteName:)` make sure that:
a) the `suiteName` is in the reverse domain format.
b) you have the  `Host Applicaation` set

Otherwise you risk random test failures as in the sample app.

2. If you do unit tests without `Host Application`
a) you have to mock UserDefaults
