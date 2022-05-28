<ul class="sg-nav__list<% if $Active %> -active<% end_if %>" data-sg-nav-list<% if $Title == 'Style Guide' %> data-sg-nav-searchable<% end_if %>>
    <% loop $Children %>
        <li class="sg-nav__item -sub -depth-$Depth<% if $Active %> -active<% end_if %>" data-sg-nav-item>
            <a class="sg-nav__link -sub -depth-$Depth<% if $Active %> -active<% end_if %>" data-sg-nav-link href="$Link">$Title</a>
            <% if $Active && $Modifiers %>
                <ul class="sg-nav__list -mod -depth-$Depth -active">
                    <% loop $Modifiers %>
                        <li class="sg-nav__item -mod -depth-$Up.Depth"><a class="sg-nav__link -mod -depth-$Up.Depth" data-sg-nav-link data-target="#{$Reference}" href="#{$Reference}" title="$Name">$Name</a></li>
                    <% end_loop %>
                </ul>
            <% end_if %>

            <% if $Children.Count %>
                <% include BenManu/StyleGuide/SGSecondaryNavigation %>
            <% end_if %>
        </li>
    <% end_loop %>
</ul>
