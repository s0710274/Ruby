require 'rake'
require 'spec/rake/spectask'
 
desc "Run all examples with RCov"
Spec::Rake::SpecTask.new('su_rcov') do |t|
  t.spec_files = FileList['*_spec.rb']
  t.rcov = true
  t.rcov_opts = ['-i', 'naudotojas.rb,centras.rb,erdvelaivis.rb,kosmine_stotis.rb,kosmonautas.rb']
end