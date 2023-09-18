This utility wraps the running of the tests in a simple go program. It will run
the set of tests against a single package.

Several values need to be coerced into a specific format in order to be tested
properly by the test suite.

There are two inputs, supplied as arguments on the command line:
```
Usage:
  -bundle-dir string
    	path of the bundle dir to test
  -spec-file string
    	path of the pipeline instructions file to be used
```

`bundle-dir` is the root path of the artifacts generated by the build system.
Most of the time, this will be `./bundles`.

`spec-file` is the spec file that was used to build the package that you want
to test.

Example: invocation:
```bash
go run ./cmd/run_tests --bundle-dir="$(pwd)/bundles" --spec-file=./moby-containerd.json
```