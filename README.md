# Redmine Microblog

## How to install

1. Download this plugin.

2. Copy redmine_microblog directory into plugin directory.
	* redmine 1.x : vendor/plugins 
	* redmine 2.x : plugins

3. Run database migrations.
	* redmine 1.x : rake db:migrate_plugins RAILS_ENV=production
	* redmine 2.x : rake redmine:plugins:migrate RAILS_ENV=production

4. Restart redmine.

5. Configure permissions. (Administration > Roles and permissions > Permissions report)

6. Have fun!

## License

MIT License
