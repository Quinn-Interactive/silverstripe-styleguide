<div id="$ReferenceID" class="sg-section">
    <$Heading class="sg-section__title">$Title</$Heading>
    <p class="sg-section__description">$Description</p>
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
        <div class="sg-example">
            <div class="sg-example__controls">
                <button data-clipboard-text="$Template.XML" title="Click to copy me." class="sg-example__copy">Copy</button>
                <button title="Click to display the code." class="sg-example__toggle">Code</button>
            </div>
            <div class="sg-example__example">
                $getTemplate
            </div>
            <div class="sg-example__code sg-code">
                <pre class="prettyprint">$getTemplate.XML</pre>
            </div>
        </div>
    <% end_if %>

    <% if $MarkupNormal %>
        <div class="sg-example">
            <div class="sg-example__controls">
                <button data-clipboard-text="$MarkupNormal.XML" title="Click to copy me." class="sg-example__copy">Copy</button>
                <button title="Click to display the code." class="sg-example__toggle">Code</button>
            </div>
            <div class="sg-example__example">
                $MarkupNormal
            </div>
            <div class="sg-example__code sg-code">
                <pre class="prettyprint">$MarkupNormal.XML</pre>
            </div>
        </div>
    <% end_if %>

    <% if $Modifiers %>
        <div class="sg-row">
            <div class="sg-col-sm-12">
                <h3>Modifiers</h3>
                <% loop $Modifiers %>
                    <p id="$Reference"><strong>$Name</strong> - $Description</p>
                    <div class="sg-row">
                        <div class="sg-col-sm-12">
                            <div class="sg-example--buttons">
                                <button data-clipboard-text="$ExampleHtml.XML" title="Click to copy me." class="sg-example__copy">Copy</button>
                                <button title="Click to display the code." class="sg-example__toggle">Code</button>
                            </div>
                            <div class="sg-example">
                                $ExampleHtml
                            </div>
                            <div class="sg-code">
                                <pre class="prettyprint">$ExampleHtml.XML</pre>
                            </div>
                        </div>
                    </div>
                <% end_loop %>
            </div>
        </div>
    <% end_if %>
</div>
