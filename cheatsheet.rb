rubygems.org
  friendly_id

  in gemfile
    gem 'friendly_id', '~> 5.1.0'

  bundle install
  rails generate friendly_id
  # rails generate scaffold user name:string slug:string:uniq
  rails db:migrate

  rails g migration add_slug_to_blogs slug:string:uniq

  rails db:migrate

  in blogs model
    class Blog < ApplicationRecord
      extend FriendlyId
      friendly_id :title, use: :slugged
    end

  now test this in the rails console to see if it works

  Blog.create!(title: "My great title", body: "blah blah blah")

  the slug should automatically render "my-great-title" as the slug

  # Also need to change the params, before Blog.new(blog_params)
  in blogs_controller.rb
    under private methods
      under set_blog
        add .friendly
          @blog = Blog.friendly.find(params[:id])

  in rails console
    Blog.find_each(&:save)
      # This will go and find everything in the database and add the slug to each

  restart the server
