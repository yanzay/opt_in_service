configure :development do
  set :database, 'sqlite:///dev.db'
end

configure :test do
  set :database, 'sqlite:///test.db'
end
