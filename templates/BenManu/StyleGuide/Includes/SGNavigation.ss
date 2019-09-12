<% if $Navigation %>
<div class="sg-layout-nav" data-sg-nav>
    <nav class="sg-nav">
        <button class="sg-nav__btn" data-sg-nav-btn>☰</button>
        <ul class="sg-nav__list -section">
            <li class="sg-nav__item -home -page">
                <a class="sg-nav__link -home -page" href="$BaseURL" title="$SiteConfig.Title home">$SiteConfig.Title</a>
            </li>
            <% loop $Navigation %>
            <li class="sg-nav__item -page<% if $Active %> -active<% end_if %>" data-sg-nav-item>
                <a class="sg-nav__link -page<% if $Active %> -active<% end_if %>" data-sg-nav-link href="$Link">$Title</a>
                <% if $Active && $Children.Count %>
                    <% if $Title == 'Style Guide' %>
                        <input type="search" class="sg-nav__search" data-sg-nav-search name="sg-search" placeholder="Search" value="" />
                    <% end_if %>
                    <% include BenManu/StyleGuide/SGSecondaryNavigation %>
                <% end_if %>
            </li>
            <% end_loop %>
        </ul>
    </nav>
</div>
<% end_if %>
