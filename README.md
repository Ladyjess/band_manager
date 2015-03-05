#Stellar Band Manager

This app is very useful for organizing your bands and keeping track of
bands who have performed at a certain venue or will perform at the venue.

##Author

Jessica Hori

##Install

This app is used in connection with Sinatra and ActiveRecord. You do not have to run Rails.

Download or fork the repository and bundle in terminal in order to use the required gems
and dependencies.

I have some extra files but you do not need those if you set up correctly from the beginning.

If you are starting from scratch you should first make an important folder:  'config' -- with a ```database.yml``` file inside it.

In your yml file will be :  

```ruby
development:
  adapter: postgresql
  database: band_manager_development

test:
  adapter: postgresql
  database: band_manager_test
```

Make sure those are lined up correctly. If you put the adapter and database words aligned
to the left wall of the text editor, your database will only make the development database
and ignore everything else under it.

Run ```rake db:create```

then:  ```rake db:test:prepare```

This will create the main and test databases.


Run ```rake db:create_migration NAME=create_bands```

Next we will run ```rake db:create_migration NAME=create_venues```

Lastly we will run ```rake db:create_migration NAME=create_concerts```

A db folder with a sub folder called ```migrate``` with migration files will automatically be created.


Check the repository files for more information on what to insert in those files, lib folder, spec set up, Rakefile, Gemfile,and views.


After you have completed those run ```rake db:migrate``` and  ```rake db:test:prepare``` again to update your test database for specs. You should always update your test database after creating a new migration.



##License

GNU GPL v.2.0

Free to copy and improve via fork and pull requests.

Will add more features and functionality.
