const copyFromWindow = require('copyFromWindow');
const setInWindow = require('setInWindow');
const createArgumentsQueue = require('createArgumentsQueue');
const getType = require('getType');
const Object = require('Object');
const logToConsole = require('logToConsole');
const makeTableMap = require('makeTableMap');
const getContainerVersion = require('getContainerVersion');
const injectScript = require('injectScript');

/*==============================================================================
==============================================================================*/

const namespace = 'gtag';
const dataLayerName = data.dataLayerArrayName || 'dataLayer';
const gtagInjectedByGTMTemplate = '_gtag_injected_by_gtm_template';

/*==============================================================================
==============================================================================*/

/**
 * Only logs to console, if:
 * - preview mode, always
 * or
 * - production, if the checkbox data.enableLog is checked.
 */
const log = (messagePrefix, data) => {
  const isInPreviewOrDebugMode =
    getContainerVersion().previewMode || getContainerVersion().debugMode;
  if (data.enableLog || isInPreviewOrDebugMode) {
    logToConsole('[Improved Google Ads Conversion Tag using gtag] - ' + messagePrefix, data);
  }
};

const mergeObj = (obj, obj2) => {
  for (let key in obj2) {
    if (obj2.hasOwnProperty(key)) {
      obj[key] = obj2[key];
    }
  }
  return obj;
};

const mergeSettings = (fromVar, tableKey) => {
  const defaults = getType(data[fromVar]) === 'object' ? data[fromVar] : {};
  const overrides =
    data[tableKey] && data[tableKey].length ? makeTableMap(data[tableKey], 'name', 'value') : {};
  return mergeObj(defaults, overrides);
};

const createSendToArray = (idAndLabelObjArray) => {
  const isConversionIdValid = (id) => {
    return !(!id || id.length <= 3 || id.indexOf('undefined') !== -1 || id.indexOf('null') !== -1);
  };
  const isConversionLabelValid = (label) => {
    return !(!label || label === 'undefined' || label === 'null');
  };
  const sendToArray = idAndLabelObjArray
    .reduce((acc, currentIdAndLabelObj) => {
      const labels = (currentIdAndLabelObj.conversionLabel || '').split(',');
      labels.forEach(function (label) {
        acc.push({ conversionId: currentIdAndLabelObj.conversionId, conversionLabel: label });
      });
      return acc;
    }, [])
    .filter((idAndLabelObj) => {
      const conversionId = idAndLabelObj.conversionId;
      const conversionLabel = idAndLabelObj.conversionLabel;
      const isMerchantCenter =
        conversionId.indexOf('MC-') !== -1 || conversionId.indexOf('GT-') !== -1;
      return (
        isConversionIdValid(conversionId) &&
        (isMerchantCenter ? true : isConversionLabelValid(conversionLabel))
      );
    })
    .map((idAndLabelObj) => {
      const conversionId = idAndLabelObj.conversionId;
      const conversionLabel = idAndLabelObj.conversionLabel;
      const isMerchantCenter =
        conversionId.indexOf('MC-') !== -1 || conversionId.indexOf('GT-') !== -1;
      return conversionId.trim() + (isMerchantCenter ? '' : '/' + conversionLabel.trim());
    });
  return sendToArray;
};

const getGlobal = () => {
  let gtag = copyFromWindow(namespace);
  if (gtag) return gtag;
  gtag = createArgumentsQueue(namespace, dataLayerName);
  return gtag;
};

/**
 * GA4 loads gtag (Google Tag) script by itself.
 * So this is not needed when you have GA4 tags or other products that uses gtag (Google Tag).
 * And it just needs to load once.
 */
const injectGoogleTagScript = (conversionId) => {
  const scriptUrl =
    'https://www.googletagmanager.com/gtag/js?id=' + conversionId + '&l=' + dataLayerName + '&cx=c';
  log('loading gtag script: ', scriptUrl);
  injectScript(
    scriptUrl,
    () => {
      setInWindow(gtagInjectedByGTMTemplate, true);
      data.gtmOnSuccess();
    },
    () => {
      data.gtmOnFailure();
    },
    namespace
  );
};

const main = () => {
  log('data: ', data);

  const gtag = getGlobal();

  const parameters = mergeSettings('parametersFromVariable', 'parametersList');
  const userData = mergeSettings('userDataFromVariable', 'userDataList');
  log('userData: ', userData);
  // https://support.google.com/tagmanager/answer/13438771?hl=en#:~:text=x-,user_data,-object
  if (data.enableUserData) {
    if (Object.entries(userData).length) {
      /**
       * https://support.google.com/google-ads/answer/13258081?hl=en&ref_topic=11337914
       * Enhanced Conversions works without allow_enhanced_conversions = true, but it doesn't hurt to add.
       */
      parameters.allow_enhanced_conversions = true;
      parameters.user_data = userData;
    }
  } else {
    parameters.user_data = null;
  }
  parameters.send_to = createSendToArray(data.conversionIdAndLabelList);
  parameters.from_gtm_template = true; // A flag to indicate that data layer push comes from this template.
  log('eventParameters: ', parameters);

  const eventName = data.eventName;
  log('eventName: ', eventName);

  gtag('event', eventName, parameters);

  const gtagAlreadyInjected = copyFromWindow(gtagInjectedByGTMTemplate);
  if (data.shouldInjectGtag && !gtagAlreadyInjected) {
    const arbitraryConversionId = parameters.send_to[0].split('/')[0];
    injectGoogleTagScript(arbitraryConversionId);
  } else {
    data.gtmOnSuccess();
  }
};

/*==============================================================================
==============================================================================*/

main();
