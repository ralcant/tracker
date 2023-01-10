# Tracker

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000/graphiql`](http://localhost:4000/graphiql) from your browser. There you can run different graphiql commands

## Create a TODO

```
mutation create {
  createTodo (
    title: "This is a new todo super super cool",
    description: "This is the description of a todo look at that",
    date: "2023-01-09",
    done: false
  ) {
    id
    title
    description
    date
    done
  }
}
```

## Delete a TODO

```
mutation delete{
  deleteTodo(id: 3){
    id
    title
    description
    date
    done
  }
}
```

## Mark a TODO as completed

```
mutation complete{
  completeTodo(id: 6){
    id
    title
    description
    date
    done
  }
}
```

## Get all TODOs (with possible filtering and/or sort)

```
query getAll {
  allTodos(filters:{title:"tod", order: ASC}) {
    id
    title
    description
    done
    date
  }
}
```

<!-- Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html). -->

<!-- ## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix -->
