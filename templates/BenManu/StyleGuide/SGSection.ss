<div id="$ReferenceID" class="sg-row sg-section-wrap">
	<div class="sg-section">
        <div class="sg-container">
    		<div class="sg-intro sg-depth-$Depth">
    			<h2 class="sg-title sg-title-$Depth">
                    <a class="sg-reflink" title="Link to this section" aria-hidden="true" target="_top" href="$Link#$ReferenceID">
                        $Title
                    </a>
                    <button title="Click to display the css." class="sg-source__toggle">View CSS</button>
                </h2>
                <h3 class="sg-source__title">$Pathname</h3>
                <div class="sg-source">
                    <pre class="prettyprint lang-scss">$FileSource.RAW</pre>
                </div>

    			<div class="sg-description">$Description</div>
    			<% if $Parameters %>
                    <div class="sg-parameters">
                        <ul class="sg-parameters">
        					<% loop $Parameters %>
        						<li><em>$Name</em><span>$Description</span></li>
        					<% end_loop %>
                        </ul>
                    </div>
    			<% end_if %>
    			<% if $Compatibility %>
    				<div class="sg-callout sg-callout--success">
    					<p>$Compatibility</p>
    				</div>
    			<% end_if %>
    			<% if $Experimental %>``
    				<div class="sg-callout sg-callout--warning">
    					<p>$Experimental</p>
    				</div>
    			<% end_if %>
    			<% if $Deprecated %>
    				<div class="sg-callout sg-callout--danger">
    					<p>$Deprecated</p>
    				</div>
    			<% end_if %>
            </div>
        </div>

		<% if $getTemplate %>
            <% include BenManu/StyleGuide/Includes/SGExample Markup=$getTemplate %>
		<% end_if %>

		<% if $MarkupNormal %>
            <% include BenManu/StyleGuide/Includes/SGExample Markup=$MarkupNormal %>
		<% end_if %>

		<% if $Modifiers %>
			<div class="sg-modifiers">
                <div class="sg-subsection-intro sg-container">
    				$Title classes
                </div>
				<% loop $Modifiers %>
				    <div id="$Reference" class="sg-modifier-intro sg-container">
                        <a class="sg-reflink sg-modifier-name" title="Link to this section" aria-hidden="true" target="_top" href="$Link#$Reference">
                            <strong>$Name</strong>
                        </a>
                        <span class="sg-modifier-description">$Description</span>
                    </div>
                    <% include BenManu/StyleGuide/Includes/SGExample Markup=$ExampleHtml %>
				<% end_loop %>
			</div>
		<% end_if %>
	</div>
</div>
