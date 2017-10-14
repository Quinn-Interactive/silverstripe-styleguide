<div id="$ReferenceID" class="sg-row sg-section-wrap">
	<div class="sg-section">
		<div class="sg-intro sg-depth-$Depth">
            <div class="sg-container">
    			<h2 class="sg-title sg-title-$Depth">$Title</h2>
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
                        <div class="sg-container"><strong>$Name</strong> - $Description</div>
                    </div>
                    <% include BenManu/StyleGuide/Includes/SGExample Markup=$ExampleHtml %>
				<% end_loop %>
			</div>
		<% end_if %>
	</div>
</div>
