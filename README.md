# Chitter Challenge

## Synopsis

Following [this challenge brief](https://github.com/makersacademy/chitter-challenge), I created a twitter clone using the DSL Sinatra. Although it would have been faster to use Rails and its many gems to prototype features such as user management, creating this by hand taught me a lot about using PostgreSQL and bcrypt.


## Technologies Used

- Ruby
- Sinatra
- PostgreSQL
- DataMapper
- Tested using Cucumber and Capybara
- Twitter Bootstrap


## Favourite Code Snippet

```ruby
def self.authenticate(email, password)
    user = first(email: email)
    if user
      BCrypt::Password.new(user.password_digest) == password ? user : false
    else
      nil
    end
  end
```

Before working on this app, I hadn't built a user management system from scratch and consequently hadn't fully understood the way in which password encryption works. Although this method contains a nested if statement, I believe it is still efficient for its purpose.


## Further Refactoring Opportunities

- The only thing holding this code back from receiving a 4.0 GPA on code climate is the Users controller. The code within the routes is quite complex and could be extracted out into helper methods. Alternatively, I could replace this functionality with an authentication gem such as [Sinatra::Warden](https://github.com/jsmestad/sinatra_warden)


## Takeaway

- Whilst working on this project I learned more about Sinatra, and it helped me to understand the benefits of using a lightweight framework.
- Through manually testing the app as I built it, I became adept at managing a PostgreSQL database directly using SQL.
