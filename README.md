# Heroku çalışmıyor

Motivasyon,

> @askn: elveda heroku artık çalışmıyor :(

Neden acaba?

Deponu

https://github.com/askn/osce

fork etmekle başladım,

https://github.com/19bal/osce

Klonladım, yeni dal oluşturdum ve ilkledim,

	$ git clone git@github.com:19bal/osce.git
	$ cd osce/
	$ git checkout -b bugfix-heroku
	$ bundle
	$ rake db:migrate

örnek bir kullanıcı da ekleyelim,

	$ vim db/seeds.rb
	User.create(:username => "seyyah", :password => "secret", :password_confirmation => "secret")
	$ rake db:seed

Heroku tarafına geçelim, bunun için daha önceden @bsaral'ın deposu üzerinde
yaptıklarımı tekrarlayacağım,

https://github.com/19bal/vys_rails/blob/auth/README.md

Heroku bölümüne geç. Burada sadece kodlar olacak, ayrıntıları ilgili README'ye
bak,

	$ heroku create askn-osce --stack cedar --remote heroku-askn-osce
	$ git push heroku-askn-osce bugfix-heroku:master
	$ heroku run rake db:migrate --app askn-osce
	$ heroku run rake db:seed    --app askn-osce

Test zamanıdır, http://askn-osce.herokuapp.com, hata mesajı alıyorum,

	We're sorry, but something went wrong.

sebebi ne acaba,

	$ heroku logs -t --app askn-osce
	app[web.1]: [...]
	ActionView::Template::Error ('twitter/bootstrap/bootstrap.less' wasn't found.
	app[web.1]: ActionView::Template::Error (css/home.css isn't precompiled):
	app[web.1]: [...]

cevabı geldi bile,

	ActionView::Template::Error ('twitter/bootstrap/bootstrap.less' wasn't
	found.

balık tutmayı öğrenelim. Bu nerede oldu heroku'da hata ney yukarıda,

	Google: heroku ActionView::Template::Error
	('twitter/bootstrap/bootstrap.less' wasn't found.

ilk stackoverflow'un yönlendirdiği dokuman:
https://github.com/seyhunak/twitter-bootstrap-rails/issues/123

> Don't put twitter-bootstrap-rails in your assets groups. Leave it at the top
> level. That should fix you right up.

o zaman,

	$ vim Gemfile
	gem 'twitter-bootstrap-rails'

assets grubunda kini sil ve dışarıya al.

commitle ve heroku'ya tekrardan yükle,

	$ git commit -a -m "Gemfile:heroku: bugfix: twitter-bootstrap"
	$ git push heroku-askn-osce bugfix-heroku:master

Test zamanıdır, http://askn-osce.herokuapp.com. Olay. Test kullanıcısı
"seyyah:secret".

# askn

http://osces.herokuapp.com

https://github.com/seyyah/osce/blob/login/README.md hepsini yapmadım!

	Gemfile düzenle
	rails g controller Users new
	rails g model user username:string password_digest:string
	rake db:migrate
	app/models/user.rb düzenle
	rails g controller sessions new
	app/views/sessions/new.html.erb düzenle
	config/routes.rb düzenle
	sessions_controller.rb düzenle
	:
	:
	:.

elveda heroku artık çalışmıyor :(
