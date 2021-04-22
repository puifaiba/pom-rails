User.destroy_all
Chat.destroy_all
Message.destroy_all
Column.destroy_all
Task.destroy_all

user1 = User.create!(email: "polly@test.com", password: "pollyrules", first_name: "Polly", last_name: "Wolly", role: 1)
user2 = User.create!(email: "choppo@test.com", password: "chopporules", first_name: "Choppo", last_name: "Whoppo", role: 1)
user3 = User.create!(email: "ravi@test.com", password: "ravirules", first_name: "Ravi", last_name: "Wavi", role: 0, therapist_id: user1.id)
user4 = User.create!(email: "pepe@test.com", password: "peperules", first_name: "Pepe", last_name: "Wepe", role: 0, therapist_id: user2.id)

chat1 = Chat.create!(name: "Ravi")
chat2 = Chat.create!(name: "Pepe")

message1 = Message.create!(chat_id: chat1.id, user_id: user3.id, content: "Hey, how did it go?")
message2 = Message.create!(chat_id: chat1.id, user_id: user1.id, content: "Not terrible")

columns = [
    {
        label: "TO-DO",
        value: "to_do"
    },
    {
        label: "IN PROGRESS",
        value: "in_progress"
    },
    {
        label: "REVIEW",
        value: "review"
    },
    {
        label: "DONE",
        value: "done"
    },
]

columns.each do |column|
    Column.create!(label: column[:label], value: column[:value])
end

tasks = [
  {
    title: "Make paper towel roll kaleidoscope",
    date: "2021-05-12",
    tag: "Science",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user1.id
  },
  {
    title: "Solar System Project",
    date: "2021-06-01",
    tag: "Science",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user1.id
  },
  {
    title: "Make phonics flip card",
    date: "2021-05-09",
    tag: "Reading",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user1.id
  },
  {
    title: "Read poetry",
    date: "2021-06-15",
    tag: "English",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user1.id
  },
  {
    title: "Make homemade ruler",
    date: "2021-05-09",
    tag: "Math",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user1.id
  },
  {
    title: "Multiplication table quiz",
    date: "2021-04-30",
    tag: "Math",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user1.id
  },
  {
    title: "Sudoku Challenge",
    date: "2021-06-19",
    tag: "Math",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user2.id
  },
  {
    title: "Practice clarinet",
    date: "2021-04-27",
    tag: "Music",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user2.id
  },
  {
    title: "Collect 5 different types of leaves",
    date: "2021-06-14",
    tag: "Science",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user2.id
  },
  {
    title: "Make lunch bag kite",
    date: "2021-05-17",
    tag: "Art",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user2.id
  },
  {
    title: "Make home map",
    date: "2021-05-20",
    tag: "Geography",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user2.id
  },
  {
    title: "Memorial Day - Word Jumble assignment",
    date: "2021-05-30",
    tag: "English",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user2.id
  },
  {
    title: "Read Chapter 3 of Charlotte's Web",
    date: "2021-05-05",
    tag: "Reading",
    column_id: Column.find_by(value: columns.sample[:value])[:id],
    user_id: user2.id
  }
]

tasks.each do |task|
    Task.create!(title: task[:title], date: task[:date], tag: task[:tag], column_id: task[:column_id], user_id: task[:user_id])
end
