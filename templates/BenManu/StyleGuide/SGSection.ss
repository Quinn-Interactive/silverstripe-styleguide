<div id="$ReferenceID" class="sg-section">
    <$Heading class="sg-section__title">$Title</$Heading>
    <div class="sg-section__description">$Description</div>
    <% if $Parameters %>
        <ul class="sg-section__parameters">
            <% loop $Parameters %>
                <li class="sg-section__paremater"><em>$Name</em> - $Description</li>
            <% end_loop %>
        </ul>
    <% end_if %>
    <% if $Compatibility %>
        <div class="sg-section__compatibility">
            <p>$Compatibility</p>
        </div>
    <% end_if %>
    <% if $Experimental %>
        <div class="sg-section__experimental">
            <p>$Experimental</p>
        </div>
    <% end_if %>
    <% if $Deprecated %>
        <div class="sg-section__deprecated">
            <p>$Deprecated</p>
        </div>
    <% end_if %>

    <% if $getTemplate %>
        <% if $ResponsivePlayground %>
            <% include BenManu/StyleGuide/Includes/SGExampleIframe Markup=$getTemplate, Srcdoc=$Iframeify($getTemplate).RAW, Reference=$ReferenceID, NoPadIframe=$NoPadIframe %>
        <% else %>
            <% include BenManu/StyleGuide/Includes/SGExample Markup=$getTemplate, Reference=$ReferenceID, NoPadIframe=$NoPadIframe %>
        <% end_if %>
    <% end_if %>

    <% if $MarkupNormal %>
        <% if $ResponsivePlayground %>
            <% include BenManu/StyleGuide/Includes/SGExampleIframe Markup=$MarkupNormal, Srcdoc=$Iframeify($MarkupNormal).RAW, Reference=$ReferenceID, NoPadIframe=$NoPadIframe %>
        <% else %>
            <% include BenManu/StyleGuide/Includes/SGExample Markup=$MarkupNormal, Reference=$ReferenceID, NoPadIframe=$NoPadIframe %>
        <% end_if %>
    <% end_if %>

    <% if $Modifiers %>
        <div class="sg-section__modifiersLabel">Modifiers</div>
        <% loop $Modifiers %>
            <div id="$Reference" class="sg-section__modifiersLabel"><strong>$Name</strong> - $Description</div>
            <% if $Up.ResponsivePlayground %>
                <% include BenManu/StyleGuide/Includes/SGExampleIframe Markup=$ExampleHtml, Srcdoc=$Up.Iframeify($ExampleHtml).RAW, Reference=$Reference, NoPadIframe=$NoPadIframe %>
            <% else %>
                <% include BenManu/StyleGuide/Includes/SGExample Markup=$ExampleHtml, Reference=$Reference, NoPadIframe=$NoPadIframe %>
            <% end_if %>
        <% end_loop %>
    <% end_if %>
</div>
