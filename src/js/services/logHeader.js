'use strict';
angular.module('copayApp.services')
  .factory('logHeader', function($log, isCordova, nodeWebkit) {
    $log.info('Starting MCM v' + window.version + ' #' + window.commitHash);
    $log.info('Client: isCordova:', isCordova, 'isNodeWebkit:', nodeWebkit.isDefined());
    $log.info('Navigator:', navigator.userAgent);
    return {};
  });
