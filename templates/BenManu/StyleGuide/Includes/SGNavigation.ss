<% if $Navigation %>
<nav class="sg-nav-container" data-sg-nav>
		<ul class="sg-nav">
			<li>
				<a href="$BaseURL" target="_top" title="$SiteConfig.Title home">$SiteConfig.Title</a>
			</li>
            <%-- Pages --%>
			<% loop $Navigation %>
			<li>
				<a href="$Link" target="_top">$Title</a>
                <%-- Sections --%>
                <% if $Active && $Children %>
            		<% include BenManu/StyleGuide/SGSecondaryNavigation %>
            	<% end_if %>
			</li>
			<% end_loop %>
		</ul>
</nav>
<% end_if %>
