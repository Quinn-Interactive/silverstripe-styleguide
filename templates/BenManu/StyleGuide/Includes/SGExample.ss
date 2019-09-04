<div class="sg-example">
    <div class="sg-example__example">
        $Markup
    </div>
    <div class="sg-example__controls">
        <button data-clipboard-text="$Markup.XML" title="Click to copy me." class="sg-example__btn -copy"><img src="$resourceURL('benmanu/silverstripe-styleguide:images/clipboard.svg')" height="16" width="16" alt="Copy Code to Clipboard" /></button>
        <button data-toggle="code-example-$Reference" title="Click to display the code." class="sg-example__btn -code"><img src="$resourceURL('benmanu/silverstripe-styleguide:images/code.svg')" height="16" width="16" alt="View/Hide Code" /></button>
    </div>
    <div class="sg-example__code sg-code -hide" id="code-example-$Reference">
        <pre class="sg-example__prettyprint sg-prettyprint prettyprint">$Markup.XML</pre>
    </div>
</div>
