<nav class="sg-navbar sg-navbar--secondary sg-navbar--static-top">
    <div class="sg-container--fluid">
        <ul class="sg-nav sg-navbar__nav sg-navbar--right">
            <% loop $Children %>
            <li<% if $Active %> class="active"<% end_if %>>
                <a href="$Link">$Title</a>
                <% if $Children.Count %>
                    <ul>
                        <% loop $Children %>
                        <li>
                            <a href="$Link">$Title</a>
                            <% if $Modifiers.Count %>
                                <ul>
                                    <% loop $Modifiers %>
        								<li><a data-target="#{$Reference}" href="#{$Reference}" title="$Name">$Name</a></li>
        							<% end_loop %>
                                </ul>
                            <% end_if %>

                        </li>
                        <% end_loop %>
                    </ul>
                <% end_if %>
            </li>
            <% end_loop %>
        </ul>
    </div>
</nav>
