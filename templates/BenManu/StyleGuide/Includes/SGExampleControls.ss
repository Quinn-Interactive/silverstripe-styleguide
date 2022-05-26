<div class="sg-example__controls">
    <% if $ShowWidth %>
        <span class="sg-example__iframeWidth" data-sg-iframe-width="sg-iframe-$Reference"></span>
    <% end_if %>
    <button data-sg-clipboard-text="$Markup.XML" title="Click to copy me." class="sg-example__btn -copy"><img src="$resourceURL('benmanu/silverstripe-styleguide:images/clipboard.svg')" height="16" width="16" alt="Copy Code to Clipboard" /></button>
    <% if $FileSource %>
        <button data-sg-toggle="sg-styles-$Reference" title="Show Styles" class="sg-example__btn -copy">
            <% if $FileType == 'scss' || $FileType == 'sass' %>
                <img src="$resourceURL('benmanu/silverstripe-styleguide:images/sass.svg')" height="16" width="16" alt="Copy Code to Clipboard" />
            <% else %>
                <img src="$resourceURL('benmanu/silverstripe-styleguide:images/css.svg')" height="16" width="16" alt="Copy Code to Clipboard" />
            <% end_if %>
        </button>
    <% end_if %>
    <button data-sg-toggle="sg-example-$Reference" title="Click to display the code." class="sg-example__btn -code"><img src="$resourceURL('benmanu/silverstripe-styleguide:images/code.svg')" height="16" width="16" alt="View/Hide Code" /></button>
</div>
