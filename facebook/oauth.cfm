<link rel="stylesheet" type="text/css" href="buttons.css"/>
<link rel="stylesheet" type="text/css" href="demo.css"/>
<script src="https://fbapps.j.layershift.co.uk/fbanalyzer//js/pace.min.js"></script>
		
		<link rel="stylesheet" href="https://fbapps.j.layershift.co.uk/fbanalyzer//css/pace-theme-barber-shop.css">
		<link rel="stylesheet" href="https://fbapps.j.layershift.co.uk/fbanalyzer//css/pace-theme-loading-bar.css">
		

<script>

function proceed()
{
   window.top.location='fblogin.cfm?state=' + document.getElementById('border').value + ',' + document.getElementById('color').value + ',' + document.getElementById('angle').value + ',' + document.getElementById('width').value + ',' + document.getElementById('height').value + ',' + document.getElementById('blur').value  + ',' + document.getElementById('textsize').value ;
}

</script>

<h1>Play with your display pic </h1><br>
<br><Br><Br>
<cfset thisPath=ExpandPath("*.*")>
<cfset thisDirectory=GetDirectoryFromPath(thisPath)>

<div style='margin:0 auto;width:900px;'>

<!---Facebook --->

<div class="commentbox" style='float:left'>

<input type="button" value="Generate Your Image"
					onclick="proceed()" style="cursor: pointer;" class="button blue morph">
<br><Br>
Enter border width: <input type='text' id='border' value='20'><Br><Br>
Enter rotation angle : <input type='text' id='angle' value='90'><Br><Br>
Enter border color : <input type='text' id='color' value='red'><Br><Br>
Enter resize width : <input type='text' id='width' value='300'><br><Br>
Enter resize height : <input type='text' id='height' value='300'><br><br>
Enter Blur amount : <input type='text' id='blur' value='7'><br><br>
Enter text size : <input type='text' id='textsize' value='20'>
</div>
<cfif isdefined('Session.fbinfo')>
<div class="commentbox" style='float:right'>

<cfif isdefined('Session.fbinfo')>
<cfset rr = Session.fbinfo>
 <cfoutput>
 <b>Here is your result :</b></br>
<cfhttp method="Get" url="http://graph.facebook.com/#rr.id#/picture?type=large" path="#thisDirectory#" file="final.jpg">
<cfhttp url='https://graph.facebook.com/me?fields=id,name&access_token=#rr.access_token#' method='get'>
<cfdump var='#CFHTTP.FileContent#'>
<cfset splits = ListToArray(rr.state)>
<cftry>
<cfimage action='resize' height='#splits[5]#' width='#splits[4]#' source='#thisDirectory#/final.jpg' destination='#thisDirectory#/final.jpg' overwrite=true> 

<cfimage action='rotate' angle='#splits[3]#' source='#thisDirectory#/final.jpg' destination='#thisDirectory#/final.jpg' overwrite=true> 
<cfdump var='#rr.state#'>

<cfimage action='border' thickness='#splits[1]#' color='#splits[2]#' source='#thisDirectory#/final.jpg' destination='#thisDirectory#/final.jpg' overwrite=true> 

<cfimage source="#thisDirectory#/final.jpg" name="image">

<cfset imageblur(image,#splits[6]#)>

<cfset attr = StructNew()>
<cfset attr.underline = "yes">
<cfset attr.size = #splits[7]#>
<cfset attr.style = "bold">
<cfset ImageSetDrawingColor(image,"yellow")>
<cfset imagedrawtext(image,#rr.name#,40,40,attr)>

<cfimage source="#image#" action="write" destination="#thisDirectory#/final.jpg" overwrite="yes">


 <img class="imageswrapper" width="200" height="200" src = "http://localhost:8500/fbapp/facebook/final.jpg"/></br>
 

  <input type="button" value="Upload To Facebook"
					onclick="window.top.location='post.cfm'" style="cursor: pointer;" class="button orange morph"> 
  <br>
  <cfif isdefined('Session.posted') and session.posted eq 'true'>
    <span style='color:green'><b><i>Uploaded to facebook successfully</i></b></span>
    <cfset session.posted = 'false'>
  </cfif>
<cfcatch type='any'>
 <cfdump var='#cfcatch#'>
</cfcatch>
</cftry>

</cfoutput>


</cfif>

</cfif>




<cfif isdefined('session.fbinfo')>

<div class="commentbox" style="height:80;width:170;margin-left:-160;margin-top:40">
 <input type="button" value="Logout"
					onclick="window.open('clearsession.cfm')" style="cursor: pointer;" class="button gray morph"> 
</div>
</cfif>



</div>

