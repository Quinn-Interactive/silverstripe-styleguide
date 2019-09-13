<% if $FileSource %>
<div class="sg-example__code sg-code -hide" id="sg-styles-$Reference">
    <h3 class="sg-example__filepath">$Pathname</h3>
    <pre class="sg-example__prettyprint sg-prettyprint prettyprint">$FileSource.RAW</pre>
</div>
<%--

<div class="">
<div class="sg-source">
    <pre class="prettyprint lang-scss">$FileSource.RAW</pre>
</div>
</div> --%>
<% end_if %>
