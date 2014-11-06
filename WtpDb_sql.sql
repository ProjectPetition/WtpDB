CREATE TABLE `wtp_data_issues` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'TODO: please describe this field!',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT 'TODO: please describe this field!',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TODO: please describe this table!';
CREATE TABLE `wtp_data_petition_issues` (
  `petition_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'TODO: please describe this field!',
  `issue_id` int(11) NOT NULL DEFAULT '0' COMMENT 'TODO: please describe this field!'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TODO: please describe this table!';
CREATE TABLE `wtp_data_petition_responses` (
  `petition_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'TODO: please describe this field!',
  `response_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'TODO: please describe this field!',
  `association_time` int(11) NOT NULL DEFAULT '0' COMMENT 'TODO: please describe this field!'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TODO: please describe this table!';
CREATE TABLE `wtp_data_petitions` (
  `serial` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Internal ID for petition',
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT 'Petition ID defined by API',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'TODO: please describe this field!',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT 'TODO: please describe this field!',
  `body` text NOT NULL COMMENT 'TODO: please describe this field!',
  `signature_threshold` int(11) NOT NULL DEFAULT '0' COMMENT 'TODO: please describe this field!',
  `signature_count` int(11) NOT NULL DEFAULT '0' COMMENT 'TODO: please describe this field!',
  `signatures_needed` int(11) NOT NULL DEFAULT '0' COMMENT 'TODO: please describe this field!',
  `url` varchar(512) NOT NULL DEFAULT '' COMMENT 'TODO: please describe this field!',
  `deadline` int(11) NOT NULL DEFAULT '0' COMMENT 'TODO: please describe this field!',
  `status` varchar(32) NOT NULL DEFAULT '' COMMENT 'TODO: please describe this field!',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'TODO: please describe this field!',
  PRIMARY KEY (`serial`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=650 DEFAULT CHARSET=utf8 COMMENT='Stores petitions';
CREATE TABLE `wtp_data_responses` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT 'TODO: please describe this field!',
  `url` varchar(256) NOT NULL DEFAULT '' COMMENT 'TODO: please describe this field!',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TODO: please describe this table!';
CREATE TABLE `wtp_data_signatures` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `petition_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'Petition ID defined by API',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'type from API',
  `name` varchar(100) DEFAULT NULL,
  `city` varchar(30) NOT NULL DEFAULT '',
  `state` varchar(30) NOT NULL DEFAULT '',
  `zip` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `petition_id` (`petition_id`),
  KEY `signature_petition_idx` (`id`,`petition_id`),
  KEY `petition_created_idx` (`petition_id`,`created`),
  KEY `created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TODO: please describe this table!';
