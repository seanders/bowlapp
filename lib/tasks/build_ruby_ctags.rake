task :build_tags do
  #runs ctag builder for rb files in your app's directory
  #i.e. methods/classes you wrote yourself
  find . -name '*.rb' | ctags -f .tags -L -

  #runs ctag builder for gems i.e. rails/other_gems
  require 'bundler'
  paths = Bundler.load.specs.map(&:full_gem_path)
  system("ctags -R -f .gemtags #{paths.join(' ')}")
end
