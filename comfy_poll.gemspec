# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "comfy_poll"
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Oleg Khabarov", "The Working Group Inc."]
  s.date = "2012-02-13"
  s.description = ""
  s.email = "oleg@twg.ca"
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "README.md",
    "Rakefile",
    "VERSION",
    "app/assets/images/rails.png",
    "app/assets/javascripts/application.js",
    "app/assets/stylesheets/application.css",
    "app/controllers/admin/poll/base_controller.rb",
    "app/controllers/admin/poll/questions_controller.rb",
    "app/controllers/application_controller.rb",
    "app/helpers/application_helper.rb",
    "app/models/.gitkeep",
    "app/models/poll/answer.rb",
    "app/models/poll/question.rb",
    "app/views/layouts/application.html.erb",
    "config.ru",
    "config/application.rb",
    "config/boot.rb",
    "config/database.yml",
    "config/environment.rb",
    "config/environments/development.rb",
    "config/environments/production.rb",
    "config/environments/test.rb",
    "config/locales/en.yml",
    "config/routes.rb",
    "db/migrate/01_create_comfy_poll.rb",
    "db/seeds.rb",
    "doc/README_FOR_APP",
    "lib/comfy_poll.rb",
    "lib/comfy_poll/configuration.rb",
    "lib/tasks/.gitkeep",
    "log/.gitkeep",
    "public/404.html",
    "public/422.html",
    "public/500.html",
    "public/favicon.ico",
    "public/index.html",
    "public/robots.txt",
    "script/rails",
    "test/fixtures/.gitkeep",
    "test/fixtures/poll/answers.yml",
    "test/fixtures/poll/questions.yml",
    "test/functional/.gitkeep",
    "test/functional/admin/poll/questions_controller_test.rb",
    "test/integration/.gitkeep",
    "test/performance/browsing_test.rb",
    "test/test_helper.rb",
    "test/unit/.gitkeep",
    "test/unit/answer_test.rb",
    "test/unit/configuration_test.rb",
    "test/unit/question_test.rb",
    "vendor/assets/javascripts/.gitkeep",
    "vendor/assets/stylesheets/.gitkeep",
    "vendor/plugins/.gitkeep"
  ]
  s.homepage = "http://github.com/comfy/comfy-poll"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "ComfyPoll is a poll engine for Rails 3.1 apps (and ComfortableMexicanSofa)"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.1.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.1.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.1.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

