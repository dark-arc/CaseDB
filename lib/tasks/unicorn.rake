task :dev_server do
	# optional port parameter
	port = ENV['PORT'] ? ENV['PORT'] : '3000'
	puts 'start unicorn development'
	sh "cd #{Rails.root} && RAILS_ENV=development unicorn -p #{port}"
end

task :pro_server do
	# optional port parameter
	port = ENV['PORT'] ? ENV['PORT'] : '3000'
	ENV['SECRET_KEY_BASE'] = 'e06a2dcb020356d86314bd67f14ad43252bbe02c8680f318fb90d15d29fa051500bed265e6d78636e4d327090a7945df81c2bfc07c7e9e247d49cadfaf435b6f'
	puts 'start unicorn development'
	sh "cd #{Rails.root} && RAILS_ENV=production unicorn -p #{port}"
end


# an alias task
task :s => :dev_server
task :server => :dev_server
