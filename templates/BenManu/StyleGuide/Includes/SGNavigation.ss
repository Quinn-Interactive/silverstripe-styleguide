<% if $Navigation %>
<div class="sg-layout-nav" data-nav>
    <nav class="sg-nav">
        <button class="sg-nav__btn" data-nav-btn>☰</button>
        <ul class="sg-nav__list">
            <li class="sg-nav__item -home -page">
                <a class="sg-nav__link -home -page" href="$BaseURL" title="$SiteConfig.Title home">$SiteConfig.Title</a>
            </li>
            <% loop $Navigation %>
            <li class="sg-nav__item -page<% if $Active %> -active<% end_if %>">
                <a class="sg-nav__link -page<% if $Active %> -active<% end_if %>" href="$Link">$Title</a>
                <% if $Active && $Children.Count %>
                    <% include BenManu/StyleGuide/SGSecondaryNavigation %>
                <% end_if %>
            </li>
            <% end_loop %>
        </ul>
    </nav>
</div>
<% end_if %>
