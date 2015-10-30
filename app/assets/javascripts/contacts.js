var showAll = function(){
  $(".firstName").each(function(){
    $(this).parent().fadeIn();
  })
};

var comActive = false;
var comChecker = function(){
  if (!comActive) {
    comActive = true;
    var emails = $(".email");
    for (var i = 0; i < emails.length; i++ ) {
      var currentEmail = $(emails[i]).text();
      if (currentEmail.substr(currentEmail.length - 4) !== ".com"){
        $(emails[i]).parent().fadeOut();
      }
    }
  } else {
    comActive = false;
    var emails = $(".email");
    for (var i = 0; i < emails.length; i++ ) {
      var currentEmail = $(emails[i]).text();
      if (currentEmail.substr(currentEmail.length - 4) !== ".com"){
        $(emails[i]).parent().fadeIn();
      }
    }
  }
};

var extensionActive = false;
var extensionChecker = function(){
  if(!extensionActive) {
    extensionActive = true;
    var phoneNumbers = $(".phone");
    for (var i = 0; i < phoneNumbers.length; i++) {
      var currentPhone = $(phoneNumbers[i]).text();
      if (currentPhone.indexOf("x") === -1){
        $(phoneNumbers[i]).parent().fadeOut();
      }
    }
  } else {
    extensionActive = false;
    var phoneNumbers = $(".phone");
    for (var i = 0; i < phoneNumbers.length; i++) {
      var currentPhone = $(phoneNumbers[i]).text();
      if (currentPhone.indexOf("x") === -1){
        $(phoneNumbers[i]).parent().fadeIn();
      }
    }
  }
};

var internationalActive = false;
var internationalChecker = function(){
  if (!internationalActive) {
    internationalActive = true;
    var phoneNumbers = $(".phone");
    for (var i = 0; i < phoneNumbers.length; i++) {
      var currentPhone = $(phoneNumbers[i]).text();
      if (usAreaCodes.indexOf(currentPhone.substr(0,3)) !== -1){
        $(phoneNumbers[i]).parent().fadeOut();
      }
    }
  } else {
    internationalActive = false;
    var phoneNumbers = $(".phone");
    for (var i = 0; i < phoneNumbers.length; i++) {
      var currentPhone = $(phoneNumbers[i]).text();
      if (usAreaCodes.indexOf(currentPhone.substr(0,3)) !== -1){
        $(phoneNumbers[i]).parent().fadeIn();
      }
    }
  }
};

var sortByEMail = function(){
  var array = [];
  var emails = $(".email");
  for (var i = 0; i < emails.length; i++){
    var currentEmail = $(emails[i]).text();
    array.push(currentEmail);
  }
  array.sort()
  for (var i = 0; i < array.length; i++){
    var nextEmail = $('p.email:contains(' + array[i] + '):nth-child(3)').parent()
    nextEmail.remove()
    $(".contacts").append(nextEmail)
  }
}

$(document).ready(function(){
  $(".all").click(function(){
    showAll();
  })

  $(".international").click(function(){
    internationalChecker();
    $(this).toggleClass("active_button")
  })

  $(".extensions").click(function(){
    extensionChecker();
    $(this).toggleClass("active_button")
  })

  $(".com").click(function(){
    comChecker();
    $(this).toggleClass("active_button")
  })

  $(".sortEmail").click(function(){
    sortByEMail();
  })
})

// just want to throw it out there that this makes me cringe on the inside
var usAreaCodes = ["205", "251", "256", "334", "938", "907", "684", "480", "520", "602", "623", "928", "479", "501", "870", "209",
213, "310", "323", "408", "415", "424", "442", "510", "530", "559", "562", "619", "626", "650", "657", "661", "669", "707", "714", "747",
760, "805", "818", "831", "858", "909", "916", "925", "949", "951", "303", "719", "720", "970", "203", "475", "860", "302", "239", "305",
561, "727", "754", "772", "786", "813", "850", "863", "904", "941", "954", "229", "404", "470", "478", "678", "706", "762", "770", "912",
671, "808", "208", "217", "224", "309", "312", "331", "618", "630", "708", "773", "779", "815", "847", "872", "219", "260", "317", "574",
765, "812", "319", "515", "563", "641", "712", "316", "620", "785", "913", "270", "502", "606", "859", "225", "318", "337", "504", "985",
207, "240", "301", "410", "443", "667", "339", "351", "413", "508", "617", "774", "781", "857", "978", "231", "248", "269", "313", "517",
586, "616", "734", "810", "906", "947", "989", "218", "320", "507", "612", "651", "763", "952", "228", "601", "662", "769", "314", "417",
573, "636", "660", "816", "406", "308", "402", "531", "702", "725", "775", "603", "201", "551", "609", "732", "848", "856", "862", "908",
973, "505", "575", "212", "315", "347", "516", "518", "585", "607", "631", "646", "716", "718", "845", "914", "917", "929", "252", "336",
704, "828", "910", "919", "980", "984", "701", "670", "216", "234", "330", "419", "440", "513", "567", "614", "740", "937", "405", "539",
580, "918", "458", "503", "541", "971", "215", "267", "272", "412", "484", "570", "610", "717", "724", "814", "878", "787", "939", "401",
803, "843", "864", "605", "423", "615", "731", "865", "901", "931", "210", "214", "254", "281", "325", "346", "361", "409", "430", "432",
469, "512", "682", "713", "737", "806", "817", "830", "832", "903", "915", "936", "940", "956", "972", "979", "385", "435", "801", "802",
340, "276", "434", "540", "571", "703", "757", "804", "206", "253", "360", "425", "509", "202", "304", "681", "262", "414", "534", "608",
715, "920", "307", "321", "352", "386", "407"];
