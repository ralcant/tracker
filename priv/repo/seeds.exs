# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tracker.Repo.insert!(%Tracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Tracker.Notes.Todo
alias Tracker.Repo
%Todo{
  title: "Go to the gym",
  description: "Need to go every day, except Thursday and Sunday.",
  done: false,
  date: ~D[2023-01-02]
} |> Repo.insert!

%Todo{
  title: "Buy groceries",
  description: "Need to buy a lot of products.",
  done: true,
  date: ~D[2023-01-05]
} |> Repo.insert!

%Todo{
  title: "Go out to eat",
  description: "Need to go to eat.",
  done: false,
  date: ~D[2023-01-05]
} |> Repo.insert!

%Todo{
  title: "Go to Chicago",
  description: "Need to print the new I-20 (and probably the other I-20s as well",
  done: false,
  date: ~D[2023-01-14]
} |> Repo.insert!
