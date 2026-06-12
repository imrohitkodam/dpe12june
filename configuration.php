<?php
/**
 * Joomla Global Configuration
 *
 * This file has been modified by the Akeeba Backup Restoration Script, when restoring or transferring your site.
 * 
 * This comment is removed whe you save the Global Configuration from Joomla's interface and/or when a third party
 * extension modifies your site's Global Configuration.
 * 
 * You can find the contents of the original file the Restoration Script read from your site in the 
 * configuration.bak.php file, located in the same directory as this file here. 
 */
class JConfig
{
	public $MetaAuthor = true;
	public $MetaDesc = 'Development version for tne new Joomla-based DPE site.';
	public $MetaKeys = '';
	public $MetaRights = '';
	public $MetaTitle = '1';
	public $MetaVersion = false;
	public $access = 1;
	public $asset_id = '1';
	public $behind_loadbalancer = false;
	public $cache_handler = 'file';
	public $cache_platformprefix = false;
	public $cachetime = 15;
	public $caching = 0;
	public $captcha = '0';
	public $cookie_domain = '';
	public $cookie_path = '';
	public $cors = false;
	public $cors_allow_headers = 'Content-Type,X-Joomla-Token';
	public $cors_allow_methods = '';
	public $cors_allow_origin = '*';
	public $db = 'dpe_12jun_db';
	public $dbencryption = false;
	public $dbprefix = 'z467w_';
	public $dbsslca = '';
	public $dbsslcert = '';
	public $dbsslcipher = '';
	public $dbsslkey = '';
	public $dbsslverifyservercert = false;
	public $dbtype = 'mysqli';
	public $debug = false;
	public $debug_lang = false;
	public $debug_lang_const = true;
	public $display_offline_message = 1;
	public $editor = 'tinymce';
	public $error_reporting = 'none';
	public $feed_email = 'none';
	public $feed_limit = 10;
	public $force_ssl = '2';
	public $fromname = 'Dpe-QA - development';
	public $frontediting = 1;
	public $gzip = false;
	public $helpurl = 'https://help.joomla.org/proxy/index.php?keyref:Help{major}{minor}:{keyref}';
	public $host = 'localhost';
	public $lifetime = 180;
	public $list_limit = 20;
	public $live_site = '';
	public $log_categories = '';
	public $log_category_mode = 0;
	public $log_deprecated = 0;
	public $log_everything = 0;
	public $log_path = '/var/www/ttpl-rt-234-php82.local/public/dpe_12jun/administrator/logs';
	public $log_priorities = array (
'0' => 'all'
);
	public $mailer = 'smtp';
	public $mailfrom = 'kb@dataprotection.education';
	public $mailonline = true;
	public $massmailoff = false;
	public $memcache_compress = '0';
	public $memcache_persist = '1';
	public $memcache_server_host = 'localhost';
	public $memcache_server_port = '11211';
	public $memcached_compress = false;
	public $memcached_persist = true;
	public $memcached_server_host = 'localhost';
	public $memcached_server_port = 11211;
	public $offline = false;
	public $offline_image = '';
	public $offline_message = 'This site is down for maintenance.<br />Please check back again soon.';
	public $offset = 'UTC';
	public $password = 'root';
	public $proxy_enable = false;
	public $proxy_host = '';
	public $proxy_pass = '';
	public $proxy_port = '';
	public $proxy_user = '';
	public $redis_persist = true;
	public $redis_server_auth = '';
	public $redis_server_db = 0;
	public $redis_server_host = 'localhost';
	public $redis_server_port = 6379;
	public $replyto = '';
	public $replytoname = '';
	public $robots = 'noindex, nofollow';
	public $secret = 'oY29eLsTzIIIDX2JvJBRcgyGpvNtMY7U';
	public $sef = true;
	public $sef_rewrite = true;
	public $sef_suffix = false;
	public $sendmail = '/usr/sbin/sendmail';
	public $session_filesystem_path = '';
	public $session_handler = 'database';
	public $session_memcache_server_host = 'localhost';
	public $session_memcache_server_port = '11211';
	public $session_memcached_server_host = 'localhost';
	public $session_memcached_server_port = 11211;
	public $session_metadata = true;
	public $session_metadata_for_guest = true;
	public $session_redis_persist = 1;
	public $session_redis_server_auth = '';
	public $session_redis_server_db = 0;
	public $session_redis_server_host = 'localhost';
	public $session_redis_server_port = 6379;
	public $shared_session = false;
	public $sitename = 'QA - DPE Knowledge Bank';
	public $sitename_pagetitles = 0;
	public $smtpauth = true;
	public $smtphost = 'email-smtp.eu-west-2.amazonaws.com';
	public $smtppass = 'BGtV/svAXVQJjp0b+8WU30WP7auBw+Vin3bHFNW25ePF';
	public $smtpport = 587;
	public $smtpsecure = 'tls';
	public $smtpuser = 'AKIATGFNBSHMSVVO5YXT';
	public $tmp_path = '/var/www/ttpl-rt-234-php82.local/public/dpe_12jun/tmp';
	public $unicodeslugs = false;
	public $user = 'root';
}
