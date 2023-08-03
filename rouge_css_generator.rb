require 'rouge'

theme = Rouge::Themes::Base16.mode(:light)
File.open("rouge-theme.css", "w") do |file|
  file.write(Rouge::Themes::Base16.mode(:light).render)
end
