http://osces.herokuapp.com

	rails new osce
	Gemfile düzenle
	bundle install
	github ayarları //
	heroku create --stack cedar osces
	git add .
	git commit -am "hop"
	git push heroku master
	rails g controller home index
	rm public/index.html
	config/routes.rb ayar ver
	app/views/home/index.html.erb düzenle
	app/assets/stylesheets/... düzenle
	rails g bootstrap:install

Çay molası :P