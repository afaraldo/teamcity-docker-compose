<#-- Uses FreeMarker template syntax, template guide can be found at http://freemarker.org/docs/dgui.html -->

<#import "common.ftl" as common>

<#global subject>[<@common.subjMarker/> FAILED] ${project.name}:${buildType.name} - Build: ${build.buildNumber}</#global>

<#global body>TeamCity build: ${project.name}:${buildType.name} - Build: ${build.buildNumber} failed ${var.buildShortStatusDescription}.
Agent: ${agentName}
Build results: ${link.buildResultsLink}

${var.buildCompilationErrors}${var.buildFailedTestsErrors}${var.buildChanges}

 <#list build.buildLog.messages[1..] as message><#-- skipping the first message (it is a root node)-->
   <p>${message.text}</p>
 </#list>

<@common.footer/></#global>

<#global bodyHtml>
<div>
  <div>
    TeamCity build: <i>${project.name}:${buildType.name} - <a href='${link.buildResultsLink}'>Build: ${build.buildNumber}</a></i> failed
    ${var.buildShortStatusDescription}
  </div>
  <@common.build_agent build/>
  <@common.build_comment build/>
  <br>
  <@common.build_changes var.changesBean/>
  <@common.compilation_errors var.compilationBean/>
  <@common.test_errors var.failedTestsBean/>

 <#list build.buildLog.messages[1..] as message><#-- skipping the first message (it is a root node)-->
   <p>${message.text}</p>
 </#list>

  <@common.footerHtml/>
</div>
</#global>
