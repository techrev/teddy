const log = require('../logger').create('launcher')

/**
 * Kill browser if it does not capture in given `captureTimeout`.
 */
function CaptureTimeoutLauncher (timer, captureTimeout) {
  if (!captureTimeout) {
    return
  }

  let pendingTimeoutId = null
  log.debug(`In karma/lib/launchers/capture_timeout line 12, this is of type ${typeof this}`)

  this.on('start', () => {
    pendingTimeoutId = timer.setTimeout(() => {
      pendingTimeoutId = null
      log.debug(`In karma/lib/launchers/capture_timeout line 17, this.state is ${this.state} and this.STATE_BEING_CAPTURED is ${this.STATE_BEING_CAPTURED}`)
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
  return function (launcher) {
    CaptureTimeoutLauncher.call(launcher, timer, captureTimeout)
  }
}

CaptureTimeoutLauncher.decoratorFactory.$inject = ['timer', 'config.captureTimeout']

module.exports = CaptureTimeoutLauncher
