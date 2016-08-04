DEPLOY_BUCKET=18f-dap

production:
	bundle exec jekyll build

dev:
	bundle exec jekyll serve --watch --config=_config.yml,_development.yml

deploy:
	make production && \
	rsync -rvzh --delete --exclude="data/*.csv" --exclude="data/live/*.*" \
	_site/ wsuwp-indie-deploy:/var/www/analytics.wsu.edu/ && \
	scp ./wsu-reports.json wsuwp-indie-deploy:/home/www-deploy/analytics-reporter/reports.json
