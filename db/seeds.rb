# frozen_string_literal: true

authors = [
  { name: "Ronnie O'Sullivan" },
  { name: "John Higgins" },
  { name: "Mark Selby" },
]

authors.each do |author|
  Author.create!(author) unless Author.exists?(name: author[:name])
end

talents = [
  { name: "Mark Selby", author_id: 3 },
  { name: "John Higgins", author_id: 2 },
  { name: "Luca Brecel" },
]

talents.each do |talent|
  Talent.create!(talent) unless Talent.exists?(name: talent[:name])
end

learning_paths = [
  { name: "Programming Languages" },
  { name: "Snooker" },
]

learning_paths.each do |learning_path|
  LearningPath.create!(learning_path) unless LearningPath.exists?(name: learning_path[:name])
end

courses = [
  { name: "Javascript 101", author_id: 1, learning_path_id: 1, created_at: "2023-01-01" },
  { name: "Python 101", author_id: 2, learning_path_id: 1, created_at: "2023-01-02" },
  { name: "Go 101", author_id: 3, learning_path_id: 1, created_at: "2023-01-03" },
  { name: "Java", author_id: 1, learning_path_id: 1, created_at: "2023-01-04" },
  { name: "Kotlin 101", author_id: 2, learning_path_id: 1, created_at: "2023-01-05" },
  { name: "Potting Angles", author_id: 3, learning_path_id: 2, created_at: "2023-01-06" },
]

courses.each do |course|
  Course.create!(course) unless Course.exists?(name: course[:name])
end
