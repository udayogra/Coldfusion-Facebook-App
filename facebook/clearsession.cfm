<cftry>
  <cfset SessionInvalidate()>
  <cfset getPageContext().getSession().invalidate()>
<cfcatch>
 <cflocation url='oauth.cfm'>
</cfcatch>
</cftry>