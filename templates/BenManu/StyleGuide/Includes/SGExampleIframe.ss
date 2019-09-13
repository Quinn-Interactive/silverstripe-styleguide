<div class="sg-example" data-sg-resizable data-x=0 data-y=0 >
    <div class="sg-example__example<% if $NoPadIframe %> -nopad<% end_if %>" data-sg-iframe-wrapper>
        <iframe class="sg-example__iframe" srcdoc="$Iframeify($Markup).RAW" data-sg-iframe="sg-iframe-$Reference"></iframe>
    </div>
    <% include BenManu/StyleGuide/Includes/SGExampleControls Markup=$Markup, Reference=$Reference, FileSource=$FileSource, ShowWidth=1 %>
    <% include BenManu/StyleGuide/Includes/SGExampleMarkup Markup=$Markup, Reference=$Reference %>
    <% include BenManu/StyleGuide/Includes/SGExampleStyles FileSource=$FileSource, Pathname=$Pathname, Reference=$Reference %>
</div>
