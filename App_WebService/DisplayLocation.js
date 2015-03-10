
function HelloWorld() {
    DisplayLocation.HelloWorld(SucceededCallback);
}

function SearchLocation(MC, count) {
    DisplayLocation.SearchLocation(MC,count,SucceededCallback)
}

function DisplayLocationByZipCode(ZipCode) {
    DisplayLocation.LocationByZipCode(ZipCode, SucceededCallback)
}

function DisplayProvince(ID) {
    DisplayLocation.DisplayProvince(ID, SucceededCallback)
}

function SucceededCallback(result, eventArgs) {
    // Page element to display feedback.
    //var RsltElem = document.getElementsByTagName("ResultId");
    //RsltElem.innerHTML = result;
    alert(result[0]);
}

function GetTime() {
    DisplayLocation.GetServerTime(SucceededCallback);
}

if (typeof (Sys) !== "undefined") Sys.Application.notifyScriptLoaded();