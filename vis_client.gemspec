# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "vis_client/version"

Gem::Specification.new do |s|
  s.name        = "vis_client"
  s.platform    = Gem::Platform::RUBY
  s.version     = VisClient::VERSION
  s.authors     = ["Tiago Lima"]
  s.email       = ["fltiago@gmail.com"]
  s.homepage    = "https://github.com/redu/vis_client"
  s.summary     = %q{Cliente da comunicação assíncrona entre o projeto core e o projeto de visualização.}
  s.description = %q{Cliente responsável pela comunicação entre o core e a visualização, com está gem será
                     possível se comunicar com o core apenas chamando um método e passando com parametro, os dados necessários e a url de destino.}

  s.rubyforge_project = "vis_client"
  s.add_development_dependency "ruby-debug"
  s.add_development_dependency "rspec"
  s.add_development_dependency "webmock"
  s.add_development_dependency "sqlite3"
  s.add_runtime_dependency "mongoid", ">= 2.7"
  s.add_runtime_dependency "bson_ext", ">= 1.5"
  s.add_runtime_dependency "delayed_job_mongoid"
  s.add_runtime_dependency "activerecord", ">= 3"
  s.add_runtime_dependency "valium"
  s.add_runtime_dependency "json"
  s.add_runtime_dependency "configurable"
  s.add_runtime_dependency "faraday"
  s.add_runtime_dependency "roar"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

end
