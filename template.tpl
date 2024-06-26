___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Improved Google Marketing Tags using gtag",
  "categories": [
    "ANALYTICS",
    "ADVERTISING",
    "MARKETING"
  ],
  "brand": {
    "id": "brand_dummy",
    "displayName": "Giovani Ortolani Barbosa"
  },
  "description": "Modified version of WebMachanix Improved GA4 Tag but for Google Ads conversion tag, Floodlight pixels and Merchant Center purchase events.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SIMPLE_TABLE",
    "name": "conversionIdAndLabelList",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Conversion ID",
        "name": "conversionId",
        "type": "TEXT",
        "selectItems": [],
        "valueHint": "AW-324234324"
      },
      {
        "defaultValue": "",
        "displayName": "Conversion Label(s)",
        "name": "conversionLabel",
        "type": "TEXT",
        "valueHint": "AkU-CNLQ1OAYEMrh6cAS,G6okC276z-AYEMrh6crB"
      }
    ],
    "alwaysInSummary": true,
    "help": "Add the \u003cb\u003eConversion ID\u003c/b\u003e (with the prefixes, such as: AW, DC, MC and so on) and \u003cb\u003eConversion Label(s)\u003c/b\u003e.\n\u003c/br\u003e\n\u003c/br\u003e\nSome Conversion ID prefixes possibilities:\n\u003c/br\u003e\nAW: Google Ads\n\u003c/br\u003e\nMC: Merchant Center\n\u003c/br\u003e\nDC: Double Click (Display \u0026 Video 360, Search Ads 360, Campaign Manager 360 etc.).\n\u003c/br\u003e\n\u003c/br\u003e\nThe \u003cb\u003eConversion Label\u003c/b\u003e can be a single label or a comma-separated list of labels.\n\u003c/br\u003e\n\u003c/br\u003e\nExamples:\n\u003c/br\u003e\n- Conversion ID (String): AW-123123 or DC-565645 etc.\n\u003c/br\u003e\n- Conversion Label (String):\n\u003cul\u003e\u003cli\u003efor Google Ads Conversions\u003c/li\u003e\u003c/ul\u003e \nConversionLabel1,ConversionLabel2,ConversionLabelN\n\u003cul\u003e\u003cli\u003efor Floodlight tags\u003c/li\u003e\u003c/ul\u003e \nactivityGroupTagString1/activityTagString1+countingMethod1,[...]",
    "displayName": "Conversion ID and Conversion Label(s)"
  },
  {
    "type": "GROUP",
    "name": "eventNameGroup",
    "displayName": "Event Name",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SELECT",
        "name": "eventName",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": "conversion",
            "displayValue": "conversion"
          },
          {
            "value": "purchase",
            "displayValue": "purchase"
          }
        ],
        "simpleValueType": true,
        "help": "The Event Name to be used in your tag.\n\nGoogle Ads conversions use \u0027conversion\u0027, by default. When used with cart data it must use \u0027purchase\u0027 as stated in documentation.\n\nFloodlight tags use the same rule. Event name is \u0027conversion\u0027, by default. When configured to track a sale, it must use \u0027purchase\u0027.\n\nSee Documentation section below",
        "alwaysInSummary": false,
        "displayName": "Event Name to be used"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "parametersGroup",
    "displayName": "Event Parameters",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SELECT",
        "name": "parametersFromVariable",
        "displayName": "Load Parameters From Variable",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": false,
            "displayValue": "False"
          }
        ],
        "simpleValueType": true,
        "help": "You can use a variable that returns a JavaScript object with the parameters you want to set. This object will be merged with any additional parameters you set via the table below. Any conflicts will be resolved in favor of the parameters you add to the table."
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "parametersList",
        "displayName": "",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Field Name",
            "name": "name",
            "type": "TEXT",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "REGEX",
                "args": [
                  "[a-z_\\.\\-]{1,40}"
                ]
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Value",
            "name": "value",
            "type": "TEXT"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "userDataGroup",
    "displayName": "User Data (Enhanced Conversions)",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "enableUserData",
        "checkboxText": "Collect User Data",
        "simpleValueType": true,
        "help": "Turn on user-provided data collection (manual or automatic). \u003cbr\u003e If you leave the fields below empty, then it will automatically detect user-provided data in the webpage (you might also want to check whether this option is enabled in Google Ads). \u003cbr\u003e \u003ca href\u003d\"https://support.google.com/tagmanager/answer/12131703?sjid\u003d129277455360346925-SA#Data\u0026zippy\u003d%2Callow-user-provided-data-capabilities\"\u003eReference.\u003c/a\u003e \u003cbr\u003e Otherwise, it will use the data provided in the fields. \u003cbr\u003e \u003ca href\u003d\"https://support.google.com/tagmanager/answer/13438771?hl\u003den#:~:text\u003dx-,user_data,-object\"\u003eReference.\u003c/a\u003e"
      },
      {
        "type": "SELECT",
        "name": "userDataFromVariable",
        "displayName": "Load User Data From Variable",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": false,
            "displayValue": "False"
          }
        ],
        "simpleValueType": true,
        "help": "You can use a variable that returns a JavaScript object with the properties you want to use. This object will be merged with any additional properties you add via the table below. Any conflicts will be resolved in favor of the properties you add to the table.",
        "enablingConditions": [
          {
            "paramName": "enableUserData",
            "paramValue": true,
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "userDataList",
        "displayName": "",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Property Name",
            "name": "name",
            "type": "TEXT"
          },
          {
            "defaultValue": "",
            "displayName": "Value",
            "name": "value",
            "type": "TEXT"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "enableUserData",
            "paramValue": true,
            "type": "EQUALS"
          }
        ]
      }
    ],
    "help": "For Google Ads Enhanced Conversions."
  },
  {
    "type": "GROUP",
    "name": "shouldInjectGtagGroup",
    "displayName": "Inject Google Tag (gtag)",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "shouldInjectGtag",
        "checkboxText": "Check this box if a Google Tag is not installed in your website. Make sure to add Conversion Linker tag in all pages.",
        "simpleValueType": true,
        "help": "If the GTM container already has the gtag library being loaded (whether from a GA4 tag or from another Google product), then you are good to go. If not, then check this box to load gtag library. \u003ca href\u003d\"https://developers.google.com/tag-platform/gtagjs\"\u003eReference.\u003c/a\u003e"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "dataLayerGroup",
    "displayName": "dataLayer configuration",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "dataLayerArrayName",
        "displayName": "The dataLayer array name",
        "simpleValueType": true,
        "defaultValue": "dataLayer",
        "help": "Enter the name used for the dataLayer array. Defaults to \u003ci\u003edataLayer\u003c/i\u003e."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "debugGroup",
    "displayName": "Debugging",
    "groupStyle": "ZIPPY_OPEN_ON_PARAM",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "enableLog",
        "checkboxText": "Enable console.log messages in GTM live version",
        "simpleValueType": true,
        "alwaysInSummary": false
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "documentationGroup",
    "displayName": "Documentation",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "LABEL",
        "name": "documentation",
        "displayName": "\u003ca href\u003d\"https://support.google.com/google-ads/answer/7521212?hl\u003den\"\u003eGoogle Tag (gtag)\u003c/a\u003e\n\u003c/br\u003e\n\u003ca href\u003d\"https://support.google.com/google-ads/answer/7548399?hl\u003den\"\u003eGoogle Ads Conversion tags using gtag\u003c/a\u003e\n\u003c/br\u003e\n\u003ca href\u003d\"https://support.google.com/campaignmanager/answer/7554821?hl\u003den\"\u003eFloodlight tags using gtag\u003c/a\u003e\n\u003c/br\u003e\n\u003ca href\u003d\"https://support.google.com/google-ads/answer/9888656?hl\u003den\"\u003eGoogle Ads Enhanced Conversions\u003c/a\u003e\n\u003c/br\u003e\n\u003ca href\u003d\"https://support.google.com/google-ads/answer/12077475?hl\u003den\"\u003eGoogle Ads Conversions with New Customer Data\u003c/a\u003e\n\u003c/br\u003e\n\u003ca href\u003d\"https://support.google.com/google-ads/answer/9028614?hl\u003den\"\u003eGoogle Ads Conversions with Cart Data\u003c/a\u003e\n\u003c/br\u003e\n\u003ca href\u003d\"https://support.google.com/google-ads/answer/6386790?hl\u003den\"\u003eGoogle Ads Conversions with Transaction ID and Value\u003c/a\u003e\n\u003c/br\u003e\n\u003ca href\u003d\"https://support.google.com/merchants/answer/13071852?sjid\u003d1187090570514687035-SA\u0026hl\u003den\"\u003eGoogle Merchant Center Purchase Events\u003c/a\u003e\n\u003c/br\u003e\n\u003ca href\u003d\"https://support.google.com/google-ads/answer/9606827?hl\u003den\"\u003eDisable the collection of personalized advertising data\u003c/a\u003e\n\u003c/br\u003e\n\u003c/br\u003e\nInspired by: \u003ca href\u003d\"https://github.com/WebMechanix/gtm-improved-ga4\"\u003eWebmechanix Improved GA4 Tag Template for GTM\u003c/a\u003e\n\u003c/br\u003e\n\u003c/br\u003e\nREADME: \u003ca href\u003d\"https://github.com/giovaniortolani/gtm-improved-google-ads-conversion-tag/tree/main\"\u003eGitHub Repository\u003c/a\u003e\n\u003c/br\u003e\n\u003c/br\u003e\n⚠️\n\u003c/br\u003e\nOne point of caution here is that: since we are using \u003cb\u003egtag\u003c/b\u003e, it has the power to trigger GTM triggers if the event name used in the \u003cb\u003egtag\u003c/b\u003e call is an event used by a GTM trigger.\n\u003c/br\u003e\n\u003c/br\u003e\nReason: \u003cb\u003egtag\u003c/b\u003e is nothing more than a data layer push \u003cb\u003ewindow.gtag \u003d function() { window.dataLayer.push(arguments); }\u003c/b\u003e.\n\u003c/br\u003e\n\u003c/br\u003e\nExample: the call \u003cb\u003egtag(\u0027event\u0027, \u0027purchase\u0027, { ... })\u003c/b\u003e can trigger triggers that expect the event \u003cb\u003e\u0027purchase\u0027\u003c/b\u003e. Whereas the call to \u003cb\u003egtag(\u0027event\u0027, \u0027conversion\u0027, { ... })\u003c/b\u003e can trigger triggers that expect the event \u003cb\u003e\u0027conversion\u0027\u003c/b\u003e.\n\u003c/br\u003e\n\u003c/br\u003e\nBy default, the \u003cb\u003e\u0027conversion\u0027\u003c/b\u003e event was left configured, as suggested by Google Ads documentation. However, the same caution applies: be sure to check for triggers that fire on this event.\n\u003c/br\u003e\n\u003c/br\u003e\nNote that native Google Ads conversion tags in GTM use the \u003cb\u003e\u0027purchase\u0027\u003c/b\u003e event. Nevertheless, no problems were identified in using \u003cb\u003e\u0027conversion\u0027\u003c/b\u003e as the event name.\n\u003c/br\u003e\n\u003c/br\u003e\nHowever, if product information is passed in the tag (via the \u003cb\u003eitems\u003c/b\u003e parameter), the template will use the \u003cb\u003e\u0027purchase\u0027\u003c/b\u003e event, as mandated by the documentation. Here it is necessary to be careful, as it will trigger some triggers that expect the \u0027purchase\u0027 event.\n\u003c/br\u003e\n\u003c/br\u003e\n💡\n\u003c/br\u003e\nTo address this issue, simply create a variable of type \u003cb\u003eData Layer\u003c/b\u003e using the \u003cb\u003eeventModel.from_gtm_template\u003c/b\u003e variable from the data layer (this template inserts this key in all its events). \n\u003c/br\u003e\nIn the trigger, this variable should be inserted with the comparison \u003ci\u003edoes not equal true\u003c/i\u003e.\n\u003c/br\u003e\nOr, if you don\u0027t want to modify the original trigger, you can use an exception trigger. Add this variable to it with the comparison \u003ci\u003eequals true\u003c/i\u003e.\n\u003c/br\u003e\n\u003c/br\u003e"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const copyFromWindow = require('copyFromWindow');
const setInWindow = require('setInWindow');
const createArgumentsQueue = require('createArgumentsQueue');
const getType = require('getType');
const Object = require('Object');
const logToConsole = require('logToConsole');
const makeTableMap = require('makeTableMap');
const getContainerVersion = require('getContainerVersion');
const injectScript = require('injectScript');

const namespace = 'gtag';
const dataLayerName = data.dataLayerArrayName || 'dataLayer';
const gtagInjectedByGTMTemplate = '_gtag_injected_by_gtm_template';

const log = (messagePrefix, data) => {
  // Only logs to console, if:
  // - preview mode, always
  // or
  // - production, if the checkbox data.enableLog is checked.
  const isInPreviewOrDebugMode = getContainerVersion().previewMode || getContainerVersion().debugMode;
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
  const overrides = data[tableKey] && data[tableKey].length ? makeTableMap(data[tableKey], 'name', 'value') : {};
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
          labels.forEach(function(label) {
            acc.push({ conversionId: currentIdAndLabelObj.conversionId, conversionLabel: label });
          });
          return acc;
        }, [])
        .filter(idAndLabelObj => {
          const conversionId = idAndLabelObj.conversionId;
          const conversionLabel = idAndLabelObj.conversionLabel;
          return isConversionIdValid(conversionId) && (conversionId.indexOf('MC-') !== -1 ? true : isConversionLabelValid(conversionLabel));
        })
        .map((idAndLabelObj) => {
          const conversionId = idAndLabelObj.conversionId;
          const conversionLabel = idAndLabelObj.conversionLabel;
          return conversionId.trim() + (conversionId.indexOf('MC-') !== -1 ? '' : '/' + conversionLabel.trim());
        });
  return sendToArray;
};

