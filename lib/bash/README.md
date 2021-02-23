BaSH Functions Libraries (BSFLs)
===

This directory contains the function libraries used to provide core functionality to SimpleCLI and/or enhance the user exerience as part of SimpleCLI.


* 1passwd-cli

  This is meant to be a wrapper of sorts to the 1password Command Line tool, `op`. Most of this was written in the pre-1.0 release phase of `op` and has been continually updates as more features are added and better wasys of doing things are discovered. There is an optional `cli update 1password` that will download and install the latest version of `op`. While `op update` is a thing, now, it does not handle installation. "Getting Started" documentation can be found **[here](https://support.1password.com/command-line-getting-started/)**.

* agnoster

  This is Erik Selberg's **[port](https://github.com/speedenator/agnoster-bash)** of the ZSH theme by the same name. This is a 4yo port of code that I have incldued because I used it at one time and continue to make improvements to when needed.

* Bashy

  This is code from Pablo Varela, **[here](https://github.com/pablopunk/bashy)**. Bash is by far faster than its included counterparts, agnoster and trueline; this is because it has far fewer features and dependencies than those two. Included here for the same reasons as agnoster.

* common

  This is the core BSFL used by SimpleCLI. Here you will find most functions that are not part of the `cli <command>` structure. Per the SimpleCLI Installer, this should be sourced as part of your BaSH configuration (i.e, `.bashrc`, `.profile` or `.bash_profile`). Most of SimpleCLI will not function without this library.

* trueline

  This is code from Pedro Ferarri, **[here](https://github.com/petobens/trueline)**. While much newer than agnoster, the intent is much the same and is included here for the same reasons.


Recent Improvements:

* Global

  * Changes based on linter output as well as best practices and standards. This includes changes to function, readability, format, and comments.

* 1passwwd-cli

  * Most functions that used name based lookup now require a vault specification to be used as the second argument; while both can be name based it's preferred, and faster, to use uuid. In testing the difference in using uuid vs names is `get item` time of 2.7s vs 0.75s.

