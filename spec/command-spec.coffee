Command = require '../lib/command'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Command", ->
  describe "testSingleCommand", ->
    it "returns the python-test.rspecSingleCommand config value for the rspec framework", ->
      atom.config.set("python-test.rspecSingleCommand", "rspec command")
      actualValue = Command.testSingleCommand("rspec")
      expect(actualValue).toBe("rspec command")

    it "returns undefined when given an unrecognized framework", ->
      actualValue = Command.testSingleCommand("unknown")
      expect(actualValue).toBe(undefined)

  describe "testFileCommand", ->
    it "returns the python-test.rspecFileCommand config value for the rspec framework", ->
      atom.config.set("python-test.rspecFileCommand", "rspec command")
      actualValue = Command.testFileCommand("rspec")
      expect(actualValue).toBe("rspec command")

    it "returns the python-test.minitestFileCommand config value for the minitest framework", ->
      atom.config.set("python-test.minitestFileCommand", "minitest command")
      actualValue = Command.testFileCommand("minitest")
      expect(actualValue).toBe("minitest command")

    it "returns the python-test.cucumberFileCommand config value for the cucumber framework", ->
      atom.config.set("python-test.cucumberFileCommand", "cucumber command")
      actualValue = Command.testFileCommand("cucumber")
      expect(actualValue).toBe("cucumber command")

    it "returns undefined when given an unrecognized framework", ->
      actualValue = Command.testFileCommand("unknown")
      expect(actualValue).toBe(undefined)

  describe "testAllCommand", ->
    it "returns the python-test.rspecAllCommand config value for the rspec framework", ->
      atom.config.set("python-test.rspecAllCommand", "rspec command")
      actualValue = Command.testAllCommand("rspec")
      expect(actualValue).toBe("rspec command")

    it "returns undefined when given an unrecognized framework", ->
      actualValue = Command.testAllCommand("unknown")
      expect(actualValue).toBe(undefined)
