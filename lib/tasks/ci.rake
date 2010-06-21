namespace :ci do
	desc 'Create db config'
	task :copy_yaml do
		system("cp #{RAILS_ROOT}/config/database.yml.sample #{RAILS_ROOT}/config/database.yml")
	end

	desc 'Prepare test suit'
	task :build => ['ci:copy_yaml', 'db:migrate', 'cucumber', 'spec'] do
	end
end
