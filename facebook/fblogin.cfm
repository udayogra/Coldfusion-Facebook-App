 <cfdump var='#URL.state#' output='console'>
 
 <cfoauth type="facebook" clientid='567095893312079'  
 secretkey="YOUR_SECRET_KEY_HERE" state="#URL.state#" result="r" scope="" redirecturi="http://localhost:8500/fbapp/facebook/fblogin.cfm">
 
 
<cfset Session.fbinfo = #r#>
<cflocation url = "oauth.cfm">
