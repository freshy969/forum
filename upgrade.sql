alter table posts add locked char(1) default 'N';
alter table users add moderator char(1) default 'N';
alter table posts add edited_at int(18) unsigned after modified_at;
alter table posts_replies add edited_at int(18) unsigned;
alter table users add karma int;
alter table posts_replies add votes_up int unsigned;
alter table posts_replies add votes_down int unsigned;
alter table posts add votes_up int unsigned after number_replies;
alter table posts add votes_down int unsigned after votes_up;
alter table users add votes int unsigned;
alter table users add votes_points int;

CREATE TABLE `posts_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `posts_id` int(10) unsigned NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `created_at` int(18) unsigned NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `posts_id` (`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `posts_replies_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `posts_replies_id` int(10) unsigned NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `created_at` int(18) unsigned NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `posts_replies_id` (`posts_replies_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;