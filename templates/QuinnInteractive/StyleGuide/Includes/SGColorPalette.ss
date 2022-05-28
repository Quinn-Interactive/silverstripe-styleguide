<div id="$ReferenceID" class="sg-section">
    <$Heading class="sg-section__title">$Title</$Heading>
    <% if $Parameters %>
        <div class="sg-section__modifiersLabel">Color Palette</div>
        <div class="sg-swatch__list">
            <% loop $Parameters %>
                <div class="sg-swatch">
                    <div class="sg-swatch__color" style="background-color: $Description;">
                    </div>
                    <div class="sg-swatch__var">
                        $Name<br/>$Description
                    </div>
                </div>
            <% end_loop %>
        </div>
    <% end_if %>
    <div class="sg-section__description">$Description</div>
</div>