const getGlobal = () => {
  let gtag = copyFromWindow(namespace);
  if (gtag) return gtag;
  gtag = createArgumentsQueue(namespace, dataLayerName);
  return gtag;
};

// GA4 loads gtag (Google Tag) script by itself. So this is not needed when you have GA4 tags or other products that uses gtag (Google Tag).
// And it just needs to load once.
const injectGoogleTagScript = (conversionId) => {
  const gtagAlreadyInjected = copyFromWindow(gtagInjectedByGTMTemplate);
  if (!data.shouldInjectGtag) return; 
  if (gtagAlreadyInjected) return;
  const scriptUrl = 'https://www.googletagmanager.com/gtag/js?id=' + conversionId + '&l=' + dataLayerName + '&cx=c';
  log('loading gtag script: ', scriptUrl);
  injectScript(scriptUrl, () => { setInWindow(gtagInjectedByGTMTemplate, true); }, () => {}, namespace);
};

const main = () => {
  log('data: ', data);
  
  const gtag = getGlobal();
  
  const parameters = mergeSettings('parametersFromVariable', 'parametersList');
  const userData = mergeSettings('userDataFromVariable', 'userDataList');
  log('userData: ', userData);
  // https://support.google.com/tagmanager/answer/13438771?hl=en#:~:text=x-,user_data,-object
  if (data.enableUserData) {
    if (Object.entries(userData).length) { // Checking if it's not empty.
      // https://support.google.com/google-ads/answer/13258081?hl=en&ref_topic=11337914
      // Enhanced Conversions works without allow_enhanced_conversions = true, but it doesn't hurt to add.
      parameters.allow_enhanced_conversions =  true; 
      parameters.user_data = userData;
    }
  } else {
    parameters.user_data = null;
  }
  parameters.send_to = createSendToArray(data.conversionIdAndLabelList);
  parameters.from_gtm_template = true; // To signal that it comes from this template.
  log('eventParameters: ', parameters);
  
  const eventName = data.eventName;
  log('eventName: ', eventName);
  
  gtag('event', eventName, parameters);
  
  const arbitraryConversionId = parameters.send_to[0].split('/')[0];
  injectGoogleTagScript(arbitraryConversionId);
  
  data.gtmOnSuccess();
};

main();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtag"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "dataLayer"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_gtag_injected_by_gtm_template"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_container_data",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://www.googletagmanager.com/gtag/js/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 11/15/2023, 3:02:02 PM


