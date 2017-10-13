<div id="$ReferenceID" class="sg-section-wrap">
	<div class="sg-section">
        <div class="sg-container">
    		<h2>$Title</h2>
    		<p>$Description</p>
    		<% if $Parameters %>
    			<div class="sg-swatch-grid">
    				<% loop $Parameters %>
    					<div class="sg-swatch">
    						<div class="sg-swatch__color" style="background-color: $Description;">
    						</div>
    						<div class="sg-swatch__var">
    							<p>$Name<br/>$Description</p>
    						</div>
    					</div>
    				<% end_loop %>
    			</div>
    		<% end_if %>
        </div>
    </div>
</div>
