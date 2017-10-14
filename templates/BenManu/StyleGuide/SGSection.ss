<div id="$ReferenceID" class="sg-row sg-section-wrap">
	<div class="sg-section">
		<div class="sg-intro sg-depth-$Depth">
            <div class="sg-container">
    			<h2 class="sg-title sg-title-$Depth">
                    <a class="sg-reflink" title="Link to this section" aria-hidden="true" target="_top" href="$Link#$ReferenceID">
                        $Title
                    </a>
                </h2>
    			<div class="sg-description">$Description</div>
    			<% if $Parameters %>
    				<ul>
    					<% loop $Parameters %>
    						<li><em>$Name</em> - $Description</li>
    					<% end_loop %>
    				</ul>
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
                <div class="sg-subsection-intro">
    				<h3 class="sg-container">Modifiers</h3>
                </div>
				<% loop $Modifiers %>
				    <div id="$Reference" class="sg-modifier-intro">
                        <div class="sg-container">
                            <a class="sg-reflink" title="Link to this section" aria-hidden="true" target="_top" href="$Link#$Reference">
                                <strong>$Name</strong> - $Description
                            </a>
                        </div>
                    </div>
                    <% include BenManu/StyleGuide/Includes/SGExample Markup=$ExampleHtml %>
				<% end_loop %>
			</div>
		<% end_if %>
	</div>
</div>