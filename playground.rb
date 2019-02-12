

Task

def is_completed
    self.status.toggle
end


<%= form_tag ({controller: 'comments', action: 'create', method: 'post'}) do %>
    <%= text_area_tag :content %><br>
    <%= submit_tag "Submit comment" %>
<% end %>


<%= form_for @comment do |f| %>
    <%= f.label "Write your comment" %>
    <%= f.text_area :content %>
    <%= f.submit "Submit" %>
<% end %>


<%= form_tag ({controller: 'dices', action: 'new', method: 'get' do %>
    <%= label_tag "Participants" %>
    <%= number_field_tag '' %>
    <% submit_tag 'Create' %>
<% end %>