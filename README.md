# Moebica: Learn Programming Together

This is an online site for learning how to program
[*Moebica: Learn Programming Together*](http://moebica.com/). 
You can use this reference implementation to help track down errors if you end up having trouble with code. In particular, as a first debugging check I suggest getting the test suite to pass on your local machine:

    $ cd /tmp
    $ git clone https://github.com/koblenski/moebica_app.git
    $ cd moebica_app
    $ cp config/database.yml.example config/database.yml
    $ bundle install --without production
    $ bundle exec rake db:migrate
    $ bundle exec rake db:test:prepare
    $ bundle exec rspec spec/
    or
    $ rake test

If the tests don't pass, it means there may be something wrong with your system. If they do pass, then you can debug your code by comparing it with the reference implementation.
