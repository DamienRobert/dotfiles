# Ajax

http://www.w3schools.com/ajax/ajax_xmlhttprequest_send.asp
http://www.sitepoint.com/guide-vanilla-ajax-without-jquery/
https://developer.mozilla.org/en/docs/Web/API/XMLHttpRequest/Using_XMLHttpRequest

var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","ajax_info.txt",true); //async processing (default)
xmlhttp.send();

With jquery: http://www.w3schools.com/jquery/ajax_ajax.asp

$("button").click(function(){
    $.ajax({url: "demo_test.txt", success: function(result){
        $("#div1").html(result);
    }});
}); 

Promise version: https://scotch.io/bar-talk/five-things-you-can-use-in-es6-today

var url = "http://api.silly.io/api/list/e3da7b3b-976d-4de1-a743-e0124ce973b8?format=json";
var xml = new XMLHttpRequest();
xml.addEventListener('load', function() {
    var result = JSON.parse(this.responseText);
    console.log(result);
});
xml.addEventListener('error',function(error) {
    console.log("something bad happened");
});
xml.open("GET",url);
xml.send();

Becomes
function doGet(url) {
  return new Promise((resolve,rej)=>{
    var xml = new XMLHttpRequest();
    xml.addEventListener('load', function() {
      var result = JSON.parse(this.responseText);
      resolve(result);
    });
    xml.addEventListener('error',function(error) {
      reject(error);
    });
    xml.open("GET",url);
    xml.send();
  });
}
var url = "someapi.com/dostuff?foo=bar";
doGet(url).then((obj)=>{
    console.log(obj);
});
// Cf the new web standard Fetch that does this

# Cookies

http://www.w3schools.com/js/js_cookies.asp
https://developer.mozilla.org/en-US/docs/Web/API/Document/cookie
attributes: path=, domain=
SameSite: https://scotthelme.co.uk/csrf-is-dead/ https://news.ycombinator.com/item?id=13689697

document.cookie="username=John Smith; expires=Thu, 18 Dec 2013 12:00:00 UTC; path=/";
document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC"; //delete

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
    }
    return "";
} 
function checkCookie() {
    var user = getCookie("username");
    if (user != "") {
        alert("Welcome again " + user);
    } else {
        user = prompt("Please enter your name:", "");
        if (user != "" && user != null) {
            setCookie("username", user, 365);
        }
    }
}

jquery plugin: https://github.com/js-cookie/js-cookie

Nice library to handle cookies:
https://developer.mozilla.org/en-US/docs/Web/API/Document/cookie

XSS: http://www.nczonline.net/blog/2009/05/12/cookies-and-security/

# Web Storage
https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API/Using_the_Web_Storage_API
