# Improved Google Ads Conversion Tag Template for GTM
A Google Ads Conversion tag template with an improved UI which allows for greater flexibility than the provided Google Ads Conversion and Floodlight tag templates from Google.

## Preface
This tag template won't be for everyone. This template is geared more toward GTM power users with advanced implementation practices that require a more robust UI for how variables are used inside of Google Ads Conversion and Floodlight tag from Google. This tag template took inspiration from [WebMechanix Improved GA4 Tag Template for GTM](https://github.com/WebMechanix/gtm-improved-ga4) that used a similar UI pattern. Since all Google products now are shifting to using the Google Tag (gtag), it made sense to create this template using the GA4 Improved template as a foundation.

## What it does

1. Load the gtag.js library if needed.
2. Registers an arguments queue on the default `dataLayer` global.
3. Implements a better UI that accepts a variable that returns a JavaScript object with the fields/parameters/properties you want to set. This object will be merged with any additional fields you set via a normal key:value table. Any object key conflicts will always use the explicitly defined value in the key:value table.
4. (Experimental) Accepts multiple conversion pixels (Google Ads Conversions or Floodlight tags) in one tag leveraging [`gtag()` _send_to_ parameter](https://developers.google.com/tag-platform/gtagjs/routing). In the same tag, we can add conversions for multiple Google Ads accounts, Campaign Manager 360, Display & Video 360, and so on.
5. (Experimental) Support for all Google Ads Conversion tag from Google (default template) features and the ones that are supported only using `gtag()`. Support for Floodlight tags as well.
    1. [Google Ads Conversion tags using gtag](https://support.google.com/google-ads/answer/7548399?hl=en)
    2. [Floodlight tags using gtag](https://support.google.com/campaignmanager/answer/7554821?hl=en)
    3. [Google Ads Enhanced Conversions](https://support.google.com/google-ads/answer/9888656?hl=en)
    4. [Google Ads Conversions with New Customer Data](https://support.google.com/google-ads/answer/12077475?hl=en)
    5. [Google Ads Conversions with Cart Data](https://support.google.com/google-ads/answer/9028614?hl=en)
    6. [Google Ads Conversions with Transaction ID and Value](https://support.google.com/google-ads/answer/6386790?hl=en)
    7. [Disable the collection of personalized advertising data](https://support.google.com/google-ads/answer/9606827?hl=en)

## Limitations

### dataLayer
Google's Sandboxed Javascript doesn't allow for the ability to customize what global variable is used for the arguments queue. If you need to specify a non-default dataLayer global, you will need to edit the template file `dataLayerName` constant to your needs.

### gtag.js is loaded from www.googletagmanager.com
Google's Sandboxed Javascript doesn't allow for the ability to customize what domain and path is used to load the `gtag.js` library. If you wish to load the `gtag.js` file in a non-default way (e.g. proxy through a sGTM container or other 1st party means) you will need to edit the template file at this time.

### Built-in consent checks
This tag template has not yet been adjusted to use built-in consent checks for things like consent-mode that the default GA4 tag templates do.

## Author(s)
[Giovani Ortolani Barbosa](https://www.linkedin.com/in/giovani-ortolani-barbosa/)
