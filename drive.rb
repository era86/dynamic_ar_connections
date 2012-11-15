#!/usr/bin/env ruby

require 'active_record'

conf = YAML.load_file('database.yml')

ActiveRecord::Base.establish_connection conf[ENV['DB']]

ActiveRecord::Schema.define do
  create_table :dogs do |t|
    t.integer :id, :null => false
    t.string  :name
    t.date    :dob
  end
end

class Dog < ActiveRecord::Base
end

Dog.create({
  id:   0,
  name: 'Scruffy',
  dob:  '2012-01-01'
})

puts Dog.first.inspect
