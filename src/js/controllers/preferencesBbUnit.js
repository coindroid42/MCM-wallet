'use strict';

angular.module('copayApp.controllers').controller('preferencesBbUnitController',
  function($rootScope, $scope, $log, configService, go, $deepStateRedirect) {
    var config = configService.getSync();
    this.bbUnitName = config.wallet.settings.bbUnitName;
    this.unitOpts = [
      // TODO : add Satoshis to bitcore-wallet-client formatAmount()
      // {
      //     name: 'Satoshis (100,000,000 satoshis = 1BTC)',
      //     shortName: 'SAT',
      //     value: 1,
      //     decimals: 0,
      //     code: 'sat',
      //   }, 
      /*{
        name: 'bits (1,000,000 bits = 1BTC)',
        shortName: 'bits',
        value: 100,
        decimals: 2,
        code: 'bit',
      }*/
      // TODO : add mBTC to bitcore-wallet-client formatAmount()
      // ,{
      //   name: 'mBTC (1,000 mBTC = 1BTC)',
      //   shortName: 'mBTC',
      //   value: 100000,
      //   decimals: 5,
      //   code: 'mbtc',
      // }
      /*, {
        name: 'BTC',
        shortName: 'BTC',
        value: 100000000,
        decimals: 8,
        code: 'btc',
      }
      , */{
        name: 'titan',
        shortName: 'titan',
        value: 1,
        decimals: 0,
        code: 'one'
      }
      , {
        name: 'kBlackBytes (1,000 titan)',
        shortName: 'kBB',
        value: 1000,
        decimals: 3,
        code: 'kilo'
      }
      , {
        name: 'MBlackBytes (1,000,000 titan)',
        shortName: 'MBB',
        value: 1000000,
        decimals: 6,
        code: 'mega'
      }
      , {
        name: 'GBlackBytes (1,000,000,000 titan)',
        shortName: 'GBB',
        value: 1000000000,
        decimals: 9,
        code: 'giga'
      }
    ];

    this.save = function(newUnit) {
      var opts = {
        wallet: {
          settings: {
            bbUnitName: newUnit.shortName,
            bbUnitValue: newUnit.value,
	          bbUnitDecimals: newUnit.decimals,
            bbUnitCode: newUnit.code
          }
        }
      };
      this.unitName = newUnit.shortName;

      configService.set(opts, function(err) {
        if (err) $log.warn(err);
        $scope.$emit('Local/UnitSettingUpdated');
        if ($rootScope.tab === 'send') {
          $deepStateRedirect.reset('walletHome');
          go.path('walletHome', function() {
            $rootScope.$emit('Local/SetTab', 'send');
          });
        }
        else {
          go.preferencesGlobal();
        }
      });

    };
    
    go.onBackButton = function(){
        console.log('units backbutton');
    };
    //console.log('topbar: '+$scope.topbar);
  });
