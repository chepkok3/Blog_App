namespace :stylelint do
  desc 'Fix styling errors using stylelint'
  task :fix do
    sh 'npx stylelint "**/*.{css,scss}" -A'
  end
end
