<cfset thisPath=ExpandPath("*.*")>
<cfset thisDirectory=GetDirectoryFromPath(thisPath)>


<cfhttp  url="https://graph.facebook.com/me/photos?access_token=#SESSION.fbinfo.access_token#" method="post" multipart="yes">
   <cfhttpparam type="file" name="source" file="#thisDirectory#\final.jpg">
</cfhttp>

<cfset session.posted = 'true'>
<cflocation url="oauth.cfm?posted=true">
