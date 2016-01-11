== Thinking_sphinx
heroku add-on Flying Sphinx in production
------------------------------------------
gem 'thinking-sphinx', '~> 3.1', '>= 3.1.4'
 now run bundle install.
---------------------------
app/indices/movie_index.rb
------------------------------
ThinkingSphinx::Index.define :movie, :with => :active_record do
  indexes title
  indexes director
  has user_id, created_at, updated_at
end
-----------------------------------

index action of movies controller
--------------------
 @movies = Movie.search params[:search]

layouts/header.html.erb
------------------------

<%= form_tag movies_path, :method => :get do  %>
<p>
 <%= text_field_tag :search  % >                              
</p>
<p class="button">
 <%= submit_tag "Search" %>
</p>
<% end %>
-----------------------------------
run rake ts:index in cmd prompt
---------------------------
that will generate one confihuration file.

FATAL: no indexes found in config file in config/development.sphinx.conf'

--------------

        " rake ts:index "
           next, start thinking sphinx server by typing 
              " rake ts:start "
           you can stop thinking sphinx by typing
             " rake ts:stop "
             rake ts:rebuild
             sudo service sphinxsearch stop
             rake ts:status
             -------------------
NoMethodError undefined method define_index for Class .

Error connecting to Sphinx via the MySQL protocol. Error connecting to Sphinx via the MySQL protocol. Can't connect to MySQL server on '127.0.0.1' (111) - SELECT * FROM `movie_core` WHERE `sphinx_deleted` = 0 LIMIT 0, 20; SHOW META
--------------------
rake ts:configure ts:restart
-----------------------------


rake ts:stop
searchd is not currently running.
Stopped searchd daemon (pid: ).
------------------------------------------------------------
http://freelancing-gods.com/thinking-sphinx/quickstart.html
http://rubylogix.blogspot.in
http://www.jeremysamples.com
http://abhilashak.com/

