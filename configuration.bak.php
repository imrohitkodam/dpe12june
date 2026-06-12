<?php
/**
 * ================================================================================
 * Backup copy of Joomla's configuration.php
 * ================================================================================
 *
 * Below you can find the contents of the configuration.php file which was read by
 * the Akeeba Backup Restoration Script when it initialised.
 *
 * This is NOT necessarily the contents of your backed up site's configuration.php
 * file. Every time you run the Restoration Script past the Site Setup page, the
 * configuration.php file gets modified. If you want to reset and start over after
 * going past the Site Setup page you'll need to extract your backup archive again. 
 */?><?php
class JConfig {
	public $offline = false;
	public $offline_message = 'This site is down for maintenance.<br />Please check back again soon.';
	public $display_offline_message = 1;
	public $offline_image = '';
	public $sitename = 'QA - DPE Knowledge Bank';
	public $editor = 'tinymce';
	public $captcha = '0';
	public $list_limit = 20;
	public $access = 1;
	public $debug = false;
	public $debug_lang = false;
	public $dbtype = 'mysqli';
	public $host = 'localhost';
	public $user = 'qa-kb-dpe';
	public $password = 'Ciykd0EfIA';
	public $db = 'qa_kb_dpe';
	public $dbprefix = 'z467w_';
	public $live_site = '';
	public $secret = 'MP5yMIQBiFsvayXp';
	public $gzip = false;
	public $error_reporting = 'none';
	public $helpurl = 'https://help.joomla.org/proxy/index.php?keyref:Help{major}{minor}:{keyref}';
	public $ftp_host = '127.0.0.1';
	public $ftp_port = '21';
	public $ftp_user = '';
	public $ftp_pass = '';
	public $ftp_root = '';
	public $ftp_enable = '0';
	public $offset = 'UTC';
	public $mailonline = true;
	public $mailer = 'smtp';
	public $mailfrom = 'kb@dataprotection.education';
	public $fromname = 'Dpe-QA - development';
	public $sendmail = '/usr/sbin/sendmail';
	public $smtpauth = true;
	public $smtpuser = 'AKIATGFNBSHMSVVO5YXT';
	public $smtppass = 'BGtV/svAXVQJjp0b+8WU30WP7auBw+Vin3bHFNW25ePF';
	public $smtphost = 'email-smtp.eu-west-2.amazonaws.com';
	public $smtpsecure = 'tls';
	public $smtpport = 587;
	public $caching = 0;
	public $cache_handler = 'file';
	public $cachetime = 15;
	public $MetaDesc = 'Development version for tne new Joomla-based DPE site.';
	public $MetaKeys = '';
	public $MetaTitle = '1';
	public $MetaAuthor = true;
	public $MetaVersion = false;
	public $robots = 'noindex, nofollow';
	public $sef = true;
	public $sef_rewrite = true;
	public $sef_suffix = false;
	public $unicodeslugs = false;
	public $feed_limit = 10;
	public $log_path = '/home/qa-kb-dpe/public_html/logs';
	public $tmp_path = '/home/qa-kb-dpe/public_html/tmp';
	public $lifetime = 180;
	public $session_handler = 'database';
	public $memcache_persist = '1';
	public $memcache_compress = '0';
	public $memcache_server_host = 'localhost';
	public $memcache_server_port = '11211';
	public $memcached_persist = true;
	public $memcached_compress = false;
	public $memcached_server_host = 'localhost';
	public $memcached_server_port = 11211;
	public $redis_persist = true;
	public $redis_server_host = 'localhost';
	public $redis_server_port = 6379;
	public $redis_server_auth = '';
	public $redis_server_db = 0;
	public $proxy_enable = false;
	public $proxy_host = '';
	public $proxy_port = '';
	public $proxy_user = '';
	public $proxy_pass = '';
	public $massmailoff = false;
	public $MetaRights = '';
	public $sitename_pagetitles = 0;
	public $force_ssl = 2;
	public $session_memcache_server_host = 'localhost';
	public $session_memcache_server_port = '11211';
	public $session_memcached_server_host = 'localhost';
	public $session_memcached_server_port = 11211;
	public $frontediting = 1;
	public $feed_email = 'none';
	public $cookie_domain = '';
	public $cookie_path = '';
	public $asset_id = '1';
	public $cache_platformprefix = false;
	public $dbencryption = 0;
	public $dbsslkey = '';
	public $dbsslcert = '';
	public $dbsslverifyservercert = false;
	public $dbsslca = '';
	public $dbsslcipher = '';
	public $debug_lang_const = true;
	public $cors = false;
	public $cors_allow_origin = '*';
	public $cors_allow_headers = 'Content-Type,X-Joomla-Token';
	public $cors_allow_methods = '';
	public $behind_loadbalancer = false;
	public $replyto = '';
	public $replytoname = '';
	public $session_filesystem_path = '';
	public $session_redis_persist = 1;
	public $session_redis_server_host = 'localhost';
	public $session_redis_server_port = 6379;
	public $session_redis_server_db = 0;
	public $shared_session = false;
	public $session_metadata = true;
	public $session_metadata_for_guest = true;
	public $log_everything = 0;
	public $log_deprecated = 0;
	public $log_priorities = array('0' => 'all');
	public $log_categories = '';
	public $log_category_mode = 0;
	public $session_redis_server_auth = '';
}