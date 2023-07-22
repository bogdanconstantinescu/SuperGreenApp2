// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

typedef String? MessageIfAbsent(
    String? messageStr, List<Object>? args);

class MessageLookup extends MessageLookupByLibrary {
  @override
  String get localeName => 'es';

  static m0(name) => "Controller ${name} requires authentication!";

  static m1(count) => "${Intl.plural(count, one: '1 like', other: '${count} likes')}";

  static m2(nickname) => "Add a comment as ${nickname}...";

  static m3(n) => "(+${n} other)";

  static m4(comment) => "Comment was: \"${comment}\"";

  static m5(name, boxName) => "Plant ${name} on lab ${boxName} created:)";

  static m6(tries, totalTries) => "Try\n${tries}/${totalTries}";

  static m7(controller) => "Controller \"${controller}\" not found!";

  static m8(name) => "Plant ${name} is now public";

  static m9(title) => "Resume previous ${title} card draft?";

  static m10(days) => "${days} days";

  static m11(days, hours) => "${days} days and ${hours} hours";

  static m12(hours) => "${hours} hours";

  static m13(seconds) => "${seconds} min";

  static m14(seconds) => "${seconds} s";

  static m15(basedOn) => "From: ${basedOn}";

  static m16(phase) => "Phase: ${phase}";

  static m17(name) => "Update ${name}?";

  static m18(phase) => "Flipped to\n${phase}";

  static m19(yesNo) => "Was dry: ${yesNo}";

  static m20(yesNo) => "With nutes: ${yesNo}";

  static m21(count) => "SELECT (${count})";

  static m22(progress) => "Syncing - ${progress}";

  static m23(name) => "Controller ${name} refreshed!";

  static m24(leds) => "Led channels: ${leds}";

  static m25(number) => "Box #${number}";

  static m26(index, name) => "Reset box #${index} on controller ${name}?";

  static m27(name) => "Delete controller ${name}?";

  static m28(name) => "Controller ${name} password set!";

  static m29(name) => "Controller ${name} updated!";

  static m30(name) => "Controller ${name} paired for remote control!";

  static m31(count) => "${Intl.plural(count, one: 'Liked by 1', other: 'Liked by ${count}')}";

