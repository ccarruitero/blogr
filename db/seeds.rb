# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Blog.create(title: 'a blog title', body: 'a blog body')
Comment.create(body: 'a comment', commentable_type: 'Blog', commentable_id: 1)
Comment.create(body: 'another comment', commentable_type: 'Blog', commentable_id: 1)
