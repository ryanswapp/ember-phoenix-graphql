# Ember Phoenix GraphQL

This is an example app demonstrating how one would hook up Ember to Phoenix and communicate via GraphQL. I was surprised at how easy it was to setup! Please let me know if you have any questions.

# Usage

Clone the repo:

```
git clone https://github.com/ryanswapp/ember-phoenix-graphql.git
```

Navigate to the ```frontend``` directory and run the following commands:

```
npm install

bower install

ember s
```

Now, in another terminal window (while the Ember server is running) navigate to the ```backend``` directory and run the following commands:

```
mix deps.get

mix ecto.setup

mix phoenix.server
```

Your Phoenix API will now be live at ```http://localhost:4000``` and the Ember app will be live at ```http://localhost:4200```. If you checkout the Ember app you can navigate to the posts route and see posts retrieved from the server. 

If you'd like to play with the GraphQL server navigate to ```http://localhost:4000/api/post?query={posts}```. You'll be presented with a GraphiQL data explorer that you can have some fun with. Try running the following query:
```
{
  posts {
    id,
    title,
    content
  }
}
```
Pretty cool huh? If you'd like to learn more about GraphQL I recommend you check out this (excellent guide)[https://learngraphql.com/].