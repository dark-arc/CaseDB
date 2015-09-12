class MigrateNamesToAliases < ActiveRecord::Migration
  def up
    Person.all.each do |p|
      a = Alias.create name: p.name
      p.aliases << a
    end
  end

  def down
    Person.all.each do |p|
      a = p.aliases.first
      person.name = a
    end
  end
end
