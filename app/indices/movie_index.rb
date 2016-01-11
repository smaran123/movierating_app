ThinkingSphinx::Index.define :movie, :with => :active_record do
  indexes title
  indexes director
  has user_id, created_at, updated_at
end







