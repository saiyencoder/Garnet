<h1>Create Stat Sheet</h1>
<div id="app">
<section>
<% @players.each_slice(3) do |players|  %>
    <div class="row">
      <% players.each do |x| %>
          <div class="col-md-4 col-sm-6 product-index-single">
            <%= form_tag "/stats", method: :post do %>
              <input type="hidden" name="game_id" value="<%= @game.id %>">
              <div>
                Player: 
                <select name="player_id" >
                  <% @game.team.players.each do |player| %>
                    <option value="<%= player.id %>" <%= 'selected="selected"' if player.id == @stat.player_id%>>
                      <%= player.name %>
                    </option>      
                  <% end %>
                </select>
              </div>
              <div>
                FGM: <input type="text" name="field_goal_made" value="0">
              </div>
              <div>
                FGA: <input type="text" name="field_goal_attempt" value="0">
              </div>
              <div>
                3-FGM: <input type="text" name="three_point_made" value="0">
              </div>
              <div>
                3-FGA: <input type="text" name="three_point_attempt" value="0">
              </div>
              <div>
                Free Throws Made: <input type="text" name="free_throws_made" value="0">
              </div>
              <div>
                Free Throw Attempts: <input type="text" name="free_throw_attempts" value="0">
              </div>
              <div>
                Rebounds: <input type="text" name="rebounds" value="0">
              </div>
              <div>
                Assists: <input type="text" name="assist" value="0">
              </div>
              <div>
                Steals: <input type="text" name="steals" value="0">
              </div>
              <div>
                Blocks: <input type="text" name="blocks" value="0">
              </div>
              <div>
                Fouls: <input type="text" name="fouls" value="0">
              </div>
              <div>
                Points: <input type="text" name="points" value="0">
              </div>
              <input type="submit" value="Create Stats">
            <% end %>
            <br>
            {{message}}
          </div>
        <% end %>
      </div>
    <% end %>
</section>
</div>
