<ul class="sg-subnav">
    <%-- Sections --%>
    <% loop $Children %>
    <li class="<% if $Active %>active <% end_if %>sg-nav-section-item">
        <a href="$Link" data-sg-nav-link>$Title</a>
        <% if $Modifiers.Count %>
            <ul class="sg-modnav">
                <% loop $Modifiers %>
                    <li><a href="$Up.Link#{$Reference}" data-sg-nav-link title="$Name">$Name</a></li>
                <% end_loop %>
            </ul>
        <% end_if %>
        <% if $Children.Count %>
            <% include BenManu/StyleGuide/SGSecondaryNavigation %>
        <% end_if %>
    </li>
    <% end_loop %>
</ul>