  static m32(time) => "(100% power for ${time} s)";

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
      'addDevicePagePleaseLoginDialogBody': MessageLookupByLibrary.simpleMessage('Optionnal login or account creation is preferable at this step.\nIt will allow to enable the remote control of your box for easier setup.\n\nNo personal infos required, not even an email address.'),
    'addDevicePagePleaseLoginDialogSkip': MessageLookupByLibrary.simpleMessage('Continue without'),
    'addDevicePagePleaseLoginDialogTitle': MessageLookupByLibrary.simpleMessage('Optional Login'),
    'appBarMissingControllerAlreadyGotOne': MessageLookupByLibrary.simpleMessage('already got one?'),
    'appBarMissingControllerControllerRequired': MessageLookupByLibrary.simpleMessage('Monitoring feature\nrequires an SGL controller'),
    'appBarMissingControllerDIYNow': MessageLookupByLibrary.simpleMessage('DIY NOW'),
    'appBarMissingControllerOr': MessageLookupByLibrary.simpleMessage('or'),
    'appBarMissingControllerSetupController': MessageLookupByLibrary.simpleMessage('SETUP CONTROLLER'),
    'appBarMissingControllerShopNow': MessageLookupByLibrary.simpleMessage('SHOP NOW'),
    'authModalButton': MessageLookupByLibrary.simpleMessage('NOTIFY ME'),
    'authModalTitle': m0,
    'cancel': MessageLookupByLibrary.simpleMessage('CANCEL'),
    'commentsFormPageCommentLikeCount': m1,
    'commentsFormPageCommentTypeTitle': MessageLookupByLibrary.simpleMessage('What kind of post do you want to do?'),
    'commentsFormPageInputHintText': m2,
    'commentsFormPageLoadingMoreComments': MessageLookupByLibrary.simpleMessage('Loading more comments..'),
    'commentsFormPageNOtherRecommendations': m3,
    'commentsFormPagePleaseLogin': MessageLookupByLibrary.simpleMessage('Please login to add a comment'),
    'commentsFormPageReplyButton': MessageLookupByLibrary.simpleMessage('Reply'),
    'commentsFormPageReplyingTo': MessageLookupByLibrary.simpleMessage('Replying to '),
    'commentsFormPageReportButton': MessageLookupByLibrary.simpleMessage('Report'),
    'commentsFormPageReportDialogBody': m4,
    'commentsFormPageReportDialogTitle': MessageLookupByLibrary.simpleMessage('Report this comment?'),
    'commentsFormPageSendingCommentLoading': MessageLookupByLibrary.simpleMessage('Sending comment..'),
    'commentsFormPageSubmitComment': MessageLookupByLibrary.simpleMessage('Post'),
    'commentsFormPageTitle': MessageLookupByLibrary.simpleMessage('Comments'),
    'commentsFormPageViewAllComments': MessageLookupByLibrary.simpleMessage('View all comments'),
    'commentsFormPageViewingSingleComment': MessageLookupByLibrary.simpleMessage('Viewing single comment'),
    'confirmUnRevertableChange': MessageLookupByLibrary.simpleMessage('This can\'t be reverted. Continue?'),
    'createBoxPageNewLabButton': MessageLookupByLibrary.simpleMessage('CREATE LAB'),
    'createBoxPageNewLabHint': MessageLookupByLibrary.simpleMessage('Ex: IkeHigh'),
    'createBoxPageNewLabLabel': MessageLookupByLibrary.simpleMessage('New green lab\'s name:'),
    'createPlantPageCreatePlantButton': MessageLookupByLibrary.simpleMessage('CREATE PLANT'),
    'createPlantPageDoneMessage': m5,
    'createPlantPageNameHint': MessageLookupByLibrary.simpleMessage('Ex: Gorilla Kush'),
    'createPlantPageNameLabel': MessageLookupByLibrary.simpleMessage('Let\'s name your new plant:'),
    'createPlantPageSinglePlantDiaryLabel': MessageLookupByLibrary.simpleMessage('Single plant grow diary'),
    'createPlantPageSinglePlantDiarySectionTitle': MessageLookupByLibrary.simpleMessage('Is this a single or multiple plant\ngrow diary?'),
    'deviceNamePageLoading': MessageLookupByLibrary.simpleMessage('Setting controller name..'),
    'deviceNamePageSetNameHint': MessageLookupByLibrary.simpleMessage('ex: controller'),
    'deviceNamePageSetNameSectionTitle': MessageLookupByLibrary.simpleMessage('Set controller\'s name'),
    'deviceNamePageTitle': MessageLookupByLibrary.simpleMessage('Add controller'),
    'devicePairingPageInstructions': MessageLookupByLibrary.simpleMessage('**You can now enable remote control**\n\n**Keep control** of your box, even when you\'re away! If you skip this step, you will still be able to monitor your box sensors remotely.\n\n**Pairing also allows to remotely change your controller parameters**, like adjusting blower settings from work.'),
    'devicePairingPageInstructionsNeedUpgrade': MessageLookupByLibrary.simpleMessage('**Controller needs upgrade to enable remote control.** Once your controller is added to the app, head to the controllers settings to upgrade to the latest version.\n\n**Keep control** of your box, even when you\'re away! If you skip this step, you will still be able to monitor your box sensors remotely.\n\n**Pairing also allows to remotely change your controller parameters**, like adjusting blower settings from work.'),
    'devicePairingPageLoading': MessageLookupByLibrary.simpleMessage('Pairing controller..'),
    'devicePairingPagePairControllerSectionTitle': MessageLookupByLibrary.simpleMessage('Pair controller for remote control'),
    'devicePairingPagePleaseLoginDialogBody': MessageLookupByLibrary.simpleMessage('Remote control requires a sgl account, please create one or login.'),
    'devicePairingPagePleaseLoginDialogTitle': MessageLookupByLibrary.simpleMessage('Please login'),
    'devicePairingPageTitle': MessageLookupByLibrary.simpleMessage('Pair controller'),
    'deviceWifiPageErrorConnectionEmoji': MessageLookupByLibrary.simpleMessage('Make sure you are connected to the emoji wifi!'),
    'deviceWifiPageNoControllerFound': MessageLookupByLibrary.simpleMessage('Couldn\'t find the controller\non your network.'),
    'deviceWifiPageNotFoundInstructions': MessageLookupByLibrary.simpleMessage('Is the emoji wifi back?\nThen the entered credentials were wrong.\nConnect to it, then tap this button:'),
    'deviceWifiPageNotFoundRetry': MessageLookupByLibrary.simpleMessage('Sometime it just takes a bit more time,\nretry search:'),
    'deviceWifiPageRetryCredentials': MessageLookupByLibrary.simpleMessage('RETRY CREDENTIALS'),
    'deviceWifiPageRetrySearch': MessageLookupByLibrary.simpleMessage('RETRY SEARCH'),
    'deviceWifiPageSearchingController': MessageLookupByLibrary.simpleMessage('Searching controller on network\nplease wait..'),
    'deviceWifiPageSearchingControllerTries': m6,
    'deviceWifiPageTitle': MessageLookupByLibrary.simpleMessage('Controller Wifi setup'),
    'deviceWifiPageWifiInputLabel': MessageLookupByLibrary.simpleMessage('Enter your home wifi SSID'),
    'deviceWifiPageWifiPasswordLabel': MessageLookupByLibrary.simpleMessage('Enter your home wifi password'),
    'done': MessageLookupByLibrary.simpleMessage('Done!'),
    'doneButton': MessageLookupByLibrary.simpleMessage('DONE'),
    'environmentsPageAlerts': MessageLookupByLibrary.simpleMessage('Alerts'),
    'environmentsPageControlTitle': MessageLookupByLibrary.simpleMessage('Environment control'),
    'environmentsPageLight': MessageLookupByLibrary.simpleMessage('Light'),
    'environmentsPageSchedule': MessageLookupByLibrary.simpleMessage('Schedule'),
    'environmentsPageVentilation': MessageLookupByLibrary.simpleMessage('Ventil'),
    'existingDeviceNameHint': MessageLookupByLibrary.simpleMessage('Ex: supergreencontroller or IP address'),
    'existingDeviceNotFound': m7,
    'existingDevicePageTitle': MessageLookupByLibrary.simpleMessage('Add controller'),
    'existingDeviceSearchButton': MessageLookupByLibrary.simpleMessage('SEARCH CONTROLLER'),
    'existingDeviceSearching': MessageLookupByLibrary.simpleMessage('Searching controller..'),
    'explorerPagePleaseLoginDialogBody': MessageLookupByLibrary.simpleMessage('You need to be logged in to make a plant public.'),
    'explorerPagePleaseLoginDialogTitle': MessageLookupByLibrary.simpleMessage('Make a plant public'),
    'explorerPagePublicPlantConfirmation': m8,
    'explorerPageSelectPlantTitle': MessageLookupByLibrary.simpleMessage('Select which plant you want to make public'),
    'explorerPageTitle': MessageLookupByLibrary.simpleMessage('Explorer'),
    'feedBendingCardPageTitle': MessageLookupByLibrary.simpleMessage('Bending'),
    'feedCareCommonAfterPics': MessageLookupByLibrary.simpleMessage('After pics'),
    'feedCareCommonBeforePics': MessageLookupByLibrary.simpleMessage('Before pics'),
    'feedCareCommonDeletePicDialogBody': MessageLookupByLibrary.simpleMessage('This can\'t be reverted. Continue?'),
    'feedCareCommonDeletePicDialogTitle': MessageLookupByLibrary.simpleMessage('Delete this pic?'),
    'feedCareCommonDraftRecoveryDialogBody': m9,
    'feedCareCommonDraftRecoveryDialogTitle': MessageLookupByLibrary.simpleMessage('Draft recovery'),
    'feedCareCommonFormSaving': MessageLookupByLibrary.simpleMessage('Saving..'),
    'feedCareCommonObservations': MessageLookupByLibrary.simpleMessage('Observations'),
    'feedDefoliationCardPageTitle': MessageLookupByLibrary.simpleMessage('Defoliation'),
    'feedFimmingCardPageTitle': MessageLookupByLibrary.simpleMessage('Fimming'),
    'feedLifeEventCardPageBloomingStarted': MessageLookupByLibrary.simpleMessage('Blooming Started!'),
    'feedLifeEventCardPageCuringStarted': MessageLookupByLibrary.simpleMessage('Curing Started!'),
    'feedLifeEventCardPageDryingStarted': MessageLookupByLibrary.simpleMessage('Drying Started!'),
    'feedLifeEventCardPageGermination': MessageLookupByLibrary.simpleMessage('Germination!'),
    'feedLifeEventCardPageTitle': MessageLookupByLibrary.simpleMessage('Life event'),
    'feedLifeEventCardPageVeggingStarted': MessageLookupByLibrary.simpleMessage('Vegging Started!'),
    'feedLifeEventFormPageChangeButton': MessageLookupByLibrary.simpleMessage('change'),
    'feedLifeEventFormPageNotSet': MessageLookupByLibrary.simpleMessage('Not set'),
    'feedLifeEventFormPagePhaseLabel': MessageLookupByLibrary.simpleMessage('Phase'),
    'feedLifeEventFormPagePhaseLabelBlooming': MessageLookupByLibrary.simpleMessage('Blooming since'),
    'feedLifeEventFormPagePhaseLabelCuring': MessageLookupByLibrary.simpleMessage('Curing since'),
    'feedLifeEventFormPagePhaseLabelDrying': MessageLookupByLibrary.simpleMessage('Drying since'),
    'feedLifeEventFormPagePhaseLabelGermination': MessageLookupByLibrary.simpleMessage('Germination date'),
    'feedLifeEventFormPagePhaseLabelVegging': MessageLookupByLibrary.simpleMessage('Vegging since'),
    'feedLifeEventFormPageSetButton': MessageLookupByLibrary.simpleMessage('set'),
    'feedLightCardPageChannel': MessageLookupByLibrary.simpleMessage('channel'),
    'feedLightCardPageTitle': MessageLookupByLibrary.simpleMessage('Stretch control'),
    'feedLightFormPageCancelling': MessageLookupByLibrary.simpleMessage('Cancelling..'),
    'feedLightFormPageControllerRequired': MessageLookupByLibrary.simpleMessage('Dimming control\nrequires an SGL controller'),
    'feedLightFormPageDIYNow': MessageLookupByLibrary.simpleMessage('DIY NOW'),
    'feedLightFormPageOr': MessageLookupByLibrary.simpleMessage('or'),
    'feedLightFormPageSaving': MessageLookupByLibrary.simpleMessage('Saving..'),
    'feedLightFormPageShopNow': MessageLookupByLibrary.simpleMessage('SHOP NOW'),
    'feedMeasureCardPageDays': m10,
    'feedMeasureCardPageDaysAndHours': m11,
    'feedMeasureCardPageHours': m12,
    'feedMeasureCardPageMinutes': m13,
    'feedMeasureCardPageSeconds': m14,
    'feedMeasureCardPageTitle': MessageLookupByLibrary.simpleMessage('Measure'),
    'feedMeasureFormPageDeletePicDialogTitle': MessageLookupByLibrary.simpleMessage('Delete this pic?'),
    'feedMeasureFormPageObservations': MessageLookupByLibrary.simpleMessage('Observations'),
    'feedMeasureFormPagePreviousMeasure': MessageLookupByLibrary.simpleMessage('Previous measures'),
    'feedMeasureFormPageTodayMeasure': MessageLookupByLibrary.simpleMessage('Today\'s measure'),
    'feedMeasureFormPageUnselectMeasureDialogTitle': MessageLookupByLibrary.simpleMessage('Unselect this measure?'),
    'feedMediaCardPageBoxTitle': MessageLookupByLibrary.simpleMessage('Build log'),
    'feedMediaCardPageTitle': MessageLookupByLibrary.simpleMessage('Grow log'),
    'feedMediaFormPageAttachedMedia': MessageLookupByLibrary.simpleMessage('Attached media'),
    'feedMediaFormPageDeletePicDialogTitle': MessageLookupByLibrary.simpleMessage('Delete this pic?'),
    'feedMediaFormPageDraftRecoveryDialogBody': MessageLookupByLibrary.simpleMessage('Resume previous grow log?'),
    'feedMediaFormPageDraftRecoveryDialogTitle': MessageLookupByLibrary.simpleMessage('Draft recovery'),
    'feedMediaFormPageHelpRequest': MessageLookupByLibrary.simpleMessage('Help request?'),
    'feedMediaFormPageObservations': MessageLookupByLibrary.simpleMessage('Observations'),
    'feedNutrientMixCardFrom': m15,
    'feedNutrientMixCardObservations': MessageLookupByLibrary.simpleMessage('Observations'),
    'feedNutrientMixCardPhase': m16,
    'feedNutrientMixCardTitle': MessageLookupByLibrary.simpleMessage('Nutrient mix'),
    'feedNutrientMixCardWaterQuantity': MessageLookupByLibrary.simpleMessage('Water quantity'),
    'feedNutrientMixFormPageEndMixMetricsSectionTitle': MessageLookupByLibrary.simpleMessage('End mix metrics'),
    'feedNutrientMixFormPageLiquid': MessageLookupByLibrary.simpleMessage('Liquid'),
    'feedNutrientMixFormPageMetricsObservations': MessageLookupByLibrary.simpleMessage('Metrics & Observations'),
    'feedNutrientMixFormPageMixPhaseInstruction': MessageLookupByLibrary.simpleMessage('Set the right phase for this nutrient mix for better categorization.'),
    'feedNutrientMixFormPageMixPhaseSectionTitle': MessageLookupByLibrary.simpleMessage('Mix phase'),
    'feedNutrientMixFormPageNameHint': MessageLookupByLibrary.simpleMessage('Ex: Veg-1'),
    'feedNutrientMixFormPageNameLabel': MessageLookupByLibrary.simpleMessage('Mix name'),
    'feedNutrientMixFormPageNoToolsYet': MessageLookupByLibrary.simpleMessage('No nutrients in your toolbox yet.\nPress the + button up here.'),
    'feedNutrientMixFormPageNutrientInYourMixPart1': MessageLookupByLibrary.simpleMessage('Nutrients in your '),
    'feedNutrientMixFormPageNutrientInYourMixPart2': MessageLookupByLibrary.simpleMessage('mix'),
    'feedNutrientMixFormPageObservations': MessageLookupByLibrary.simpleMessage('Observations'),
    'feedNutrientMixFormPagePhaseEarlyBloom': MessageLookupByLibrary.simpleMessage('Early bloom'),
    'feedNutrientMixFormPagePhaseEarlyVeg': MessageLookupByLibrary.simpleMessage('Early veg'),
    'feedNutrientMixFormPagePhaseLateBloom': MessageLookupByLibrary.simpleMessage('Late bloom'),
    'feedNutrientMixFormPagePhaseLateVeg': MessageLookupByLibrary.simpleMessage('Late veg'),
    'feedNutrientMixFormPagePhaseMidBloom': MessageLookupByLibrary.simpleMessage('Mid bloom'),
    'feedNutrientMixFormPagePhaseMidVeg': MessageLookupByLibrary.simpleMessage('Mid veg'),
    'feedNutrientMixFormPageReuseValuesSectionTitle': MessageLookupByLibrary.simpleMessage('Reuse previous mix values?'),
    'feedNutrientMixFormPageSaveMix': MessageLookupByLibrary.simpleMessage('Save this nutrient mix'),
    'feedNutrientMixFormPageSaveMixInstructions': MessageLookupByLibrary.simpleMessage('You can give this nutrient mix a name, for future reuse. (optional)'),
    'feedNutrientMixFormPageSaveMixSectionTitle': MessageLookupByLibrary.simpleMessage('Save for future re-use?'),
    'feedNutrientMixFormPageSelectPlant': MessageLookupByLibrary.simpleMessage('Which plant(s) will receive this mix?'),
    'feedNutrientMixFormPageSolid': MessageLookupByLibrary.simpleMessage('Solid'),
    'feedNutrientMixFormPageUpdateExistingDialogBody': MessageLookupByLibrary.simpleMessage('A nutrient mix with that name already exists, overwrite?'),
    'feedNutrientMixFormPageUpdateExistingDialogNo': MessageLookupByLibrary.simpleMessage('NO, CHANGE NAME'),
    'feedNutrientMixFormPageUpdateExistingDialogTitle': m17,
    'feedNutrientMixFormPageVolume': MessageLookupByLibrary.simpleMessage('Water quantity'),
    'feedPageLoading': MessageLookupByLibrary.simpleMessage('loading more cards...'),
    'feedProductsCardPageTitle': MessageLookupByLibrary.simpleMessage('Towelie\'s selection'),
    'feedProductsCardPageViewButton': MessageLookupByLibrary.simpleMessage('View'),
    'feedScheduleCardPagePhase': m18,
    'feedScheduleCardPageTitle': MessageLookupByLibrary.simpleMessage('Schedule change'),
    'feedTimelapseCardPageTitle': MessageLookupByLibrary.simpleMessage('Timelapse!'),
    'feedToppingCardPageTitle': MessageLookupByLibrary.simpleMessage('Topping'),
    'feedTransplantCardPageTitle': MessageLookupByLibrary.simpleMessage('Transplant'),
    'feedUnknownCardPageTitle': MessageLookupByLibrary.simpleMessage('Unknown card'),
    'feedUnknownCardPageUpgradeApp': MessageLookupByLibrary.simpleMessage('Upgrade your app'),
    'feedVentilationBlowerCardPageTitle': MessageLookupByLibrary.simpleMessage('Blower change'),
    'feedVentilationCardPageDay': MessageLookupByLibrary.simpleMessage('Day'),
    'feedVentilationCardPageDaySettings': MessageLookupByLibrary.simpleMessage('Day settings'),
    'feedVentilationCardPageHighHumiSettings': MessageLookupByLibrary.simpleMessage('High humidity\nsettings'),
    'feedVentilationCardPageHighTempSettings': MessageLookupByLibrary.simpleMessage('High temperature\nsettings'),
    'feedVentilationCardPageHumidityMode': MessageLookupByLibrary.simpleMessage('Humidity mode'),
    'feedVentilationCardPageLowHumiSettings': MessageLookupByLibrary.simpleMessage('Low humidity\nsettings'),
    'feedVentilationCardPageLowTempSettings': MessageLookupByLibrary.simpleMessage('Low temperature\nsettings'),
    'feedVentilationCardPageManualMode': MessageLookupByLibrary.simpleMessage('Manual mode'),
    'feedVentilationCardPageNight': MessageLookupByLibrary.simpleMessage('Night'),
    'feedVentilationCardPageNightSettings': MessageLookupByLibrary.simpleMessage('Night settings'),
    'feedVentilationCardPagePower': MessageLookupByLibrary.simpleMessage('Power'),
    'feedVentilationCardPageTemperatureMode': MessageLookupByLibrary.simpleMessage('Temperature mode'),
    'feedVentilationCardPageTimerMode': MessageLookupByLibrary.simpleMessage('Timer mode'),
    'feedVentilationCardPageTitle': MessageLookupByLibrary.simpleMessage('Ventilation change'),
    'feedVentilationCardPageUpgrade': MessageLookupByLibrary.simpleMessage('Unknown reference source, you might need to upgrade the app.'),
    'feedVentilationFanCardPageTitle': MessageLookupByLibrary.simpleMessage('Fan change'),
    'feedWateringCardPageObservations': MessageLookupByLibrary.simpleMessage('Observations'),
    'feedWateringCardPageTitle': MessageLookupByLibrary.simpleMessage('Watering'),
    'feedWateringCardPageVolume': MessageLookupByLibrary.simpleMessage('Water quantity'),
    'feedWateringCardPageWasDry': m19,
    'feedWateringCardPageWithNutes': m20,
    'formAllowAnalytics': MessageLookupByLibrary.simpleMessage('**Help us** discern what\'s **useful** from what\'s **useless** by sharing **anonymous** usage data.\n*Note: no third party (ie google, facebook..) is involved in our data analytics strategy.*'),
    'formCGU': MessageLookupByLibrary.simpleMessage('*By proceeding, **you explicitly agree** that you are acting in coordinance with local, state, and federal or national laws. **SuperGreenLab will not be liable** for\nconsequences surrounding the legality of how the app, lights or grow bundle are used. '),
    'instructionsAutoScheduleHelper': MessageLookupByLibrary.simpleMessage('Auto flower plants are a special type of strain that **won’t require light schedule change** in order to start flowering. Their vegetative stage duration **can’t be controlled**, and varies from one plant to another.'),
    'instructionsBloomScheduleHelper': MessageLookupByLibrary.simpleMessage('**Bloom stage** is the phase where the plant develops its flowers. It requires **at most 12h lights per days**, usual setting is **12h** per day.'),
    'instructionsBlowerHumidityModeDescription': MessageLookupByLibrary.simpleMessage('This is the **Humidity based blower control**, in this mode the blower is **in sync with the box humidity sensor**.'),
    'instructionsBlowerTemperatureModeDescription': MessageLookupByLibrary.simpleMessage('This is the **Temperature based blower control**, in this mode the blower is **in sync with the box temperature sensor**.'),
    'instructionsBlowerTimerModeDescription': MessageLookupByLibrary.simpleMessage('This is the **timer based blower control**, in this mode the blower is **in sync with the light timer**. Perfect if the box doesn\'t have a temperature sensor.\n\nEx: when the timer says 100% (which means all lights are on), it will set the blower power at the **blower day** value below.'),
    'instructionsExistingDevice': MessageLookupByLibrary.simpleMessage('Please make sure your **mobile phone** is **connected to your home wifi**.\nThen we\'ll search for it **by name** or **by IP**, please **fill** the following text field.'),
    'instructionsExistingDeviceTitle': MessageLookupByLibrary.simpleMessage('Enter controller name or IP'),
    'instructionsFanHumidityModeDescription': MessageLookupByLibrary.simpleMessage('This is the **Humidity based fan control**, in this mode the fan is **in sync with the box humidity sensor**.\n\nMake sure your motor port is configured in the settings.'),
    'instructionsFanTemperatureModeDescription': MessageLookupByLibrary.simpleMessage('This is the **Temperature based fan control**, in this mode the fan is **in sync with the box temperature sensor**.\n\nMake sure your motor port is configured in the settings.'),
    'instructionsFanTimerModeDescription': MessageLookupByLibrary.simpleMessage('This is the **timer based fan control**, in this mode the fan is **in sync with the light timer**. Perfect if the box doesn\'t have a temperature sensor.\n\nEx: when the timer says 100% (which means all lights are on), it will set the fan power at the **fan day** value below.\n\nMake sure your motor port is configured in the settings.'),
    'instructionsManualTimerBlowerModeDescription': MessageLookupByLibrary.simpleMessage('This is the **manual blower control** mode, just set a value and the blower will stay at this power.'),
    'instructionsManualTimerFanModeDescription': MessageLookupByLibrary.simpleMessage('This is the **manual fan control** mode, just set a value and the fan will stay at this power.\n\nMake sure your motor port is configured in the settings.'),
    'instructionsNewDeviceWifiFailed': MessageLookupByLibrary.simpleMessage('**Couldn\'t connect** to the 🤖🍁 wifi! Please go to your **mobile phone settings** to connect manually with the **following credentials**:'),
    'instructionsNewDeviceWifiFailed2': MessageLookupByLibrary.simpleMessage('SSID: 🤖🍁\nPassword: multipass'),
    'instructionsNewDeviceWifiFailed3': MessageLookupByLibrary.simpleMessage('Then press the **DONE** button below'),
    'instructionsVegScheduleHelper': MessageLookupByLibrary.simpleMessage('**Vegetative stage** is the phase between germination and blooming, the plant **grows and develops** it’s branches. It requires **at least 13h lights per days**, usual setting is **18h** per day.'),
    'ledTestingChannelTitle': MessageLookupByLibrary.simpleMessage('Light'),
    'ledTestingInstructions': MessageLookupByLibrary.simpleMessage('Press a led channel\nto switch it on/off:'),
    'ledTestingPageTitle': MessageLookupByLibrary.simpleMessage('NEW BOX SETUP'),
    'ledTestingValidate': MessageLookupByLibrary.simpleMessage('OK, ALL GOOD'),
    'loading': MessageLookupByLibrary.simpleMessage('Loading...'),
    'loginCreateAccount': MessageLookupByLibrary.simpleMessage('LOGIN / CREATE ACCOUNT'),
    'loginRequiredDialogBody': MessageLookupByLibrary.simpleMessage('Please log in or create an account.'),
    'loginRequiredDialogTitle': MessageLookupByLibrary.simpleMessage('Login required'),
    'mainNavigatorUnknownRoute': MessageLookupByLibrary.simpleMessage('Unknown route'),
    'newDeviceAutoConnect': MessageLookupByLibrary.simpleMessage('Trying to connect\nautomatically'),
    'newDevicePageEmojiWifiSectionTitle': MessageLookupByLibrary.simpleMessage('Connecting to controller\'s wifi'),
    'newDevicePageTitle': MessageLookupByLibrary.simpleMessage('Add controller'),
    'no': MessageLookupByLibrary.simpleMessage('NO'),
    'notificationPurposes': MessageLookupByLibrary.simpleMessage('You will get notified for:\n- **Likes** on comments and public diary entry\n- **Comments** on public diary entries\n- **Replies** to your comments\n- **Smart reminders** and **grow tips**\n- **Temperature** and **humidity** alerts'),
    'notificationRequestButton': MessageLookupByLibrary.simpleMessage('NOTIFY ME'),
    'notificationRequestButtonCancel': MessageLookupByLibrary.simpleMessage('NO THANKS'),
    'notificationRequestTitle': MessageLookupByLibrary.simpleMessage('Would you like to activate notifications?'),
    'ok': MessageLookupByLibrary.simpleMessage('OK'),
    'or': MessageLookupByLibrary.simpleMessage('OR'),
    'plantDrawerPageAddPlantLabel': MessageLookupByLibrary.simpleMessage('Add new plant'),
    'plantDrawerPagePlantList': MessageLookupByLibrary.simpleMessage('Plant list'),
    'plantFeedPageAddFirstPlantPart1': MessageLookupByLibrary.simpleMessage('Add your first'),
    'plantFeedPageAddFirstPlantPart2': MessageLookupByLibrary.simpleMessage('PLANT'),
    'plantFeedPageArchived': MessageLookupByLibrary.simpleMessage('Plant was removed or archived.'),
    'plantFeedPageLoading': MessageLookupByLibrary.simpleMessage('Loading plant..'),
    'plantFeedPageMenuBending': MessageLookupByLibrary.simpleMessage('Bending'),
    'plantFeedPageMenuBlooming': MessageLookupByLibrary.simpleMessage('Blooming'),
    'plantFeedPageMenuCuring': MessageLookupByLibrary.simpleMessage('Curing'),
    'plantFeedPageMenuDefoliation': MessageLookupByLibrary.simpleMessage('Defoliation'),
    'plantFeedPageMenuDrying': MessageLookupByLibrary.simpleMessage('Drying'),
    'plantFeedPageMenuFimming': MessageLookupByLibrary.simpleMessage('Fimming'),
    'plantFeedPageMenuGerminating': MessageLookupByLibrary.simpleMessage('Germinating'),
    'plantFeedPageMenuGrowlog': MessageLookupByLibrary.simpleMessage('Grow log'),
    'plantFeedPageMenuLifeEvents': MessageLookupByLibrary.simpleMessage('Life events'),
    'plantFeedPageMenuMeasure': MessageLookupByLibrary.simpleMessage('Measure'),
    'plantFeedPageMenuNutrientMix': MessageLookupByLibrary.simpleMessage('Nutrient mix'),
    'plantFeedPageMenuPlantTraining': MessageLookupByLibrary.simpleMessage('Plant training'),
    'plantFeedPageMenuTopping': MessageLookupByLibrary.simpleMessage('Topping'),
    'plantFeedPageMenuTransplant': MessageLookupByLibrary.simpleMessage('Transplant'),
    'plantFeedPageMenuVegging': MessageLookupByLibrary.simpleMessage('Vegging'),
    'plantFeedPageMenuWatering': MessageLookupByLibrary.simpleMessage('Watering'),
    'plantFeedPageNoPlantYet': MessageLookupByLibrary.simpleMessage('You have no plant yet.'),
    'plantFeedPageOpenPlantMenu': MessageLookupByLibrary.simpleMessage('OPEN PLANT LIST'),
    'plantFeedPageSingleEntry': MessageLookupByLibrary.simpleMessage('Viewing single log entry'),
    'plantFeedPageSingleEntryButton': MessageLookupByLibrary.simpleMessage('View complete diary'),
    'plantFeedPageStart': MessageLookupByLibrary.simpleMessage('START'),
    'plantFeedPageTitle': MessageLookupByLibrary.simpleMessage('Plant feed'),
    'plantPickerPageSelectButton': m21,
    'productTypePageSelectCategoryNextButton': MessageLookupByLibrary.simpleMessage('NEXT'),
    'productTypePageSelectCategorySectionTitle': MessageLookupByLibrary.simpleMessage('Please choose the new product\'s\ncategory.'),
    'productsPageLoadingPlantData': MessageLookupByLibrary.simpleMessage('Loading plant data'),
    'productsPageTitle': MessageLookupByLibrary.simpleMessage('Toolbox'),
    'productsPageToolboxBy': MessageLookupByLibrary.simpleMessage('by '),
    'productsPageToolboxEmpty': MessageLookupByLibrary.simpleMessage('Toolbox is empty'),
    'productsPageToolboxEmptyOwnPlant': MessageLookupByLibrary.simpleMessage('Toolbox is empty\nuse the “+” above to add your first item.'),
    'productsPageToolboxInstructions': MessageLookupByLibrary.simpleMessage('List the items you used for this grow for future reference and/or kowledge sharing.'),
    'publicPlantPageSingleEntry': MessageLookupByLibrary.simpleMessage('Viewing single log entry'),
    'publicPlantPageSingleEntryButton': MessageLookupByLibrary.simpleMessage('View complete diary'),
    'redBarSyncingProgress': m22,
    'refreshParametersPageControllerRefreshed': m23,
    'refreshParametersPageLoading': MessageLookupByLibrary.simpleMessage('Refreshing..'),
    'saving': MessageLookupByLibrary.simpleMessage('Saving...'),
    'selectBoxPageAddNewGreenLab': MessageLookupByLibrary.simpleMessage('Add new green lab'),
    'selectBoxPageCreateFirst': MessageLookupByLibrary.simpleMessage('Create your first'),
    'selectBoxPageCreateFirstLab': MessageLookupByLibrary.simpleMessage('GREEN LAB'),
    'selectBoxPageCreateLabButton': MessageLookupByLibrary.simpleMessage('CREATE'),
    'selectBoxPageNoLab': MessageLookupByLibrary.simpleMessage('You have no lab yet'),
    'selectBoxPageTapSelect': MessageLookupByLibrary.simpleMessage('Tap to select'),
    'selectDeviceAdd': MessageLookupByLibrary.simpleMessage('ADD'),
    'selectDeviceAddFirst': MessageLookupByLibrary.simpleMessage('Add a first'),
    'selectDeviceAddFirstController': MessageLookupByLibrary.simpleMessage('CONTROLLER'),
    'selectDeviceBoxAlreadyRunning': MessageLookupByLibrary.simpleMessage('Already running'),
    'selectDeviceBoxAvailable': MessageLookupByLibrary.simpleMessage('Available'),
    'selectDeviceBoxLedChannelDescription': m24,
    'selectDeviceBoxNoLedChannelAssigned': MessageLookupByLibrary.simpleMessage('No led channels assigned'),
    'selectDeviceBoxNoMoreLED': MessageLookupByLibrary.simpleMessage('No more free led channels'),
    'selectDeviceBoxNumber': m25,
    'selectDeviceBoxResetDialogTitle': m26,
    'selectDeviceBoxSettingUp': MessageLookupByLibrary.simpleMessage('Setting up..'),
    'selectDeviceBoxSlot': MessageLookupByLibrary.simpleMessage('Select controller\'s box slot'),
    'selectDeviceContinueWithoutController': MessageLookupByLibrary.simpleMessage('Continue without controller'),
    'selectDeviceDIYNow': MessageLookupByLibrary.simpleMessage('DIY NOW'),
    'selectDeviceDeleteControllerDialogBody': MessageLookupByLibrary.simpleMessage('This can\'t be reverted. Continue?'),
    'selectDeviceDeleteControllerDialogTitle': m27,
    'selectDeviceListItemInstruction': MessageLookupByLibrary.simpleMessage('Tap to select'),
    'selectDeviceListTitle': MessageLookupByLibrary.simpleMessage('Select a controller below'),
    'selectDeviceNewBoxAvailableLEDChannels': MessageLookupByLibrary.simpleMessage('Available LED channels'),
    'selectDeviceNewBoxLEDChannel': MessageLookupByLibrary.simpleMessage('LED chan'),
    'selectDeviceNewBoxNoMoreBox': MessageLookupByLibrary.simpleMessage('Device can\'t handle\nmore box!'),
    'selectDeviceNewBoxSelectedLEDChannels': MessageLookupByLibrary.simpleMessage('Selected LED channels'),
    'selectDeviceNewBoxSettingUp': MessageLookupByLibrary.simpleMessage('Setting up..'),
    'selectDeviceNewBoxSetupBox': MessageLookupByLibrary.simpleMessage('SETUP BOX'),
    'selectDeviceNewBoxSetupEmptyBox': MessageLookupByLibrary.simpleMessage('SETUP EMPTY BOX'),
    'selectDeviceNewController': MessageLookupByLibrary.simpleMessage('NEW CONTROLLER'),
    'selectDeviceNoController': MessageLookupByLibrary.simpleMessage('You have no controller\nfor your new lab.'),
    'selectDeviceOr': MessageLookupByLibrary.simpleMessage('OR'),
    'selectDeviceShopNow': MessageLookupByLibrary.simpleMessage('SHOP NOW'),
    'selectDeviceSkipAddDevice': MessageLookupByLibrary.simpleMessage('NO SGL DEVICE'),
    'settingParameters': MessageLookupByLibrary.simpleMessage('Setting parameters..'),
    'settingsDayAlertPageInstructions': MessageLookupByLibrary.simpleMessage('Day alert settings are used while the lights are on.'),
    'settingsDeviceAuthPageAuthError': MessageLookupByLibrary.simpleMessage('Old login/password doesn\'t match. Make sure the controller is on the same wifi network.'),
    'settingsDeviceAuthPageControllerDone': m28,
    'settingsDeviceAuthPagePasswordInstructions': MessageLookupByLibrary.simpleMessage('You can **setup a password** to prevent unauthorized parameter changes on your controller.\n\n*Please keep in mind that this is by no mean top-notch security. Mostly an anti-curious roommate/brother feature. Local network communication is not using https so subject to mitm.*'),
    'settingsDeviceAuthPagePasswordInstructionsNeedsUpgrade': MessageLookupByLibrary.simpleMessage('**Please upgrade your controller** to enable password lock.**Go back to the previous screen** and tap the **\"Firmware upgrade\"** button.\n\nYou can **setup a password** to prevent unauthorized parameter changes on your controller.\n\n*Please keep in mind that this is by no mean top-notch security. Mostly an anti-curious roommate/brother feature. Local network communication is not using https so subject to mitm.*'),
    'settingsDeviceAuthPagePasswordWarning': MessageLookupByLibrary.simpleMessage('Don\'t use your important password here.'),
    'settingsDevicePageControllerDone': m29,
    'settingsDevicePageControllerNameSection': MessageLookupByLibrary.simpleMessage('Controller name'),
    'settingsDevicePageControllerSettingsSection': MessageLookupByLibrary.simpleMessage('Settings'),
    'settingsDevicePageLoading': MessageLookupByLibrary.simpleMessage('Refreshing..'),
    'settingsDevicePageWifiConfigFailed': MessageLookupByLibrary.simpleMessage('Wifi config change failed'),
    'settingsDevicePageWifiConfigSuccess': MessageLookupByLibrary.simpleMessage('Wifi config changed successfully'),
    'settingsDevicePageWifiSettingsLabel': MessageLookupByLibrary.simpleMessage('Change your controller\'s wifi config'),
    'settingsDevicePageWifiSettingsSection': MessageLookupByLibrary.simpleMessage('Wifi config'),
    'settingsDeviceSetupPagePasswordInstructions': MessageLookupByLibrary.simpleMessage('This controller is password protected, please enter the login/password below.'),
    'settingsNightAlertPageInstructions': MessageLookupByLibrary.simpleMessage('Night alert settings are used while the lights are off.'),
    'settingsPlantAlertPageInstructions': MessageLookupByLibrary.simpleMessage('**No need to constantly check the plant monitoring!** Just setup your alerts, and the app will tell you when something\'s wrong.'),
    'settingsPlantAlertPageLoading': MessageLookupByLibrary.simpleMessage('Loading'),
    'settingsPlantAlertPageSectionTitle': MessageLookupByLibrary.simpleMessage('Alert settings'),
    'settingsPlantAlertPageTitle': MessageLookupByLibrary.simpleMessage('Alerts'),
    'settingsRemoteControlPageControllerDone': m30,
    'settingsRemoteControlPageInstructions': MessageLookupByLibrary.simpleMessage('**Remote control requires to pair your mobile phone**. Please keep in mind: for now only **one** mobile phone can be paired at a time.'),
    'settingsRemoteControlPageInstructionsNeedUpgrade': MessageLookupByLibrary.simpleMessage('**Please upgrade your controller** to enable remote control.\n\n**Go back to the previous screen** and tap the **\"Firmware upgrade\"** button.'),
    'settingsRemoteControlPagePleaseLoginDialogBody': MessageLookupByLibrary.simpleMessage('Login is required to enable remote control.'),
    'settingsRemoteControlPagePleaseLoginDialogTitle': MessageLookupByLibrary.simpleMessage('Login required'),
    'socialBarPagePageLikedBy': m31,
    'testLEDTiming': m32,
    'testingLEDDone': MessageLookupByLibrary.simpleMessage('Testing done'),
    'testingLEDTitle': MessageLookupByLibrary.simpleMessage('Testing LED'),
    'title': MessageLookupByLibrary.simpleMessage('SuperGreenLab'),
    'towelieHelperAddDevice': MessageLookupByLibrary.simpleMessage('**Good**.\nNow this is when you should **plug the controller to its power supply** if not already.\nThen you will choose one of the options above to **connect to the controller**.'),
    'towelieHelperAddExistingDevice': MessageLookupByLibrary.simpleMessage('Ok, so your controller is **already running** and **connected to your home wifi**, let\'s search for it over the network!\nEnter the **name you gave it last time** (default is **supergreencontroller**), if you can\'t remember it, you can also type its **IP address**.\nThe **IP address** can be easily found on your **router\'s home page**.\nTo **access your router\'s homepage**: take the **IP** address of your **mobile phone** or **laptop**, replace the last digit by **1** and **type that** in a browser.'),
    'towelieHelperCreateLab': MessageLookupByLibrary.simpleMessage('Now we\'re creating our **first Lab**!\nA lab is where you **simulate a tiny ecosystem**\nwith artificial **lights and ventilation**.'),
    'towelieHelperCreatePlant': MessageLookupByLibrary.simpleMessage('Hey man, **tuto to the plant creation process**, I\'ll be there to guide you through it.\nFirst step is to **give your new plant a name**.'),
    'towelieHelperDeviceWifi': MessageLookupByLibrary.simpleMessage('**While not mandatory**, connecting your controller to your home wifi has a few benefits:\n- receive software **upgrade** and bug fixes\n- remote **monitoring**\n- remote **control**'),
    'towelieHelperFormMeasure': MessageLookupByLibrary.simpleMessage('This is the **measuring tool**, while not perfectly accurate, it will still give you a **good hint for your next grow**. And as a **bonus feature**, it does **timelapses** of all the measures you\'ve taken!'),
    'towelieHelperFormMeasure2': MessageLookupByLibrary.simpleMessage('It\'s the **first time** you\'re using it, so there is no \"before\" picture **to compare to**. Take a pic of what you **want to measure**, and take a measure again in **a few days** to have a **difference**.'),
    'towelieHelperFormMeasure3': MessageLookupByLibrary.simpleMessage('Looks like you **already took a measure**, you can select it in the **\"Previous measures\"** section, then press the **\"Today\'s measure\"** button to add a new measure. The previous one will be **displayed as a transparent overlay** for more accuracy.'),
    'towelieHelperFormTakePic': MessageLookupByLibrary.simpleMessage('Welcome to the **take pic** page, this screen is to take picture of your plant **and note observations**. **You\'ll be glad you took pictures regularly during your next grow!**'),
    'towelieHelperMeasureAfterStretch': MessageLookupByLibrary.simpleMessage('**Hey**! it might be a good idea to **take a measure** of your plant to **monitor the stretch**.'),
    'towelieHelperMeasureReminder': MessageLookupByLibrary.simpleMessage('Do you want me to **set a reminder** so you don\'t forget to take a measure again soon?'),
    'towelieHelperSelectDevice': MessageLookupByLibrary.simpleMessage('Alright, now that your plant has a name we can **start its configuration**:)\nIf you own a **SuperGreenLab bundle**, you need to tell the app **which controller will control the plant\'s lights, ventilation and sensors**.\nBecause it\'s all brand new, let\'s first **setup a new controller**.\nIf you don\'t own a bundle, you can skip this by pressing \"NO SGL DEVICE\".'),
    'towelieHelperSelectNewPlantDeviceBox': MessageLookupByLibrary.simpleMessage('Ok, this is where we\'ll choose which of the **controller\'s LED channel** will be used to light up the plant.\nTo **better understand** you should have your LED panels **connected to the controller**.'),
    'towelieHelperSelectPlantDeviceBox': MessageLookupByLibrary.simpleMessage('Your controller can **manage up to 3 boxes**, select an **already configured** box above, or create a **new one**.'),
    'towelieHelperTestDevice': MessageLookupByLibrary.simpleMessage('This test is to make sure everything is working, **connect** your **LED** panels **to the controller** if not already.'),
    'towelieHelperWaterReminder': MessageLookupByLibrary.simpleMessage('Do you want me to **set a reminder** so you don\'t forget to water again soon?'),
    'toweliePlantGermination': MessageLookupByLibrary.simpleMessage('Ok, place your seed in water, follow the guide, and press the \"germinated\" button below\nwhen you\'re ready to place the seed in its growing medium.'),
    'toweliePlantPhase': MessageLookupByLibrary.simpleMessage('Alright tell me at **which stage** the plant is at.\nIs it already **vegging** or still **just a seed**?'),
    'toweliePlantStartSeedling': MessageLookupByLibrary.simpleMessage('Alright, let me know when you\'re **ready to put the seed to germinate** by pressing the **start** button below.\nIn the meantime you can also **create an account**:P that will enable backups, remote control, sharing, etc...'),
    'toweliePlantTutoTakePic': MessageLookupByLibrary.simpleMessage('Alright **let\'s start**!\nOne first thing you can do to **start** this journey is to **take a picture** of your **plant**.'),
    'toweliePlantType': MessageLookupByLibrary.simpleMessage('To better guide you to a **successful harvest**, I\'ll need a bit **more informations** about your plant.\nIs this plant an **auto** or **photo** strain?'),
    'towelieWelcomePlant': MessageLookupByLibrary.simpleMessage('**Welcome to your plant feed!**\nThis is where you can **keep a history** of your plant\'s life.\n\nEverytime you **water**, **train**, or even just **observe something** about your plant,\nyou can **add an item** to the feed.\n\nSo you can see the **evolution** of your plant, **repeat it** later, or **share it!**'),
    'unsavedChangeDialogBody': MessageLookupByLibrary.simpleMessage('Changes will not be saved. Continue?'),
    'unsavedChangeDialogTitle': MessageLookupByLibrary.simpleMessage('Unsaved changes'),
    'yes': MessageLookupByLibrary.simpleMessage('YES')
  };
}
