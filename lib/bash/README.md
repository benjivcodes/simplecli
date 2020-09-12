1passwd-cli
===

This is meant to be a wrapper of sorts to the 1password Command Line tool, `op`. Most of this was written in the pre-1.0 release phase of `op` and has been continually updates as more features are added and better wasys of doing things are discovered.

Recent Improvements:

* Most functions that used name based lookup now require a vault specification to be used as the second argument; while both can be name based it's preferred, and faster, to use uuid. In testing the difference in using uuid vs names is `get item` time of 2.7s vs 0.75s.

ToDo:

* streamline the `op signin` process with support introduced in 1.6.0 release of `op`.