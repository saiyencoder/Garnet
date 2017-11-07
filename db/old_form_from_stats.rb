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

--------------------------------------------------------------------
<h1>Create Statsheet</h1>

<% @players.each do |player| %> 
  <h4><%= player.name %></h4> 
  <%= form_for "#{player}" do |f| %>
    <div>
      <%= f.label :field_goal_made, "FGM" %>
      <%= f.text_field :field_goal_made %>
    </div>
    <div>
      <%= f.label :field_goal_attempt, "FGA" %>
      <%= f.text_field :field_goal_attempt %>
    </div>
    <div>
      <%= f.label :three_point_made, "3-FGM" %>
      <%= f.text_field :three_point_made %>
    </div>
    <div>
      <%= f.label :three_point_attempt, "3-FGA" %>
      <%= f.text_field :three_point_attempt %>
    </div>
    <%= f.submit %>
  <% end %>
<% end %>
----------------------------------------------
Controller = 
@game = Game.find(params[:id])
    @players =
    @players = @game.team.players
    # gon.players = @game.team.players #stores all the players that was passed through from new page
    @stat = Stat.new
----------------------------------------------
<h1>Create Statsheet</h1>

<%= form_tag stats_path(method: :post) do %>
  <% @players.each do |palyer| %>
    <h2><%= palyer.name %></h2>
    <% @stats.each do |stat| %>
      <%= fields_for 'stats[]', stat do |f| %>
        <div>
          <%= f.label :field_goal_made, "FGM" %>
          <%= f.text_field :field_goal_made %>
        </div>
      <% end %>
    <% end %>
  <% end %>
<% end %>
-----------------------------------------------
Took out from games index:

<%= game.season.quarter %> <%= game.season.year %> - <a href="/games/<%= game.id %>">
-----------------------------------------------
game_id: params[:game_id],
player_id: params[:player_id],
field_goal_made: 0,
field_goal_attempt: 0,
three_point_made: 0,
three_point_attempt: 0,
free_throws_made: 0,
free_throw_attempts: 0,
rebounds: 0,
assists: 0,
steals: 0,
blocks: 0,
fouls: 0,
points: 0

--------------------------------------------------

<h1>Create Statsheet</h1>

<%= form_tag stats_path(method: :post) do %>
  <% @players.each do |player| %>
    <h3><%= player.name %></h3>
    <%= fields_for @stat, player do |f| %>
      <div>
        <%= f.label :field_goal_made, "FGM" %>
        <%= f.text_field :field_goal_made, value: 0 %>
      </div>
      <div>
        <%= f.label :field_goal_attempt, "FGA" %>
        <%= f.text_field :field_goal_attempt, value: 0 %>
      </div>
      <div>
        <%= f.label :three_point_made, "3-FGM" %>
        <%= f.text_field :three_point_made, value: 0 %>
      </div>
      <div>
        <%= f.label :three_point_attempt, "3-FGA" %>
        <%= f.text_field :three_point_attempt, value: 0 %>
      </div>
      <div>
        <%= f.label :free_throws_made, "FTM" %>
        <%= f.text_field :free_throws_made, value: 0 %>
      </div>
      <div>
        <%= f.label :free_throw_attempts, "FTA" %>
        <%= f.text_field :free_throw_attempts, value: 0 %>
      </div>
      <div>
        <%= f.label :rebounds, "Rebounds" %>
        <%= f.text_field :rebounds, value: 0 %>
      </div>
      <div>
        <%= f.label :assists, "Assists" %>
        <%= f.text_field :assists, value: 0 %>
      </div>
      <div>
        <%= f.label :steals, "Steals" %>
        <%= f.text_field :steals, value: 0 %>
      </div>
      <div>
        <%= f.label :blocks, "Blocks" %>
        <%= f.text_field :blocks, value: 0 %>
      </div>
      <div>
        <%= f.label :fouls, "Fouls" %>
        <%= f.text_field :fouls, value: 0 %>
      </div>
      <br>
    <% end %>
  <% end %>
  <%= submit_tag %>
  <br>
  <br>
<% end %>

--------------------------------------------------------
Used to check stat array in new.html

<%= @player_stats %><br><br>
<%= @player_stats[0][:player_id] %><br>

---------------------------------------------------------
<%= form_tag stats_path(method: :post) do %>
  <% @players_in_game.each do |player| %>
    <%= player.name %>
    <%= @player_stats.each do |p| %>
      <%= fields_for 'stats[]', "#{p}", do |f|%>
        <div>
          <%= f.label :field_goal_made, "FGM" %>
          <%= f.text_field :field_goal_made, value: 0 %>
        </div>
        <div>
          <%= f.label :field_goal_attempt, "FGA" %>
          <%= f.text_field :field_goal_attempt, value: 0 %>
        </div>
        <div>
          <%= f.label :three_point_made, "3-FGM" %>
          <%= f.text_field :three_point_made, value: 0 %>
        </div>
        <div>
          <%= f.label :three_point_attempt, "3-FGA" %>
          <%= f.text_field :three_point_attempt, value: 0 %>
        </div>
        <div>
          <%= f.label :free_throws_made, "FTM" %>
          <%= f.text_field :free_throws_made, value: 0 %>
        </div>
        <div>
          <%= f.label :free_throw_attempts, "FTA" %>
          <%= f.text_field :free_throw_attempts, value: 0 %>
        </div>
        <div>
          <%= f.label :rebounds, "Rebounds" %>
          <%= f.text_field :rebounds, value: 0 %>
        </div>
        <div>
          <%= f.label :assists, "Assists" %>
          <%= f.text_field :assists, value: 0 %>
        </div>
        <div>
          <%= f.label :steals, "Steals" %>
          <%= f.text_field :steals, value: 0 %>
        </div>
        <div>
          <%= f.label :blocks, "Blocks" %>
          <%= f.text_field :blocks, value: 0 %>
        </div>
        <div>
          <%= f.label :fouls, "Fouls" %>
          <%= f.text_field :fouls, value: 0 %>
        </div>
        <br>
      <% end %>
    <% end %>
  <% end %>
