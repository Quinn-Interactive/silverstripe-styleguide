<% if $Navigation %>
<nav class="nav" data-nav>
	<div class="sg-container--fluid">
		<ul class="sg-nav sg-navbar__nav sg-navbar--left">
			<li>
				<a href="$BaseURL" title="$SiteConfig.Title home">$SiteConfig.Title</a>
			</li>
		</ul>
		<ul class="sg-nav sg-navbar__nav sg-navbar--right">
            <%-- Pages --%>
			<% loop $Navigation %>
			<li<% if $Active %> class="active"<% end_if %>>
				<a href="$Link">$Title</a>
                <%-- Sections --%>
                <% if $Active && $Children %>
            		<% include BenManu/StyleGuide/SGSecondaryNavigation %>
            	<% end_if %>
			</li>
			<% end_loop %>
		</ul>
	</div>
</nav>
<% end_if %>
