Factory.define(:analyst) do |f|
  f.sequence(:name) { |n| "Name#{n}"}
end

Factory.define(:computer) do |f|
  f.sequence(:name) { |n| "Name#{n}"}
  f.programmer_id {|a| a.association(:programmer) }
end

Factory.define(:document) do |f|
  f.sequence(:name) { |n| "Name#{n}"}
end

Factory.define(:document_store) do |f|
  f.sequence(:name) { |n| "Name#{n}"}
  f.document_id {|a| a.association(:document) }
  f.analyst_id {|a| a.association(:analyst) }
end

Factory.define(:programmer) do |f|
  f.sequence(:name) { |n| "Name#{n}"}
end

Factory.define(:project) do |f|
  f.sequence(:name) { |n| "Name#{n}"}
end

Factory.define(:task) do |f|
  f.sequence(:name) { |n| "Name#{n}"}
  f.project_id {|a| a.association(:project) }
end
