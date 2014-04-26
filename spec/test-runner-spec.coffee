TestRunner = require '../lib/test-runner'
SourceInfo = require '../lib/source-info'
ShellRunner = require '../lib/shell-runner'

describe "TestRunner", ->
  beforeEach ->
    spyOn(ShellRunner.prototype, 'initialize').andCallThrough()
    @testRunnerParams =
      write:             => null
      exit:              => null
      shellRunnerParams: => null
      setTestInfo:       => null
    spyOn(@testRunnerParams, 'shellRunnerParams')
    spyOn(@testRunnerParams, 'setTestInfo')
    spyOn(SourceInfo.prototype, 'activeFile').andReturn('fooTestFile')
    spyOn(SourceInfo.prototype, 'currentLine').andReturn(100)
    spyOn(SourceInfo.prototype, 'testFileCommand').andReturn('fooTestCommand {relative_path}')
    spyOn(SourceInfo.prototype, 'testSingleCommand').andReturn('fooTestCommand {relative_path}:{line_number}')

  describe "::run", ->
    it "Instantiates ShellRunner with expected params", ->

      runner = new TestRunner(@testRunnerParams)
      runner.run()

      expect(ShellRunner.prototype.initialize).toHaveBeenCalledWith(runner.shellRunnerParams())
      expect(@testRunnerParams.setTestInfo).toHaveBeenCalledWith("fooTestCommand fooTestFile")

    it "constructs a single-test command when testType is 'single'", ->
      @testRunnerParams.testType = "single"
      runner = new TestRunner(@testRunnerParams)
      runner.run()
      expect(@testRunnerParams.setTestInfo).toHaveBeenCalledWith("fooTestCommand fooTestFile:100")
