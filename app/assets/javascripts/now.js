function myFunction() {
    document.getElementById("dem").innerHTML = Date();
}

function ajaxcall(){
var xmlhttp;
xmlhttp= new XMLHttpRequest();	
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("dem").innerHTML="hell";
    }
  }
	xmlhttp.open("GET","#",true);
xmlhttp.send();
};
