# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.create(name: 'Who coined the term \'lean startup\'?', 
    answer: 'Eric Ries', 
    first_wrong_answer: 'Clayton Christensen', 
    second_wrong_answer: 'David Heinemeier Hansson',
    third_wrong_answer: 'Brant Cooper'
)

Question.create(name: 'Which term refers to a fast and quantitative market testing of a product or product feature?', 
    answer: 'Minimum viable product', 
    first_wrong_answer: 'Maximum viable product',
    second_wrong_answer: 'Miniscule viable product',
    third_wrong_answer: 'Minimum visible product'
)

Question.create(name: 'Which refers to a technology that helps create a new market and value network, eventually displacing an earlier technology?', 
    answer: 'Disruptive innovation', 
    first_wrong_answer: 'Sustaining technology',
    second_wrong_answer: 'Blah blah',
    third_wrong_answer: 'Blah blah'
)