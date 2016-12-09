# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CoherenceAjaxTest.Repo.insert!(%CoherenceAjaxTest.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

CoherenceAjaxTest.Repo.delete_all CoherenceAjaxTest.User

CoherenceAjaxTest.User.changeset(%CoherenceAjaxTest.User{}, %{name: "Test User", email: "testuser@example.com", password: "secret", password_confirmation: "secret"})
|> CoherenceAjaxTest.Repo.insert!
