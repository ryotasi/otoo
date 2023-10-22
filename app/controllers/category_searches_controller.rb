class CategorySearchesController < ApplicationController
    <% category = Book.select(:category).distinct %> 
    <%= f.collection_select(:word, category, :category, :category) %>
end
