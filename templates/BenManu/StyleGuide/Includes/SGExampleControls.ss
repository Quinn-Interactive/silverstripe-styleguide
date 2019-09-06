<div class="sg-example__controls">
    <% if $ShowWidth %><span class="sg-example__iframeWidth" data-sg-iframe-width="sg-iframe-$Reference"></span><% end_if %>
    <button data-sg-clipboard-text="$Markup.XML" title="Click to copy me." class="sg-example__btn -copy"><img src="$resourceURL('benmanu/silverstripe-styleguide:images/clipboard.svg')" height="16" width="16" alt="Copy Code to Clipboard" /></button>
    <button data-sg-toggle="sg-example-$Reference" title="Click to display the code." class="sg-example__btn -code"><img src="$resourceURL('benmanu/silverstripe-styleguide:images/code.svg')" height="16" width="16" alt="View/Hide Code" /></button>
</div>
