'use strict'

const http = require('http')

const constant = require('./constants')
const helper = require('./helper')
const cfg = require('./config')
const logger = require('./logger')
const log = logger.create('runner')

function parseExitCode (buffer, defaultExitCode, failOnEmptyTestSuite) {
  const tailPos = buffer.length - Buffer.byteLength(constant.EXIT_CODE) - 2

  if (tailPos < 0) {
    return { exitCode: defaultExitCode, buffer }
  }

  const tail = buffer.slice(tailPos)
  const tailStr = tail.toString()
  if (tailStr.substr(0, tailStr.length - 2) === constant.EXIT_CODE) {
    const emptyInt = parseInt(tailStr.substr(-2, 1), 10)
    let exitCode = parseInt(tailStr.substr(-1), 10)
    if (failOnEmptyTestSuite === false && emptyInt === 0) {
      log.warn('Test suite was empty.')
      exitCode = 0
    }
    return { exitCode, buffer: buffer.slice(0, tailPos) }
  }

  return { exitCode: defaultExitCode, buffer }
}

// TODO(vojta): read config file (port, host, urlRoot)
function run (config, done) {
  config = config || {}
  let util = require('util')
  logger.setupFromConfig(config)
  log.debug(`In karma/lib/runner.js line 38 config passed in to run function is ${util.inspect(config, { depth: null })}`)
  done = helper.isFunction(done) ? done : process.exit
  config = cfg.parseConfig(config.configFile, config)

  let exitCode = 1
  const options = {
    hostname: config.hostname,
    path: config.urlRoot + 'run',
    port: config.port,
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    }
  }
  log.debug(`In karma/lib/runner.js line 52 options passed in to http.request function are ${util.inspect(options, { depth: null })}`)
  const request = http.request(options, function (response) {
    log.debug(`In karma/lib/runner.js line 54 response received in http.request callback is ${util.inspect(response, { depth: null })}`)
    response.on('data', function (buffer) {
      const parsedResult = parseExitCode(buffer, exitCode, config.failOnEmptyTestSuite)
      exitCode = parsedResult.exitCode
      process.stdout.write(parsedResult.buffer)
    })

    response.on('end', () => done(exitCode))
  })

  request.on('error', function (e) {
    if (e.code === 'ECONNREFUSED') {
      log.error('There is no server listening on port %d', options.port)
      done(1, e.code)
    } else {
      throw e
    }
  })

  request.end(JSON.stringify({
    args: config.clientArgs,
    removedFiles: config.removedFiles,
    changedFiles: config.changedFiles,
    addedFiles: config.addedFiles,
    refresh: config.refresh,
    colors: config.colors
  }))
}

exports.run = run
