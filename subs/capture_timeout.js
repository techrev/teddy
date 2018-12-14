const log = require('../logger').create('launcher')

/**
 * Kill browser if it does not capture in given `captureTimeout`.
 */
function CaptureTimeoutLauncher (timer, captureTimeout) {
  if (!captureTimeout) {
    return
  }

  let pendingTimeoutId = null

  this.on('start', () => {
    pendingTimeoutId = timer.setTimeout(() => {
      pendingTimeoutId = null
      if (this.state !== this.STATE_BEING_CAPTURED) {
        return
      }

      log.warn(`${this.name} have not captured in ${captureTimeout} ms, killing.`)
      this.error = 'timeout'
      this.kill()
    }, captureTimeout)
  })

  this.on('done', () => {
    if (pendingTimeoutId) {
      timer.clearTimeout(pendingTimeoutId)
      pendingTimeoutId = null
    }
  })
}

CaptureTimeoutLauncher.decoratorFactory = function (timer,
  /* config.captureTimeout */ captureTimeout) {
  log.debug('Called CaptureTimeoutLauncher.decoratorFactory')
  log.debug(new Error().stack)
  return function (launcher) {
    log.debug(`Called CaptureTimeoutLauncher.decoratorFactory return function with ${launcher}, ${timer}, and ${captureTimeout}`)
    log.debug(new Error().stack)
    CaptureTimeoutLauncher.call(launcher, timer, captureTimeout)
  }
}

CaptureTimeoutLauncher.decoratorFactory.$inject = ['timer', 'config.captureTimeout']

module.exports = CaptureTimeoutLauncher
