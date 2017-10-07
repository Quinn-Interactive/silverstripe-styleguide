<ul class="sg-subnav">
    <%-- Sections --%>
    <% loop $Children %>
    <li<% if $Active %> class="active"<% end_if %>>
        <a href="$Link">$Title</a>
        <% if $Modifiers.Count %>
            <ul class="sg-modnav">
                <% loop $Modifiers %>
                    <li><a href="$Up.Link#{$Reference}" title="$Name">$Name</a></li>
                <% end_loop %>
            </ul>
        <% end_if %>
        <% if $Children.Count %>
            <% include BenManu/StyleGuide/SGSecondaryNavigation %>
        <% end_if %>
    </li>
    <% end_loop %>
</ul>