<%= submit_tag "Submit New Stats"%> <br><br>
<% end %>
------------------------------------------------
<h1>Create Statsheet</h1>

<%= form_tag stats_path(method: :post) do %>
  <% @players_in_game.each do |player| %>
    <%= player.name %>
    <% form_for @player_stats do |f| %>
        <div>
          <%= f.label :field_goal_made, "FGM" %>
          <%= f.text_field :field_goal_made, value: 0 %>
        </div>
        <div>
          <%= f.label :field_goal_attempt, "FGA" %>
          <%= f.text_field :field_goal_attempt, value: 0 %>
        </div>
        <div>
          <%= f.label :three_point_made, "3-FGM" %>
          <%= f.text_field :three_point_made, value: 0 %>
        </div>
        <div>
          <%= f.label :three_point_attempt, "3-FGA" %>
          <%= f.text_field :three_point_attempt, value: 0 %>
        </div>
        <div>
          <%= f.label :free_throws_made, "FTM" %>
          <%= f.text_field :free_throws_made, value: 0 %>
        </div>
        <div>
          <%= f.label :free_throw_attempts, "FTA" %>
          <%= f.text_field :free_throw_attempts, value: 0 %>
        </div>
        <div>
          <%= f.label :rebounds, "Rebounds" %>
          <%= f.text_field :rebounds, value: 0 %>
        </div>
        <div>
          <%= f.label :assists, "Assists" %>
          <%= f.text_field :assists, value: 0 %>
        </div>
        <div>
          <%= f.label :steals, "Steals" %>
          <%= f.text_field :steals, value: 0 %>
        </div>
        <div>
          <%= f.label :blocks, "Blocks" %>
          <%= f.text_field :blocks, value: 0 %>
        </div>
        <div>
          <%= f.label :fouls, "Fouls" %>
          <%= f.text_field :fouls, value: 0 %>
        </div>
        <br>
    <% end %>
  <% end %>
<%= submit_tag "Submit New Stats"%> <br><br>
<% end %>
-----------------------------------------------
<h1>Create Statsheet</h1>

<%= @player_hash[0] %>
<h2>----------------------------</h2>
<br><br>
<% @player_hash.each do |player_hash, stats| %>
  <%= player_hash %>
  <%= stats["player_id"] %>
  <br>
<% end %>
<h2>----------------------------</h2>
<br><br>


<%= form_tag stats_path(method: :post) do %>
  <% @player_hash.each do |player, stats| %>
    <%= fields_for 'stats[]', player do |f| %>
      <h4><%= player %></h4>
      <div>
        <%= f.label :field_goal_made, "FGM" %>
        <%= f.text_field :field_goal_made, value: 0 %>
      </div>
      <div>
        <%= f.label :field_goal_attempt, "FGA" %>
        <%= f.text_field :field_goal_attempt, value: 0 %>
      </div>
      <div>
        <%= f.label :three_point_made, "3-FGM" %>
        <%= f.text_field :three_point_made, value: 0 %>
      </div>
      <div>
        <%= f.label :three_point_attempt, "3-FGA" %>
        <%= f.text_field :three_point_attempt, value: 0 %>
      </div>
      <div>
        <%= f.label :free_throws_made, "FTM" %>
        <%= f.text_field :free_throws_made, value: 0 %>
      </div>
      <div>
        <%= f.label :free_throw_attempts, "FTA" %>
        <%= f.text_field :free_throw_attempts, value: 0 %>
      </div>
      <div>
        <%= f.label :rebounds, "Rebounds" %>
        <%= f.text_field :rebounds, value: 0 %>
      </div>
      <div>
        <%= f.label :assists, "Assists" %>
        <%= f.text_field :assists, value: 0 %>
      </div>
      <div>
        <%= f.label :steals, "Steals" %>
        <%= f.text_field :steals, value: 0 %>
      </div>
      <div>
        <%= f.label :blocks, "Blocks" %>
        <%= f.text_field :blocks, value: 0 %>
      </div>
      <div>
        <%= f.label :fouls, "Fouls" %>
        <%= f.text_field :fouls, value: 0 %>
      </div>
      <br>
    <% end %>
  <% end %><br><br>
<%= submit_tag "Submit New Stats"%> <br><br>
<% end %>
