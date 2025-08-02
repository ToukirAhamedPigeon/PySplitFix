CREATE TABLE `construction_heading` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `heading` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

CREATE TABLE `flash_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `ha_handover_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `file` varchar(256) DEFAULT NULL,
  `type` enum('post','pre') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sms_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost_per_sms` double(10,2) NOT NULL,
  `sender_id` bigint(11) NOT NULL,
  `bulk_company` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_audit_log` (
  `audit_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id` int(11) NOT NULL,
  `table_name` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `audit_log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action_type` char(1) NOT NULL,
  PRIMARY KEY (`audit_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=336695 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_bangla_digit` (
  `bangla_digit_id` int(11) NOT NULL AUTO_INCREMENT,
  `one` varchar(256) NOT NULL,
  `two` varchar(256) NOT NULL,
  `three` varchar(256) NOT NULL,
  `four` varchar(256) NOT NULL,
  `five` varchar(256) NOT NULL,
  `six` varchar(256) NOT NULL,
  `seven` varchar(256) NOT NULL,
  `eight` varchar(256) NOT NULL,
  `nine` varchar(256) NOT NULL,
  `zero` varchar(256) NOT NULL,
  PRIMARY KEY (`bangla_digit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_boundary_wall` (
  `boundary_wall_id` int(11) NOT NULL AUTO_INCREMENT,
  `boundary_id` varchar(100) DEFAULT NULL,
  `boundary_wall_parent_title` varchar(100) DEFAULT NULL,
  `boundary_id_number` varchar(100) DEFAULT NULL,
  `boundary_wall_parent` int(11) NOT NULL,
  `wall_id_for_title` int(11) NOT NULL,
  `boundary_wall_name` text NOT NULL,
  `boundary_wall_name_bangla` text DEFAULT NULL,
  `geo_district` int(11) DEFAULT NULL,
  `boundary_wall_address` text NOT NULL,
  `boundary_wall_ownership` int(11) NOT NULL,
  `phase_of_construction` int(11) NOT NULL,
  `phase_details` mediumtext NOT NULL,
  `construction_start_date` varchar(100) DEFAULT NULL,
  `construction_end_date` varchar(100) DEFAULT NULL,
  `use_started_on` date DEFAULT NULL,
  `use_ended_on` date DEFAULT NULL,
  `ownership` int(11) DEFAULT NULL,
  `new_construction_start_date` varchar(100) DEFAULT NULL,
  `new_construction_end_date` varchar(100) DEFAULT NULL,
  `construction_cost` float NOT NULL,
  `wall_current_height` float NOT NULL,
  `wall_required_length` float NOT NULL,
  `total_land_area` float NOT NULL,
  `wall_existing_length` float NOT NULL,
  `barbed_wire` float NOT NULL,
  `structural_type` int(11) NOT NULL,
  `wall_color` int(11) NOT NULL,
  `wall_color_type` int(11) NOT NULL,
  `wall_plaster_type` int(11) NOT NULL,
  `contractor_information` mediumtext NOT NULL,
  `boundary_wall_remarks` mediumtext NOT NULL,
  `wall_construction_condition` int(11) NOT NULL,
  `verified_status` int(11) NOT NULL,
  `verified_by` int(11) NOT NULL,
  `verified_date` date DEFAULT NULL,
  `title_for_id` varchar(256) NOT NULL,
  `present_use` int(11) NOT NULL,
  `object_height` int(11) NOT NULL,
  PRIMARY KEY (`boundary_wall_id`),
  KEY `boundary_wall_parent` (`boundary_wall_parent`,`wall_id_for_title`,`title_for_id`(255))
) ENGINE=InnoDB AUTO_INCREMENT=14313 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_boundary_wall_image` (
  `boundary_wall_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `boundary_wall_id` int(11) NOT NULL,
  `boundary_wall_image` varchar(256) NOT NULL,
  `boundary_wall_image_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `picture_folder_name` int(11) DEFAULT NULL,
  `image_description` mediumtext NOT NULL,
  `image_priority` int(11) DEFAULT '1000',
  `common_path` varchar(100) DEFAULT 'boundary_wall_image',
  PRIMARY KEY (`boundary_wall_image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=268075 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_boundary_wall_shapon` (
  `boundary_wall_id` int(11) NOT NULL,
  `boundary_wall_parent` int(11) NOT NULL,
  `wall_id_for_title` int(11) NOT NULL,
  `boundary_wall_name` text NOT NULL,
  `boundary_wall_address` text NOT NULL,
  `boundary_wall_ownership` int(11) NOT NULL,
  `phase_of_construction` int(11) NOT NULL,
  `phase_details` mediumtext NOT NULL,
  `construction_start_date` int(4) NOT NULL,
  `construction_end_date` int(4) NOT NULL,
  `construction_cost` float NOT NULL,
  `wall_current_height` float DEFAULT NULL,
  `wall_required_length` float NOT NULL,
  `total_land_area` float DEFAULT NULL,
  `wall_existing_length` float DEFAULT NULL,
  `barbed_wire` float DEFAULT NULL,
  `structural_type` int(11) NOT NULL,
  `wall_color` int(11) NOT NULL,
  `wall_color_type` int(11) NOT NULL,
  `wall_plaster_type` int(11) NOT NULL,
  `contractor_information` mediumtext NOT NULL,
  `boundary_wall_remarks` mediumtext NOT NULL,
  `wall_construction_condition` int(11) NOT NULL,
  `verified_status` int(11) NOT NULL,
  `verified_by` int(11) NOT NULL,
  `verified_date` date DEFAULT NULL,
  `title_for_id` varchar(256) DEFAULT NULL,
  `present_use` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_building_architectural_document` (
  `ar_doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_unit_id` int(11) NOT NULL,
  `b_type` varchar(5) DEFAULT 's',
  `building_id` int(11) NOT NULL,
  `ar_doc_type` varchar(50) NOT NULL,
  `folder_type` int(11) NOT NULL DEFAULT '0',
  `folder` varchar(255) DEFAULT NULL,
  `ar_doc_data_remarks` text NOT NULL,
  `ar_doc_data_lovdata` varchar(255) NOT NULL,
  `ar_doc_data_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL DEFAULT '440',
  PRIMARY KEY (`ar_doc_id`),
  UNIQUE KEY `overview_data_id` (`ar_doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9019 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_building_electric_meters` (
  `meter_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_building_image` (
  `building_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_info_id` int(11) NOT NULL,
  `building_image` varchar(256) NOT NULL,
  `building_image_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `picture_folder_name` int(11) DEFAULT NULL,
  `image_description` mediumtext NOT NULL,
  `image_priority` int(11) DEFAULT '1000',
  `common_path` varchar(100) DEFAULT 'building_image',
  PRIMARY KEY (`building_image_id`),
  KEY `building_info_id` (`building_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=419465 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_building_image_old` (
  `building_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_info_id` int(11) NOT NULL,
  `building_image` varchar(256) NOT NULL,
  `building_image_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `picture_folder_name` int(11) DEFAULT NULL,
  `image_description` mediumtext NOT NULL,
  `image_priority` int(11) DEFAULT '1000',
  `common_path` varchar(100) DEFAULT 'building_image',
  PRIMARY KEY (`building_image_id`),
  KEY `building_info_id` (`building_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=259295 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_building_info` (
  `building_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_id` varchar(50) DEFAULT NULL,
  `building_ids_old` text,
  `building_id_number` varchar(40) DEFAULT NULL,
  `building_info_parent` int(11) DEFAULT NULL,
  `building_info_parent_title` varchar(100) DEFAULT NULL,
  `building_id_for_title` int(11) DEFAULT NULL,
  `object_name` text NOT NULL,
  `object_name_bangla` text DEFAULT NULL,
  `geo_district` int(11) DEFAULT NULL,
  `object_address` text NOT NULL,
  `present_use` int(11) DEFAULT NULL,
  `ownership` int(11) DEFAULT NULL,
  `usage_type` int(11) DEFAULT NULL,
  `present_condition` int(11) DEFAULT NULL,
  `type_of_object` int(11) DEFAULT NULL,
  `foundation_height` int(11) DEFAULT NULL,
  `number_of_current_floor` int(11) DEFAULT NULL,
  `construction_start_date` varchar(100) DEFAULT NULL,
  `construction_end_date` varchar(100) DEFAULT NULL,
  `use_started_on` date DEFAULT NULL,
  `use_ended_on` date DEFAULT NULL,
  `new_construction_start_date` varchar(100) DEFAULT NULL,
  `new_construction_end_date` varchar(100) DEFAULT NULL,
  `construction_cost` float NOT NULL,
  `frame_of_structure` int(11) DEFAULT NULL,
  `object_summery` mediumtext NOT NULL,
  `inside_color` int(11) DEFAULT NULL,
  `floor_main_building` int(11) DEFAULT NULL,
  `floor_bathroom` int(11) DEFAULT NULL,
  `floor_kitchen` int(11) DEFAULT NULL,
  `building_total_area` float DEFAULT NULL,
  `per_floor_area` float DEFAULT NULL,
  `quality_wooden` int(11) DEFAULT NULL,
  `sanitation_system` int(11) DEFAULT NULL,
  `quality_electric` int(11) DEFAULT NULL,
  `grill_quality` int(11) DEFAULT NULL,
  `quality_of_glass` int(11) DEFAULT NULL,
  `quality_of_plaster` int(11) DEFAULT NULL,
  `construction_type` int(11) DEFAULT NULL,
  `building_architectural_type` int(11) DEFAULT NULL,
  `contractor_information` mediumtext NOT NULL,
  `verified_status` int(11) DEFAULT NULL,
  `verified_by` int(11) DEFAULT NULL,
  `verified_date` date DEFAULT NULL,
  `building_image` varchar(256) NOT NULL,
  `image_description` text NOT NULL,
  `picture_folder_name` text DEFAULT NULL,
  `title_for_id` varchar(256) DEFAULT ' ',
  `object_length` float DEFAULT NULL,
  `object_height` decimal(10,2) DEFAULT NULL,
  `related_land_ids` text,
  `repair_access` varchar(256) DEFAULT NULL,
  `flats_per_floor` int(11) DEFAULT NULL,
  `total_flats` int(11) DEFAULT NULL,
  `flat_size` int(11) DEFAULT NULL,
  `construction_project_type` int(11) DEFAULT NULL,
  `is_selected` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`building_info_id`),
  KEY `building_info_parent` (`building_info_parent`,`building_id_for_title`,`title_for_id`(255)),
  KEY `present_use` (`present_use`,`ownership`,`type_of_object`,`number_of_current_floor`,`verified_by`,`verified_date`),
  KEY `verified_status` (`verified_status`)
) ENGINE=InnoDB AUTO_INCREMENT=17497 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `tbl_building_info_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_info_id` int(11) NOT NULL,
  `building_id` varchar(255) DEFAULT NULL,
  `building_ids_old` text,
  `object_name` text,
  `object_name_bangla` text DEFAULT NULL,
  `geo_district` varchar(100) DEFAULT NULL,
  `geo_location` text,
  `present_use_id` int(11) DEFAULT NULL,
  `present_use` varchar(255) DEFAULT NULL,
  `building_image` int(11) DEFAULT NULL,
  `repair_image` int(11) DEFAULT NULL,
  `ownership` varchar(255) DEFAULT NULL,
  `usage_type` varchar(256) DEFAULT NULL,
  `total_area` varchar(255) DEFAULT NULL,
  `per_floor_area` varchar(255) DEFAULT NULL,
  `building_type` varchar(255) DEFAULT NULL,
  `construction_cost` float(20,2) DEFAULT NULL,
  `construction_start` varchar(255) DEFAULT NULL,
  `construction_end` varchar(255) DEFAULT NULL,
  `use_started_on` varchar(256) DEFAULT NULL,
  `use_ended_on` date DEFAULT NULL,
  `last_repair_cost` float(20,0) DEFAULT NULL,
  `last_repair_start` varchar(255) DEFAULT NULL,
  `foundation_height` varchar(255) DEFAULT NULL,
  `verified_status` varchar(255) DEFAULT NULL,
  `verified_by` varchar(255) DEFAULT NULL,
  `verified_date` varchar(255) DEFAULT NULL,
  `construction_condition` varchar(255) DEFAULT NULL,
  `number_of_current_floor` varchar(255) DEFAULT NULL,
  `object_summary` text,
  `present_condition_id` int(11) DEFAULT NULL,
  `present_condition` varchar(255) DEFAULT NULL,
  `range_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `building_architectural_type` varchar(255) DEFAULT NULL,
  `image` text,
  `empty_fields` text,
  `empty_score` varchar(255) DEFAULT NULL,
  `total_site_map` int(11) NOT NULL DEFAULT '0',
  `total_building_design` int(11) NOT NULL DEFAULT '0',
  `total_digital_survey` int(11) NOT NULL DEFAULT '0',
  `total_detail_architectural_design` int(11) NOT NULL DEFAULT '0',
  `total_master_plan` int(11) NOT NULL DEFAULT '0',
  `total_finishing_schedule` int(11) NOT NULL DEFAULT '0',
  `document_last_update` datetime DEFAULT NULL,
  `related_land_ids` text,
  `related_land_infos` text,
  `total_land_acre` double DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `repair_access` varchar(256) DEFAULT NULL,
  `flats_per_floor` int(11) DEFAULT NULL,
  `total_flats` int(11) DEFAULT NULL,
  `flat_size` int(11) DEFAULT NULL,
  `project_type` varchar(191) DEFAULT NULL,
  `construction_project_type_id` int(11) DEFAULT NULL,
  `is_selected` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11798 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_building_or_boundary` (
  `building_or_boundary_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid_building` int(11) NOT NULL,
  `ptype` varchar(256) NOT NULL,
  PRIMARY KEY (`building_or_boundary_id`),
  KEY `pid_building` (`pid_building`,`ptype`(255))
) ENGINE=InnoDB AUTO_INCREMENT=17497 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_building_or_custom_unit` (
  `custom_unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_unit_id` int(11) NOT NULL,
  `building_unit_parent` int(11) NOT NULL DEFAULT '-2',
  `custom_extra` int(11) NOT NULL,
  PRIMARY KEY (`custom_unit_id`),
  KEY `building_unit_id` (`building_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_building_repair_unitwise_repair_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_info_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `repair_code` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_building_unit` (
  `building_unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id_for_title` int(11) NOT NULL,
  `unit_parent_id` int(11) NOT NULL DEFAULT '7859',
  `unit_name` text NOT NULL,
  `unit_type_id` int(11) NOT NULL COMMENT 'Parent table',
  `custom_unit_id` int(11) NOT NULL,
  `sort_by` int(11) NOT NULL,
  `unit_title` varchar(200) DEFAULT 'not set yet' COMMENT 'Unit ID',
  `next_building_id` int(11) DEFAULT '1',
  `next_boundary_id` int(11) DEFAULT '1',
  `custom_unit_parent` int(11) NOT NULL,
  `assumed_total_rental_office` int(11) NOT NULL DEFAULT '0',
  `assumed_total_electric_meter` int(11) NOT NULL DEFAULT '0',
  `phq_officer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`building_unit_id`),
  KEY `unit_id_for_title` (`unit_id_for_title`,`unit_parent_id`,`unit_type_id`),
  KEY `custom_unit_parent` (`custom_unit_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=118527 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_building_unit_shapon` (
  `building_unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id_for_title` int(11) NOT NULL,
  `unit_parent_id` int(11) NOT NULL,
  `unit_name` text NOT NULL,
  `unit_type_id` int(11) NOT NULL COMMENT 'Parent table',
  `custom_unit_id` int(11) NOT NULL,
  `sort_by` int(11) NOT NULL,
  `unit_title` varchar(200) DEFAULT 'not set yet' COMMENT 'Unit ID',
  `custom_unit_parent` int(11) NOT NULL,
  PRIMARY KEY (`building_unit_id`),
  KEY `unit_id_for_title` (`unit_id_for_title`,`unit_parent_id`,`unit_type_id`),
  KEY `custom_unit_parent` (`custom_unit_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=11835 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_building_wall_repair` (
  `building_wall_repair_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_wall` varchar(10) DEFAULT NULL,
  `building_info_id` int(11) DEFAULT NULL,
  `project_title` text NOT NULL,
  `building_wall_repair_year` int(11) DEFAULT NULL,
  `tender_amount` decimal(20,2) DEFAULT NULL,
  `repair_start_date` date DEFAULT NULL,
  `repair_end_date` date DEFAULT NULL,
  `contractor_name` text DEFAULT NULL,
  `contractor_address` text,
  `allocation_amount` decimal(20,2) DEFAULT NULL,
  `bill_paid_amount` decimal(20,2) DEFAULT NULL,
  `supervisor` text NOT NULL,
  `estate_officer` text NOT NULL,
  `unit_in_charge` text NOT NULL,
  `work_description` text,
  `building_wall_repair_remark` text NOT NULL,
  `repair_progress_status` int(11) DEFAULT NULL,
  `repair_progress_remarks` text NOT NULL,
  `verified_status` int(11) DEFAULT NULL,
  `verified_by` int(11) DEFAULT NULL,
  `verified_date` date DEFAULT NULL,
  `repair_initial_visit` text,
  `repair_initial_visit_updated_at` datetime DEFAULT NULL,
  `repair_during_visit` text,
  `repair_during_visit_updated_at` datetime DEFAULT NULL,
  `repair_finishing_visit` text,
  `repair_finishing_visit_updated_at` datetime DEFAULT NULL,
  `repair_id` int(11) DEFAULT NULL,
  `repair_summary` longtext,
  `project_closing_report` longtext,
  `comment_from_estate_officer` longtext,
  `allocation_sarok` text DEFAULT NULL,
  `allocation_sarok_date` date DEFAULT NULL,
  `tec_sarok` text DEFAULT NULL,
  `tec_sarok_date` date DEFAULT NULL,
  `final_allotment_sarok` text DEFAULT NULL,
  `final_allotment_sarok_date` date DEFAULT NULL,
  `work_order_date` date DEFAULT NULL,
  `noa_contract_price` decimal(10,2) DEFAULT NULL,
  `implemented_contract_price` decimal(10,2) DEFAULT NULL,
  `work_starting_date_as_per_contract` date DEFAULT NULL,
  `work_actual_starting_date` date DEFAULT NULL,
  `work_extension_period` varchar(256) DEFAULT NULL,
  `late_fee` decimal(10,2) DEFAULT NULL,
  `work_progress_rate_as_per_contract` decimal(10,2) DEFAULT NULL,
  `work_progress_as_per_paid_price` decimal(10,2) DEFAULT NULL,
  `special_comment` text DEFAULT NULL,
  PRIMARY KEY (`building_wall_repair_id`),
  KEY `building_info_id` (`building_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16859 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_parent` int(11) DEFAULT NULL,
  `category_lookup_name` longtext DEFAULT NULL,
  `category_description` longtext,
  `numeric_value` int(11) DEFAULT NULL COMMENT 'numaric??',
  `sort_by` int(11) DEFAULT NULL,
  `category_status` int(1) DEFAULT NULL,
  `category_default` int(11) DEFAULT NULL,
  `unit_code` varchar(191) DEFAULT NULL,
  `ddo_code` varchar(191) DEFAULT NULL,
  `category_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `category_id` (`category_id`,`numeric_value`),
  KEY `category_id_2` (`category_id`),
  KEY `numeric_value` (`numeric_value`)
) ENGINE=InnoDB AUTO_INCREMENT=7178 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_construction_allot` (
  `construction_allot_id` int(11) NOT NULL AUTO_INCREMENT,
  `construction_info_id` int(11) NOT NULL,
  `construction_allot_year1` decimal(20,2) NOT NULL,
  `construction_allot_year2` decimal(20,2) NOT NULL,
  `construction_allot_year3` decimal(20,2) NOT NULL,
  `construction_allot_year4` decimal(20,2) NOT NULL,
  `allot_percent1` int(11) NOT NULL,
  `allot_percent2` int(11) NOT NULL,
  `allot_percent3` int(11) NOT NULL,
  `allot_percent4` int(11) NOT NULL,
  `fiscal_year` int(11) NOT NULL,
  PRIMARY KEY (`construction_allot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_construction_budget_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fiscal_year_id` int(11) NOT NULL,
  `initial_budget` double(20,2) DEFAULT '0.00',
  `revised_budget_extra` double(20,2) DEFAULT '0.00',
  `reappropriation_budget_extra` double(20,2) DEFAULT '0.00',
  `final_budget` double(20,2) DEFAULT '0.00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_construction_data_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `building_unit` varchar(255) DEFAULT NULL,
  `project_title` text,
  `project_expense` decimal(20,3) DEFAULT NULL,
  `ao_date` varchar(255) DEFAULT NULL,
  `ao_amount` decimal(20,2) DEFAULT NULL,
  `tec_by_unit_date` varchar(255) DEFAULT NULL,
  `tec_approval_pwd_date` varchar(255) DEFAULT NULL,
  `estimated_cost` decimal(20,2) DEFAULT NULL,
  `tec_approval_phq_date` varchar(255) DEFAULT NULL,
  `building_id` varchar(255) DEFAULT NULL,
  `ao_amount_phq` decimal(20,2) DEFAULT NULL,
  `variation_amount` decimal(20,2) DEFAULT NULL,
  `variation_amount_2` decimal(20,2) DEFAULT NULL,
  `variation_amount_3` double DEFAULT '0',
  `fiscal_year_amount_1` decimal(20,2) DEFAULT NULL,
  `fiscal_year_amount_2` decimal(20,2) DEFAULT NULL,
  `fiscal_year_amount_3` decimal(20,2) DEFAULT NULL,
  `fiscal_year_amount_4` decimal(20,2) DEFAULT NULL,
  `total_bill_paid` decimal(20,2) DEFAULT NULL,
  `project_start_fiscal_year` varchar(255) DEFAULT NULL,
  `project_close_fiscal_year` varchar(255) DEFAULT NULL,
  `project_close_date` varchar(255) DEFAULT NULL,
  `target_close_date` varchar(255) DEFAULT NULL,
  `project_type` varchar(255) DEFAULT NULL,
  `tender_type` varchar(255) DEFAULT NULL,
  `tenderer_person` varchar(255) DEFAULT NULL,
  `tender_opening_date` varchar(255) DEFAULT NULL,
  `tec_amount` decimal(20,3) DEFAULT NULL,
  `ao_letter_memo` int(11) DEFAULT NULL,
  `rao_letter_memo` int(11) DEFAULT NULL,
  `tec_letter_memo` int(11) DEFAULT NULL,
  `work_order_date` varchar(255) DEFAULT NULL,
  `work_speed_status` varchar(100) NOT NULL DEFAULT 'As Usual',
  `work_speed_status_id` int(11) NOT NULL DEFAULT '1729',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `has_child` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `work_starting_date` varchar(255) DEFAULT NULL,
  `project_duration` int(11) DEFAULT NULL,
  `projected_completion_date` varchar(255) DEFAULT NULL,
  `actual_completion_date` varchar(255) DEFAULT NULL,
  `revised_ao_amount_before_tec` decimal(20,2) DEFAULT NULL,
  `revised_approved_amount_after_tec` decimal(20,2) DEFAULT NULL,
  `revised_approved_amount_pwd_after_tec` double DEFAULT NULL,
  `variation_amount_pwd` double DEFAULT NULL,
  `need_variation_pwd` int(11) DEFAULT '0',
  `revised_approved_amount_after_tec_date` date DEFAULT NULL,
  `revised_approved_amount_after_tec_date_pwd` date DEFAULT NULL,
  `revised_approved_amount_2_after_tec` decimal(20,2) DEFAULT NULL,
  `revised_approved_amount_2_pwd_after_tec` double DEFAULT NULL,
  `variation_amount_pwd_2` double DEFAULT NULL,
  `need_variation_pwd_2` int(11) DEFAULT '0',
  `revised_approved_amount_2_after_tec_date` date DEFAULT NULL,
  `revised_approved_amount_2_after_tec_date_pwd` date DEFAULT NULL,
  `revised_approved_amount_3_after_tec` double DEFAULT '0',
  `revised_approved_amount_3_pwd_after_tec` double DEFAULT '0',
  `variation_amount_pwd_3` double DEFAULT '0',
  `need_variation_pwd_3` int(11) DEFAULT '0',
  `revised_approved_amount_3_after_tec_date` date DEFAULT NULL,
  `revised_approved_amount_3_after_tec_date_pwd` date DEFAULT NULL,
  `is_pwd_send_variation_proposal` int(11) DEFAULT '0',
  `is_pwd_send_variation_proposal_2` int(11) DEFAULT '0',
  `is_pwd_send_variation_proposal_3` int(11) DEFAULT '0',
  `possible_date_for_pwd_to_send_variation_proposal` date DEFAULT NULL,
  `possible_date_for_pwd_to_send_variation_proposal_2` date DEFAULT NULL,
  `possible_date_for_pwd_to_send_variation_proposal_3` date DEFAULT NULL,
  `proposed_revised_amount_after_tec` double DEFAULT NULL,
  `proposed_revised_amount_after_tec_2` double DEFAULT NULL,
  `proposed_revised_amount_after_tec_3` double DEFAULT NULL,
  `proposed_variation_amount_after_tec` double DEFAULT NULL,
  `proposed_variation_amount_after_tec_2` double DEFAULT NULL,
  `proposed_variation_amount_after_tec_3` double DEFAULT NULL,
  `proposed_variation_date_after_tec` date DEFAULT NULL,
  `proposed_variation_date_after_tec_2` date DEFAULT NULL,
  `proposed_variation_date_after_tec_3` date DEFAULT NULL,
  `variation_proposal_letter` text,
  `variation_proposal_letter_2` text,
  `variation_proposal_letter_3` text,
  `cause_of_variation` text,
  `cause_of_variation_2` text,
  `cause_of_variation_3` text,
  `pwd_variation_approval_letter` text,
  `pwd_variation_approval_letter_2` text,
  `pwd_variation_approval_letter_3` text,
  `save_amount` decimal(20,2) DEFAULT NULL,
  `project_closing_amount` double(20,2) DEFAULT '0.00',
  `contractor_name` text,
  `contractor_address` text,
  `comments_on_contractor` text,
  `project_status` varchar(255) DEFAULT NULL,
  `last_project_status_change_log_text` text,
  `revised_ao_date` varchar(255) DEFAULT NULL,
  `economic_code_no` varchar(255) DEFAULT NULL,
  `district_name` text DEFAULT NULL,
  `is_ms_report_2` tinyint(1) NOT NULL DEFAULT '0',
  `is_ms_report` tinyint(1) NOT NULL DEFAULT '0',
  `is_ms_report_2_2425` tinyint(4) DEFAULT '0',
  `is_ms_report_2425` tinyint(4) DEFAULT '0',
  `temp_physical_progress` double(20,2) DEFAULT NULL,
  `physical_progress` varchar(255) DEFAULT NULL,
  `paid_bill` decimal(20,2) DEFAULT NULL,
  `range_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `construction_project_type_id` int(11) DEFAULT NULL,
  `project_start_year_id` int(11) DEFAULT NULL,
  `project_close_year_id` int(11) DEFAULT NULL,
  `tender_type_id` int(11) DEFAULT NULL,
  `tenderer_person_id` int(11) DEFAULT NULL,
  `project_status_id` int(11) DEFAULT NULL,
  `enlistment_amount` decimal(20,2) DEFAULT NULL,
  `enlistment_date` varchar(255) DEFAULT NULL,
  `progress_report_last_publish_month` varchar(255) DEFAULT NULL,
  `construction_type_bangla` text,
  `construction_floor_bangla` text,
  `district_name_bangla` varchar(255) DEFAULT NULL,
  `financial_progress` varchar(255) DEFAULT NULL,
  `geo_district` varchar(255) DEFAULT NULL,
  `section_id` int(11) DEFAULT '0',
  `ministry_head` varchar(190) DEFAULT NULL,
  `ministry_head_description` text,
  `ministry_head_id` int(11) DEFAULT NULL,
  `geo_district_id` int(11) DEFAULT NULL,
  `cumulative_allotment_upto_date` decimal(20,2) DEFAULT NULL,
  `progress_percentage_variation` varchar(255) DEFAULT NULL,
  `last_activity` text,
  `phq_officer_id` int(11) NOT NULL DEFAULT '0',
  `phq_officer` varchar(255) DEFAULT NULL,
  `noa_file` text,
  `wo_letter` text,
  `project_time_spend_percent` varchar(255) DEFAULT NULL,
  `variation_in_physical_progress_and_time_spend` varchar(255) DEFAULT NULL,
  `allotment_due` decimal(20,2) DEFAULT NULL,
  `is_project_finished` varchar(100) DEFAULT NULL,
  `is_payment_complete` varchar(100) DEFAULT NULL,
  `is_in_use` varchar(100) DEFAULT NULL,
  `progress_report_allotment` double DEFAULT '0',
  `progress_report_expense` double DEFAULT '0',
  `progress_report_allotment_expense_variation` double DEFAULT '0',
  `image` longtext,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `proposed_current_year_allotment` double(20,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=174146 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_construction_data_view_fiscal` (
  `project_id` int(11) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `current_year_allotment` decimal(20,2) DEFAULT NULL,
  `ibass_allotment_current` double(20,2) DEFAULT NULL,
  `ibass_upload_date_current` datetime DEFAULT NULL,
  `ibass_allotment_difference_current` double(20,2) DEFAULT NULL,
  `ibass_allotment_past` double(20,2) DEFAULT NULL,
  `ibass_upload_date_past` datetime DEFAULT NULL,
  `ibass_allotment_difference_past` double(20,2) DEFAULT NULL,
  `ibass_allotment_current_past_difference` double(20,2) DEFAULT NULL,
  `cumulative_allotment_upto_last_year` decimal(20,2) DEFAULT NULL,
  `demand_1` decimal(20,2) DEFAULT NULL,
  `demand_2` decimal(20,2) DEFAULT NULL,
  `demand_3` decimal(20,2) DEFAULT NULL,
  `demand_4` decimal(20,2) DEFAULT NULL,
  `demand_5` decimal(20,2) DEFAULT NULL,
  `demand_surrender_1` decimal(20,2) DEFAULT NULL,
  `demand_surrender_2` decimal(20,2) DEFAULT NULL,
  `demand_surrender_3` decimal(20,2) DEFAULT NULL,
  `demand_surrender_4` decimal(20,2) DEFAULT NULL,
  `installment_1` decimal(20,2) DEFAULT NULL,
  `installment_date_1` date DEFAULT NULL,
  `installment_letter_1` int(11) DEFAULT NULL,
  `installment_2` decimal(20,2) DEFAULT NULL,
  `installment_date_2` date DEFAULT NULL,
  `installment_letter_2` int(11) DEFAULT NULL,
  `installment_3` decimal(20,2) DEFAULT NULL,
  `installment_date_3` date DEFAULT NULL,
  `installment_letter_3` int(11) DEFAULT NULL,
  `installment_4` decimal(20,2) DEFAULT NULL,
  `installment_date_4` date DEFAULT NULL,
  `installment_letter_4` int(11) DEFAULT NULL,
  `installment_5` decimal(20,2) DEFAULT NULL,
  `installment_date_5` date DEFAULT NULL,
  `installment_letter_5` int(11) DEFAULT NULL,
  `surrender_1` decimal(20,2) DEFAULT NULL,
  `surrender_date_1` date DEFAULT NULL,
  `surrender_letter_1` int(11) DEFAULT NULL,
  `surrender_2` decimal(20,2) DEFAULT NULL,
  `surrender_date_2` date DEFAULT NULL,
  `surrender_letter_2` int(11) DEFAULT NULL,
  `surrender_3` decimal(20,2) DEFAULT NULL,
  `surrender_date_3` date DEFAULT NULL,
  `surrender_letter_3` int(11) DEFAULT NULL,
  `surrender_4` decimal(20,2) DEFAULT NULL,
  `surrender_date_4` date DEFAULT NULL,
  `surrender_letter_4` int(11) DEFAULT NULL,
  `total_approved_amount` decimal(20,2) DEFAULT NULL,
  `remaining_allotment` decimal(20,2) DEFAULT NULL,
  `final_remaining_allotment` double DEFAULT NULL,
  `remaining_allotment_ao` decimal(20,2) DEFAULT NULL,
  `budget_request` decimal(20,2) DEFAULT NULL,
  `surrender_request` decimal(20,2) DEFAULT NULL,
  `remaining_allotment_ao_today` decimal(20,2) DEFAULT NULL,
  `current_year_withdraw` decimal(20,2) DEFAULT NULL,
  `current_year_allotment_non_residential` decimal(20,2) DEFAULT NULL,
  `current_year_allotment_residential` decimal(20,2) DEFAULT NULL,
  `current_year_total_installment` decimal(20,2) DEFAULT NULL,
  `remaining_allotment_tec_today` decimal(20,2) DEFAULT NULL,
  `remaining_allotment_revised_ao_today` decimal(20,2) DEFAULT NULL,
  `not_approved_allotment` decimal(20,2) DEFAULT NULL,
  `not_approved_withdraw` decimal(20,2) DEFAULT NULL,
  `remaining_allotment_project_expense_today` decimal(20,2) DEFAULT NULL,
  `current_year_paid_bill` double DEFAULT '0',
  `current_year_bill_paid_progress_report` double(20,2) DEFAULT '0.00',
  `remaining_cy_allotment_cy_paid_bill_today` double DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_construction_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitoring_officer_id` int(11) NOT NULL,
  `financial_code` varchar(191) NOT NULL,
  `project_category` varchar(191) DEFAULT 'any',
  `financial_year_id` int(11) NOT NULL,
  `transaction_type` varchar(191) NOT NULL,
  `transaction_date` date NOT NULL,
  `amount` double(20,2) NOT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `is_editable` int(11) NOT NULL DEFAULT '1',
  `consent_no` int(11) NOT NULL,
  `comment` text,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_construction_info` (
  `construction_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `has_child` int(11) DEFAULT '0',
  `related_projects` text,
  `resident_type` int(11) NOT NULL DEFAULT '4111201',
  `building_wall` varchar(10) NOT NULL,
  `phq_officer_id` int(11) NOT NULL DEFAULT '0',
  `project_start_fiscal_year` varchar(10) DEFAULT NULL,
  `project_close_fiscal_year` varchar(10) DEFAULT NULL,
  `project_close_date` date DEFAULT NULL,
  `target_close_date` date DEFAULT NULL,
  `closing_comment` text,
  `project_duration` int(11) NOT NULL DEFAULT '0',
  `construction_project_type` int(11) DEFAULT NULL,
  `building_unit_id` int(11) DEFAULT NULL,
  `construction_id` varchar(100) NOT NULL,
  `project_title` text,
  `tender_type` int(11) DEFAULT NULL,
  `tenderer_person` int(11) DEFAULT NULL,
  `enlistment_date` date DEFAULT NULL,
  `enlistment_amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `administrative_approval_date` date DEFAULT NULL,
  `administrative_approved_amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `revised_ao_date` date DEFAULT NULL,
  `revised_ao_amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `tender_opening_date` date DEFAULT NULL,
  `tec_by_unit_date` date DEFAULT NULL,
  `tec_approval_pwd_date` date DEFAULT NULL,
  `estimated_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tec_approval_phq_date` date DEFAULT NULL,
  `tec_amount` decimal(20,3) NOT NULL DEFAULT '0.000',
  `ao_letter_memo` int(11) DEFAULT NULL,
  `rao_letter_memo` int(11) DEFAULT NULL,
  `tec_letter_memo` int(11) DEFAULT NULL,
  `tender_invitation_date` date DEFAULT NULL,
  `tender_id_no` varchar(255) DEFAULT NULL,
  `variation_amount` double NOT NULL DEFAULT '0',
  `variation_amount_pwd` double DEFAULT '0',
  `temp_variation_amount_pwd` double(20,2) DEFAULT NULL,
  `need_variation_pwd` int(11) DEFAULT '0',
  `variation_amount_2` double DEFAULT '0',
  `variation_amount_2_pwd` double DEFAULT '0',
  `temp_variation_amount_2_pwd` double(20,2) DEFAULT NULL,
  `need_variation_2_pwd` int(11) DEFAULT '0',
  `variation_amount_3` double DEFAULT '0',
  `variation_amount_3_pwd` double DEFAULT '0',
  `temp_variation_amount_3_pwd` double(20,2) DEFAULT NULL,
  `need_variation_3_pwd` int(11) DEFAULT '0',
  `allowed_variation_3` int(11) NOT NULL DEFAULT '0',
  `work_order_date` date DEFAULT NULL,
  `work_starting_date` date DEFAULT NULL,
  `work_duration_month` int(11) DEFAULT NULL,
  `work_speed_status` int(11) NOT NULL DEFAULT '1729',
  `projected_completion_date` date DEFAULT NULL,
  `actual_completion_date` date DEFAULT NULL,
  `revised_approved_amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `revised_approved_amount_pwd` double DEFAULT NULL,
  `temp_revised_approved_amount_pwd` double(20,2) DEFAULT NULL,
  `revised_approved_amount_date` date DEFAULT NULL,
  `revised_approved_amount_date_pwd` date DEFAULT NULL,
  `temp_revised_approved_amount_date_pwd` date DEFAULT NULL,
  `revised_approved_amount_2` decimal(20,2) DEFAULT NULL,
  `revised_approved_amount_2_pwd` double DEFAULT NULL,
  `temp_revised_approved_amount_2_pwd` double(20,2) DEFAULT NULL,
  `revised_approved_amount_date_2` date DEFAULT NULL,
  `revised_approved_amount_date_2_pwd` date DEFAULT NULL,
  `temp_revised_approved_amount_date_2_pwd` date DEFAULT NULL,
  `revised_approved_amount_3` double DEFAULT '0',
  `revised_approved_amount_3_pwd` double DEFAULT '0',
  `temp_revised_approved_amount_3_pwd` double(20,2) DEFAULT NULL,
  `revised_approved_amount_date_3` date DEFAULT NULL,
  `revised_approved_amount_date_3_pwd` date DEFAULT NULL,
  `temp_revised_approved_amount_date_3_pwd` date DEFAULT NULL,
  `is_pwd_send_variation_proposal` int(11) DEFAULT NULL,
  `is_pwd_send_variation_proposal_2` int(11) DEFAULT NULL,
  `is_pwd_send_variation_proposal_3` int(11) DEFAULT NULL,
  `possible_date_for_pwd_to_send_variation_proposal` date DEFAULT NULL,
  `possible_date_for_pwd_to_send_variation_proposal_2` date DEFAULT NULL,
  `possible_date_for_pwd_to_send_variation_proposal_3` date DEFAULT NULL,
  `proposed_revised_amount_after_tec` double DEFAULT NULL,
  `proposed_revised_amount_after_tec_2` double DEFAULT NULL,
  `proposed_revised_amount_after_tec_3` double DEFAULT NULL,
  `proposed_variation_amount_after_tec` double DEFAULT NULL,
  `proposed_variation_amount_after_tec_2` double DEFAULT NULL,
  `proposed_variation_amount_after_tec_3` double DEFAULT NULL,
  `proposed_variation_date_after_tec` date DEFAULT NULL,
  `proposed_variation_date_after_tec_2` date DEFAULT NULL,
  `proposed_variation_date_after_tec_3` date DEFAULT NULL,
  `variation_proposal_letter` text,
  `variation_proposal_letter_2` text,
  `variation_proposal_letter_3` text,
  `cause_of_variation` text,
  `cause_of_variation_2` text,
  `cause_of_variation_3` text,
  `pwd_variation_approval_letter` text,
  `pwd_variation_approval_letter_2` text,
  `pwd_variation_approval_letter_3` text,
  `save_amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `project_closing_amount` double(20,2) DEFAULT '0.00',
  `contractor_name` varchar(200) NOT NULL,
  `contractor_address` text NOT NULL,
  `comments_on_contractor` text NOT NULL,
  `construction_details` text NOT NULL,
  `no_of_tender_sold` int(11) DEFAULT NULL,
  `no_of_tender_received` int(11) DEFAULT NULL,
  `no_of_responsive_tender` int(11) DEFAULT NULL,
  `tender_expiry_date` date DEFAULT NULL,
  `is_ms_report_2` tinyint(1) NOT NULL DEFAULT '0',
  `is_ms_report` tinyint(1) NOT NULL DEFAULT '0',
  `is_ms_report_2_2425` tinyint(4) DEFAULT '0',
  `is_ms_report_2425` tinyint(4) DEFAULT '0',
  `temp_physical_progress` double(20,2) DEFAULT NULL,
  `physical_status_percent` varchar(10) NOT NULL,
  `pre_physical_status_percent` double(20,2) DEFAULT NULL,
  `financial_status_percent` varchar(10) NOT NULL,
  `total_bill_paid` decimal(20,2) NOT NULL,
  `project_status` int(11) DEFAULT NULL,
  `construction_type_bangla` text,
  `construction_floor_bangla` text,
  `is_active` int(11) DEFAULT '0',
  `geo_district` int(11) DEFAULT NULL,
  `progress_report_date` date DEFAULT NULL,
  `reporting_closed` int(11) DEFAULT '0',
  `extra_requirement_current_year` decimal(20,2) NOT NULL,
  `file_no` varchar(100) NOT NULL,
  `noa_file` text,
  `wo_letter` text,
  `proposed_current_year_allotment` decimal(20,2) DEFAULT NULL,
  `project_expense` decimal(20,3) NOT NULL,
  `project_remaining_upto_date` decimal(20,2) DEFAULT NULL,
  `building_info_id` int(11) DEFAULT NULL,
  `ministry_head_id` int(11) DEFAULT NULL,
  `building_unit_district` int(11) DEFAULT NULL,
  `custom_unit_district` int(11) DEFAULT NULL,
  `construction_allot_year1` decimal(20,2) NOT NULL,
  `construction_allot_year2` decimal(20,2) NOT NULL,
  `construction_allot_year3` decimal(20,2) NOT NULL,
  `construction_allot_year4` decimal(20,2) NOT NULL,
  `allot_percent1` varchar(11) DEFAULT NULL,
  `allot_percent2` varchar(11) DEFAULT NULL,
  `allot_percent3` varchar(11) DEFAULT NULL,
  `allot_percent4` varchar(11) DEFAULT NULL,
  `construction_project_comments` longtext NOT NULL,
  `image` longtext,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`construction_info_id`),
  KEY `construction_project_type` (`construction_project_type`,`building_unit_id`,`tender_type`,`tenderer_person`,`project_status`,`building_info_id`,`building_unit_district`,`custom_unit_district`),
  KEY `construction_info_id` (`construction_info_id`),
  KEY `custom_unit_district` (`custom_unit_district`),
  KEY `project_start_fiscal_year` (`project_start_fiscal_year`)
) ENGINE=InnoDB AUTO_INCREMENT=11032 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_construction_installment` (
  `construction_installment_id` int(11) NOT NULL AUTO_INCREMENT,
  `construction_info_id` int(11) NOT NULL,
  `building_info_id` int(11) NOT NULL,
  `construction_installment_fiscal_year` int(11) DEFAULT NULL,
  `construction_installment_1` double DEFAULT '0',
  `construction_installment_2` double DEFAULT '0',
  `construction_installment_3` double DEFAULT '0',
  `construction_installment_4` double DEFAULT '0',
  `construction_installment_5` double NOT NULL DEFAULT '0',
  `surrender_withdraw_1` double DEFAULT '0',
  `surrender_withdraw_2` double DEFAULT '0',
  `surrender_withdraw_3` double DEFAULT '0',
  `surrender_withdraw_4` double DEFAULT '0',
  `construction_installment_1_final` double DEFAULT '0',
  `construction_installment_2_final` double DEFAULT '0',
  `construction_installment_3_final` double DEFAULT '0',
  `construction_installment_4_final` double DEFAULT '0',
  `construction_installment_5_final` double DEFAULT '0',
  `surrender_withdraw_1_final` double DEFAULT '0',
  `surrender_withdraw_2_final` double DEFAULT '0',
  `surrender_withdraw_3_final` double DEFAULT '0',
  `surrender_withdraw_4_final` double DEFAULT '0',
  `next_year_allotment` double NOT NULL,
  `construction_installment_date_1` date DEFAULT NULL,
  `construction_installment_date_2` date DEFAULT NULL,
  `construction_installment_date_3` date DEFAULT NULL,
  `construction_installment_date_4` date DEFAULT NULL,
  `construction_installment_date_5` date DEFAULT NULL,
  `surrender_withdraw_date_1` date DEFAULT NULL,
  `surrender_withdraw_date_2` date DEFAULT NULL,
  `surrender_withdraw_date_3` date DEFAULT NULL,
  `surrender_withdraw_date_4` date DEFAULT NULL,
  `construction_installment_date_1_final` date DEFAULT NULL,
  `construction_installment_date_2_final` date DEFAULT NULL,
  `construction_installment_date_3_final` date DEFAULT NULL,
  `construction_installment_date_4_final` date DEFAULT NULL,
  `construction_installment_date_5_final` date DEFAULT NULL,
  `surrender_withdraw_date_1_final` date DEFAULT NULL,
  `surrender_withdraw_date_2_final` date DEFAULT NULL,
  `surrender_withdraw_date_3_final` date DEFAULT NULL,
  `surrender_withdraw_date_4_final` date DEFAULT NULL,
  `construction_installment_ibass_1` int(11) DEFAULT '0',
  `construction_installment_ibass_2` int(11) DEFAULT '0',
  `construction_installment_ibass_3` int(11) DEFAULT '0',
  `construction_installment_ibass_4` int(11) DEFAULT '0',
  `construction_installment_ibass_5` int(11) DEFAULT '0',
  `construction_installment_ibass_date_1` date DEFAULT NULL,
  `construction_installment_ibass_date_2` date DEFAULT NULL,
  `construction_installment_ibass_date_3` date DEFAULT NULL,
  `construction_installment_ibass_date_4` date DEFAULT NULL,
  `construction_installment_ibass_date_5` date DEFAULT NULL,
  `approved_by` int(11) NOT NULL,
  `ibass_allotment_current` double(20,2) DEFAULT NULL,
  `ibass_upload_date_current` datetime DEFAULT NULL,
  `ibass_allotment_past` double(20,2) DEFAULT NULL,
  `ibass_upload_date_past` datetime DEFAULT NULL,
  `sarok_no` varchar(256) NOT NULL,
  `sarok_date` date DEFAULT NULL,
  `current_year_bill_paid_progress_report` double(20,2) DEFAULT '0.00',
  `cumulative_sum` double NOT NULL,
  `added_by_tender_type` varchar(256) NOT NULL,
  `phq_no_request` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`construction_installment_id`),
  KEY `construction_info_id` (`construction_info_id`,`building_info_id`,`construction_installment_fiscal_year`)
) ENGINE=InnoDB AUTO_INCREMENT=11824 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_construction_installment_temp` (
  `construction_installment_id` int(11) NOT NULL AUTO_INCREMENT,
  `construction_info_id` int(11) NOT NULL,
  `building_info_id` int(11) NOT NULL,
  `construction_installment_fiscal_year` int(11) NOT NULL,
  `construction_installment_1` double NOT NULL,
  `construction_installment_2` double NOT NULL,
  `construction_installment_3` double NOT NULL,
  `construction_installment_4` double NOT NULL,
  `construction_installment_5` double NOT NULL,
  `surrender_withdraw_1` double NOT NULL,
  `surrender_withdraw_2` double NOT NULL,
  `surrender_withdraw_3` double DEFAULT NULL,
  `surrender_withdraw_4` double DEFAULT NULL,
  `next_year_allotment` double NOT NULL,
  `construction_installment_date_1` date DEFAULT NULL,
  `construction_installment_date_2` date DEFAULT NULL,
  `construction_installment_date_3` date DEFAULT NULL,
  `construction_installment_date_4` date DEFAULT NULL,
  `construction_installment_date_5` date DEFAULT NULL,
  `surrender_withdraw_date_1` date DEFAULT NULL,
  `surrender_withdraw_date_2` date DEFAULT NULL,
  `surrender_withdraw_date_3` date DEFAULT NULL,
  `surrender_withdraw_date_4` date DEFAULT NULL,
  `cumulative_sum` double NOT NULL,
  PRIMARY KEY (`construction_installment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_construction_project_status_change_log` (
  `project_id` int(11) NOT NULL,
  `changed_status_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_construction_reserve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitoring_officer_id` int(11) NOT NULL,
  `financial_code` varchar(191) NOT NULL,
  `project_category` varchar(191) DEFAULT 'any',
  `financial_year_id` int(11) NOT NULL,
  `transaction_type` varchar(191) NOT NULL,
  `transaction_date` date NOT NULL,
  `amount` double(20,2) NOT NULL,
  `distribution_id` int(11) DEFAULT NULL,
  `is_editable` int(11) NOT NULL DEFAULT '1',
  `consent_no` int(11) NOT NULL,
  `comment` text,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_copy_to` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `copy_to` text CHARACTER SET utf8 NOT NULL,
  `user_mobile` varchar(20) CHARACTER SET utf8 NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `building_unit_id` int(5) NOT NULL,
  `user_profile` int(5) NOT NULL,
  `email_status` int(2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=677 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_custom_unit` (
  `custom_unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_unit_parent` int(11) NOT NULL,
  `custom_unit_title` varchar(255) NOT NULL,
  `custom_unit_type` int(11) NOT NULL,
  `sort_by` int(11) NOT NULL,
  `unit_name_for_matching` varchar(256) NOT NULL,
  PRIMARY KEY (`custom_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_date_bangla` (
  `date_bangla_id` int(11) NOT NULL AUTO_INCREMENT,
  `one` varchar(110) NOT NULL,
  `two` varchar(110) NOT NULL,
  `three` varchar(110) NOT NULL,
  `four` varchar(110) NOT NULL,
  `five` varchar(110) NOT NULL,
  `six` varchar(110) NOT NULL,
  `seven` varchar(110) NOT NULL,
  `eight` varchar(110) NOT NULL,
  `nine` varchar(110) NOT NULL,
  `zero` varchar(110) NOT NULL,
  `january` varchar(110) NOT NULL,
  `february` varchar(110) NOT NULL,
  `march` varchar(110) NOT NULL,
  `april` varchar(110) NOT NULL,
  `may` varchar(110) NOT NULL,
  `june` varchar(110) NOT NULL,
  `july` varchar(110) NOT NULL,
  `august` varchar(110) NOT NULL,
  `september` varchar(110) NOT NULL,
  `october` varchar(110) NOT NULL,
  `november` varchar(110) NOT NULL,
  `december` varchar(110) NOT NULL,
  PRIMARY KEY (`date_bangla_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_dept_budget_request` (
  `dept_budget_request_id` int(11) NOT NULL AUTO_INCREMENT,
  `construction_info_id` int(11) NOT NULL,
  `construction_installment_fiscal_year` int(11) DEFAULT NULL,
  `request_type` int(11) NOT NULL,
  `request_date` date DEFAULT NULL,
  `demand_amount` decimal(20,2) NOT NULL,
  `given_amount` decimal(20,2) NOT NULL,
  `phq_amount` decimal(20,2) NOT NULL,
  `approved_date` date DEFAULT NULL,
  `construction_installment_id` int(11) NOT NULL,
  `dept_budget_comment` text NOT NULL,
  `building_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dept_budget_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3563 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_dept_progress_report_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `row_type` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `row_sl` int(11) NOT NULL DEFAULT '0',
  `has_break` int(11) NOT NULL DEFAULT '0',
  `col_no` text,
  `col_name` longtext,
  `col_ao` text,
  `col_project_duration_from` varchar(100) DEFAULT NULL,
  `col_project_duration_to` varchar(100) DEFAULT NULL,
  `col_pre_allotment` varchar(200) DEFAULT NULL,
  `col_pre_expense` varchar(200) DEFAULT NULL,
  `col_pre_progress` varchar(200) DEFAULT NULL,
  `col_adp_allotment` varchar(200) DEFAULT NULL,
  `col_post_allotment` varchar(200) DEFAULT NULL,
  `col_post_expense` varchar(200) DEFAULT NULL,
  `col_post_progress` varchar(200) DEFAULT NULL,
  `col_total_allotment` varchar(200) DEFAULT NULL,
  `col_total_expense` varchar(200) DEFAULT NULL,
  `col_total_progress` varchar(200) DEFAULT NULL,
  `col_project_closing_date` varchar(200) DEFAULT NULL,
  `col_comment` longtext,
  `col_quote_amount` varchar(100) DEFAULT NULL,
  `col_project_duration` int(11) DEFAULT NULL,
  `no_work_order_date` int(11) DEFAULT '0',
  `is_project_finished` int(11) DEFAULT '-1',
  `is_payment_complete` int(11) DEFAULT '-1',
  `is_in_use` int(11) DEFAULT '-1',
  `col_contractor_name` text,
  `col_contractor_address` text,
  `col_contractor_comment` text,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7450 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_dept_progress_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `ministry` varchar(200) NOT NULL,
  `report_month` varchar(50) NOT NULL,
  `report_year` varchar(50) NOT NULL,
  `report_sl` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `signature` text,
  `building_boundary_id` int(11) DEFAULT NULL,
  `building_boundary_type` varchar(5) DEFAULT NULL,
  `tenderer_person_id` int(11) NOT NULL,
  `project_last_month` varchar(50) NOT NULL,
  `project_last_year` varchar(50) NOT NULL,
  `project_fiscal_year` varchar(100) NOT NULL,
  `police_unit` varchar(200) NOT NULL,
  `published_at` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2163 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_detailed_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_entry_id` bigint(15) DEFAULT NULL,
  `related_entry_type` varchar(256) DEFAULT NULL,
  `activity_by` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `updated_fields` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55914 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_district` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(100) NOT NULL,
  `district_status` int(1) NOT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_electric_meters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meter_no` varchar(255) NOT NULL,
  `range_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `building_ids` text,
  `flat_id` int(11) DEFAULT NULL,
  `meter_installation_date` date DEFAULT NULL,
  `meter_status` varchar(50) NOT NULL DEFAULT 'active',
  `meter_type` enum('Post','Pre') NOT NULL,
  `meter_owner` varchar(191) NOT NULL DEFAULT 'Govt',
  `account_no` varchar(255) DEFAULT NULL,
  `meter_used_for` text,
  `meter_unused_for` text,
  `financial_code` varchar(191) DEFAULT NULL,
  `customer_no` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4950 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_electricity_bill_allotment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `fiscal_year` int(11) NOT NULL,
  `transaction_type` varchar(191) NOT NULL COMMENT 'demand/allotment/surrender',
  `transaction_amount` double DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_code` varchar(191) DEFAULT NULL,
  `transaction_reference` text,
  `description` text,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_electricity_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `building_ids` text,
  `electricity_unit` varchar(50) NOT NULL,
  `electricity_sub_unit` int(11) DEFAULT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `meter_id` int(11) NOT NULL,
  `bill_payment_type` varchar(50) DEFAULT NULL,
  `bill_month` varchar(20) NOT NULL,
  `bill_year` int(11) NOT NULL,
  `bill_year_month` int(11) NOT NULL,
  `fiscal_year` int(11) DEFAULT NULL,
  `previous_reading` double NOT NULL,
  `current_reading` double NOT NULL,
  `used_electricity_unit` double NOT NULL,
  `bill_per_unit` double DEFAULT NULL,
  `total_bill` double NOT NULL DEFAULT '0',
  `total_paid` double(20,2) DEFAULT '0.00',
  `bill_waiver` double(20,2) DEFAULT '0.00',
  `bill_current_month` double(20,2) DEFAULT '0.00',
  `owing_last_month` double(20,2) DEFAULT '0.00',
  `manpower` int(11) DEFAULT '0',
  `used_unit_per_person` double(20,2) DEFAULT NULL,
  `bill_per_person` double(20,2) DEFAULT '0.00',
  `bill_no` varchar(255) DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `bill_receive_memo_no` varchar(255) DEFAULT NULL,
  `bill_receive_memo_date` date DEFAULT NULL,
  `approved_bill_payment_memo_no` varchar(255) DEFAULT NULL,
  `approved_bill_payment_memo_date` date DEFAULT NULL,
  `bill_payment_cheque_or_memo_no` varchar(255) DEFAULT NULL,
  `bill_payment_cheque_or_memo_date` date DEFAULT NULL,
  `payment_status` varchar(50) NOT NULL DEFAULT 'unpaid',
  `last_payment_date` date DEFAULT NULL,
  `allowed_load` double(20,2) DEFAULT NULL,
  `used_load` double(20,2) DEFAULT NULL,
  `due_amount` double(20,2) DEFAULT NULL,
  `present_reading_date` date DEFAULT NULL,
  `past_reading_date` date DEFAULT NULL,
  `present_reading_main_meter_pick` double(20,2) DEFAULT NULL,
  `past_reading_main_meter_pick` double(20,2) DEFAULT NULL,
  `used_unit_main_meter_pick` double(20,2) DEFAULT NULL,
  `present_reading_kvr_meter_off_pick` double(20,2) DEFAULT NULL,
  `past_reading_kvr_meter_off_pick` double(20,2) DEFAULT NULL,
  `used_unit_kvr_meter_off_pick` double(20,2) DEFAULT NULL,
  `present_reading_kvr_meter_pick` double(20,2) DEFAULT NULL,
  `past_reading_kvr_meter_pick` double(20,2) DEFAULT NULL,
  `used_unit_kvr_meter_pick` double(20,2) DEFAULT NULL,
  `present_reading_demand_meter` double(20,2) DEFAULT NULL,
  `past_reading_demand_meter` double(20,2) DEFAULT NULL,
  `used_unit_demand_meter` double(20,2) DEFAULT NULL,
  `off_pick_electricity_charge` double(20,2) DEFAULT NULL,
  `pick_electricity_charge` double(20,2) DEFAULT NULL,
  `demand_charge` double(20,2) DEFAULT NULL,
  `principal_amount` double(20,2) DEFAULT NULL,
  `vat_amount` double(20,2) DEFAULT NULL,
  `vat_percent` double(20,2) DEFAULT NULL,
  `have_to_pay_after_last_payment_date` double(20,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` double(20,2) DEFAULT NULL,
  `c_regi_electricity_charge` double(20,2) DEFAULT NULL,
  `principal_combination` double(20,2) DEFAULT NULL,
  `lps_combination` double(20,2) DEFAULT NULL,
  `vat_combination` double(20,2) DEFAULT NULL,
  `transformer_loss` double(20,2) DEFAULT NULL,
  `transformer_rent` double(20,2) DEFAULT NULL,
  `advance_due_principal` double(20,2) DEFAULT NULL,
  `pfc_charge` double(20,2) DEFAULT NULL,
  `current_due_lps` double(20,2) DEFAULT NULL,
  `meter_rent` double(20,2) DEFAULT NULL,
  `advance_due_vat` double(20,2) DEFAULT NULL,
  `in_total_vat_amount` double(20,2) DEFAULT NULL,
  `bill_current_month_after_last_payment_date` double(20,2) DEFAULT NULL,
  `current_month_due` double(20,2) DEFAULT NULL,
  `comment` text,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21386 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_estate_officer` (
  `estate_officer_id` int(11) NOT NULL AUTO_INCREMENT,
  `estate_officer_name` varchar(200) NOT NULL,
  `estate_officer_bpno` varchar(100) NOT NULL,
  `estate_officer_rank` varchar(100) NOT NULL,
  `estate_officer_designation` varchar(100) NOT NULL,
  `estate_officer_obtain_training` varchar(256) NOT NULL,
  `district_name` int(11) NOT NULL,
  `estate_officer_start_date` date DEFAULT NULL,
  `estate_officer_end_date` date DEFAULT NULL,
  `estate_officer_phone` varchar(30) NOT NULL,
  `estate_officer_email` varchar(100) NOT NULL,
  `estate_officer_contact_info` varchar(255) NOT NULL,
  `estate_officer_status` int(11) DEFAULT NULL,
  `building_unit_id` int(11) NOT NULL,
  PRIMARY KEY (`estate_officer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=983 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_fire_drill` (
  `fire_drill_id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(6) NOT NULL,
  `district_id` int(6) NOT NULL,
  `unit_id` int(6) NOT NULL,
  `building_id_from_info_table` varchar(50) CHARACTER SET utf8 NOT NULL,
  `building_info_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `drill_place` varchar(50) CHARACTER SET utf8 NOT NULL,
  `participating_police_personnel` int(4) NOT NULL,
  `have_expired_extinguisher_list` enum('Yes','No') NOT NULL,
  `electrical_audit` enum('Yes','No') NOT NULL,
  `measures_for_places_without_24hr_watchmen` longtext CHARACTER SET utf8 NOT NULL,
  `comment_from_fire_service_official` longtext CHARACTER SET utf8 NOT NULL,
  `comment_from_unit_head` longtext CHARACTER SET utf8 NOT NULL,
  `created_by` int(4) NOT NULL,
  `updated_by` int(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`fire_drill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_fire_drill_image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `fire_drill_id` int(11) NOT NULL,
  `drill_image` text,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_fire_extinguisher_demand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) NOT NULL,
  `fiscal_year` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_fire_extinguisher_demand_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `demand_id` int(11) NOT NULL,
  `extinguisher_type` int(11) NOT NULL,
  `weight` double(10,2) NOT NULL,
  `quantity` double(10,2) NOT NULL,
  `requirement` double(10,2) NOT NULL,
  `requirement_as_per_fire_service` double(10,2) NOT NULL,
  `demand` double(10,2) NOT NULL,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_fire_extinguisher_items` (
  `fire_extinguisher_items_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `order_no` int(11) NOT NULL,
  PRIMARY KEY (`fire_extinguisher_items_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_fire_extinguisher_stock` (
  `fire_extinguisher_stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `item` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_type` varchar(50) NOT NULL,
  `unit_price` double(10,2) NOT NULL,
  `total_price` double(10,2) NOT NULL,
  `expiration_date` date NOT NULL,
  `short_note` varchar(256) CHARACTER SET utf8 NOT NULL,
  `supplied_to` int(11) NOT NULL,
  `supply_id` int(11) NOT NULL,
  PRIMARY KEY (`fire_extinguisher_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_fire_extinguisher_supplies` (
  `extinguisher_supplies_id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(6) NOT NULL,
  `district_id` int(6) NOT NULL,
  `unit_id` int(6) NOT NULL,
  `building_id_from_info_table` varchar(50) CHARACTER SET utf8 NOT NULL,
  `building_info_id` int(6) NOT NULL,
  `fiscal_year` varchar(100) CHARACTER SET utf8 NOT NULL,
  `receiving_date` date NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `short_note` varchar(256) CHARACTER SET utf8 NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`extinguisher_supplies_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_functionalities_guide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` int(11) NOT NULL DEFAULT '0',
  `parent_heading` int(11) NOT NULL,
  `heading` varchar(256) CHARACTER SET utf8 NOT NULL,
  `description` longtext CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=big5 COLLATE=big5_bin;

CREATE TABLE `tbl_gas_bill_allotment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `fiscal_year` int(11) NOT NULL,
  `transaction_type` varchar(191) NOT NULL COMMENT 'demand/allotment/surrender',
  `transaction_amount` double DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_code` varchar(191) DEFAULT NULL,
  `transaction_reference` text,
  `description` text,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_gas_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `gas_unit` varchar(50) NOT NULL,
  `gas_sub_unit` int(11) DEFAULT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `meter_id` int(11) NOT NULL,
  `bill_payment_type` varchar(50) DEFAULT NULL,
  `bill_month` varchar(20) NOT NULL,
  `bill_year` int(11) NOT NULL,
  `bill_year_month` int(11) NOT NULL,
  `fiscal_year` int(11) DEFAULT NULL,
  `previous_reading` double NOT NULL,
  `current_reading` double NOT NULL,
  `used_gas_unit` double NOT NULL,
  `bill_per_unit` double NOT NULL,
  `total_bill` double NOT NULL,
  `approved_amount` double DEFAULT NULL,
  `due_amount` double DEFAULT NULL,
  `bill_no` varchar(255) DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `bill_receive_memo_no` varchar(255) DEFAULT NULL,
  `bill_receive_memo_date` date DEFAULT NULL,
  `approved_bill_send_memo_no` varchar(255) DEFAULT NULL,
  `approved_bill_send_memo_date` date DEFAULT NULL,
  `approved_bill_payment_memo_no` varchar(255) DEFAULT NULL,
  `approved_bill_payment_memo_date` date DEFAULT NULL,
  `bill_payment_cheque_or_memo_no` varchar(255) DEFAULT NULL,
  `bill_payment_cheque_or_memo_date` date DEFAULT NULL,
  `payment_status` varchar(50) NOT NULL DEFAULT 'unpaid',
  `comment` text,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_gas_meters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meter_no` varchar(255) NOT NULL,
  `range_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `meter_installation_date` date DEFAULT NULL,
  `meter_status` varchar(50) NOT NULL DEFAULT 'active',
  `meter_type` enum('Post','Pre') NOT NULL,
  `account_no` varchar(255) NOT NULL,
  `financial_code` varchar(191) DEFAULT NULL,
  `customer_no` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `group_status` int(1) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_group_page` (
  `group_page_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `group_page_permission` varchar(11) NOT NULL,
  PRIMARY KEY (`group_page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_ha_allotment_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `flat_no` varchar(100) NOT NULL,
  `flat_id` int(11) NOT NULL,
  `bp_or_civ` bigint(15) NOT NULL,
  `effective_from` date NOT NULL,
  `remarks` varchar(256) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `event_type` enum('Allotment','Cancel','Occupying','Changing Allotment Authority') CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9441 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_ha_applicant_updated_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `section_name` varchar(256) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `in_47_file` varchar(256) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `out_47_file` varchar(256) DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_application_chosen_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `area` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5276 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_application_chosen_buildings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `building` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3030 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_application_noc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `ending_date` date DEFAULT NULL,
  `file` varchar(256) DEFAULT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_of_submission` date DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `name_bn` varchar(256) CHARACTER SET utf8 NOT NULL,
  `bp_or_civ` bigint(15) DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `section_name` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `unit_permanent` enum('Yes','No') DEFAULT NULL,
  `rank` varchar(100) CHARACTER SET utf8 NOT NULL,
  `joining_date` date DEFAULT NULL,
  `pay_scale` varchar(50) CHARACTER SET utf8 NOT NULL,
  `in_phq` enum('Yes','No') NOT NULL,
  `permanent` enum('Yes','No') DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `home_district` varchar(100) CHARACTER SET utf8 NOT NULL,
  `f_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `m_name` varchar(100) NOT NULL,
  `marital_status` enum('Single','Married','Divorced','Widowed') NOT NULL,
  `spouse_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `profession_of_father_or_spouse` varchar(100) CHARACTER SET utf8 NOT NULL,
  `father_or_spouse_work_location` varchar(75) CHARACTER SET utf8 NOT NULL,
  `father_or_spouse_govt_or_private_employee` enum('Yes','No') NOT NULL,
  `father_or_spouse_monthly_salary` int(11) NOT NULL,
  `date_of_joining_at_dhaka` date DEFAULT NULL,
  `previous_allotment_count` int(11) DEFAULT NULL,
  `previous_allotment_details` longtext NOT NULL,
  `desired_allotment_location` text,
  `family_member_have_allocation_from_police` enum('Yes','No') DEFAULT NULL,
  `previously_received_allocation_at_dhaka` enum('Yes','No') NOT NULL,
  `type_of_allocation` enum('Police','DOGA') DEFAULT NULL,
  `previous_allocation_starting_date` date DEFAULT NULL,
  `previous_allocation_ending_date` date DEFAULT NULL,
  `departmental_action` enum('Yes','No') DEFAULT NULL,
  `departmental_action_details` text DEFAULT NULL,
  `received_allocation_at_previous_job_location` enum('Yes','No') DEFAULT NULL,
  `allocation_details_at_previous_job_location` text DEFAULT NULL,
  `allocation_starting_date_at_previous_job_location` date DEFAULT NULL,
  `allocation_ending_date_at_previous_job_location` date DEFAULT NULL,
  `received_allocation_at_present_job_location` enum('Yes','No') NOT NULL,
  `allocation_details_at_present_job_location` text DEFAULT NULL,
  `allocation_starting_date_at_present_job_location` date DEFAULT NULL,
  `allocation_ending_date_at_present_job_location` date DEFAULT NULL,
  `self_accommodation` enum('Self','Govt') NOT NULL,
  `self_or_govt_accommodation_details` text NOT NULL,
  `applicant_or_family_members_have_house_at_cities` enum('Yes','No') NOT NULL,
  `applicant_or_family_members_house_completion_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` enum('Pending','Rejected','Alloted','Taken Back','Occupying') NOT NULL DEFAULT 'Pending',
  `event_id` int(11) NOT NULL,
  `flat_id` int(11) NOT NULL,
  `application_receiving_authority` int(11) NOT NULL,
  `retirement_date` date NOT NULL,
  `apply_serial` int(11) NOT NULL,
  `employee_type` int(11) NOT NULL,
  `brush_no` int(11) NOT NULL,
  `working_unit` varchar(150) NOT NULL,
  `working_section` varchar(150) NOT NULL,
  `house_type` int(11) NOT NULL,
  `phq_join_date` date DEFAULT NULL,
  `early_allot_date` date DEFAULT NULL,
  `current_allot_date` date DEFAULT NULL,
  `count_year` varchar(50) NOT NULL,
  `remarks` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8104 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_basic_salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `current_posting_unit` int(11) DEFAULT NULL,
  `basic_salary` double(10,2) NOT NULL,
  `percentage_for_house_rent` double(10,2) DEFAULT NULL,
  `house_rent` double(10,2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2905 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_bill_and_rent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `basic_salary_id` int(11) DEFAULT NULL,
  `electricity_bill_arrear` double(10,2) DEFAULT NULL,
  `electricity_bill_paid_arrear` double(10,2) DEFAULT NULL,
  `electricity_bill_due` double(10,2) DEFAULT NULL,
  `electricity_bill_paid` double(10,2) DEFAULT NULL,
  `house_rent_due` double(10,2) DEFAULT NULL,
  `house_rent_paid` double(10,2) DEFAULT NULL,
  `gas` double(10,2) DEFAULT NULL,
  `municipality` double(10,2) DEFAULT NULL,
  `other` double(10,2) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_building_and_allotment_authority_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tbl_ha_buildings` int(11) NOT NULL,
  `id_tbl_ha_units` int(11) NOT NULL,
  `quota` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9168 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_building_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_id` int(11) NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_building_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `location` varchar(100) CHARACTER SET utf8 NOT NULL,
  `location_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_buildings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_info_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `building_id` varchar(255) DEFAULT NULL,
  `construction_year` int(5) DEFAULT NULL,
  `area` int(4) NOT NULL,
  `total_floor` int(11) DEFAULT NULL,
  `total_flat` int(11) DEFAULT NULL,
  `flat_type` varchar(100) DEFAULT NULL,
  `lift` enum('Yes','No') DEFAULT NULL,
  `generator` enum('Yes','No') DEFAULT NULL,
  `car_parking` enum('Yes','No') DEFAULT NULL,
  `address` text,
  `care_taker_info` text,
  `description` text,
  `image` text,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `show_or_hide` enum('Show','Hide') NOT NULL,
  `house_rent_zone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2535 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_ha_complaints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `complaint_title` varchar(256) CHARACTER SET utf8 NOT NULL,
  `action_after_complaint_details` text CHARACTER SET utf8 DEFAULT NULL,
  `proved` enum('Yes','No') NOT NULL,
  `action` enum('Warned','Allotment canceled') DEFAULT NULL,
  `cancellation_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_electricity_bill_and_rent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `electricity_bill` enum('Yes','No') DEFAULT NULL,
  `electricity_bill_ref` varchar(50) DEFAULT NULL,
  `house_rent` enum('Yes','No') DEFAULT NULL,
  `note` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_family_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `family_member_name` varchar(256) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `relation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11339 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_flat_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('Active','Inactive') NOT NULL,
  `rank` varchar(100) CHARACTER SET utf8 NOT NULL,
  `rank_order` int(11) NOT NULL,
  `type` enum('Civil','Const_to_SI','Other') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_flat_repair_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_id` int(11) NOT NULL,
  `flat_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `details` longtext NOT NULL,
  `cost` int(11) NOT NULL,
  `fiscal_year` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_flat_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `size` varchar(100) CHARACTER SET utf8 NOT NULL,
  `size_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_flats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_id` int(11) NOT NULL,
  `flat_no` varchar(255) DEFAULT NULL,
  `flat_type` varchar(100) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `drawing` enum('Yes','No') NOT NULL,
  `dining` enum('Yes','No') NOT NULL,
  `kitchen` enum('Yes','No') NOT NULL,
  `bedroom` int(3) NOT NULL,
  `washroom` int(3) NOT NULL,
  `balcony` int(3) NOT NULL,
  `floor` int(11) NOT NULL,
  `description` text,
  `flat_note` text,
  `allotment_authority` int(11) NOT NULL,
  `allocation_status` enum('Vacant','Allocated') NOT NULL,
  `event_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `show_or_hide` enum('Show','Hide') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3004 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_ha_letters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `bp_or_civ` bigint(15) NOT NULL,
  `letter_type` enum('Allotment','Cancel Allotment','Take Over','Handover') NOT NULL,
  `issuing_authority` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `flat_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `heading` longtext NOT NULL,
  `sutro` varchar(256) DEFAULT NULL,
  `sarok` text CHARACTER SET utf8 NOT NULL,
  `sarok_2` text CHARACTER SET utf8 DEFAULT NULL,
  `sarok_date` date DEFAULT NULL,
  `signed_by` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `subject` longtext NOT NULL,
  `body` longtext NOT NULL,
  `terms` longtext NOT NULL,
  `letter_to` longtext NOT NULL,
  `signature` longtext NOT NULL,
  `copy_to` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1027 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_noc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bp_or_civ` varchar(150) NOT NULL,
  `issuing_authority` int(11) NOT NULL,
  `heading` longtext CHARACTER SET utf8 NOT NULL,
  `sarok` text CHARACTER SET utf8 NOT NULL,
  `sarok_2` text CHARACTER SET utf8 DEFAULT NULL,
  `sarok_date` date DEFAULT NULL,
  `signed_by` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `subject` longtext CHARACTER SET utf8 NOT NULL,
  `body` longtext CHARACTER SET utf8 NOT NULL,
  `terms` longtext CHARACTER SET utf8 NOT NULL,
  `letter_to` longtext CHARACTER SET utf8 NOT NULL,
  `signature` longtext CHARACTER SET utf8 NOT NULL,
  `copy_to` longtext CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `allotment_sms` enum('Yes','No') NOT NULL,
  `cancellation_sms` enum('Yes','No') NOT NULL,
  `cost_per_sms` double NOT NULL,
  `vacancy_deadline` int(11) NOT NULL,
  `max_building_image` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_ha_sms_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_ha_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_id` int(11) DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `unit` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '25',
  `unit_bangla` varchar(256) NOT NULL,
  `unit_order` int(11) NOT NULL,
  `sms_signature` varchar(256) CHARACTER SET utf8 NOT NULL,
  `letter_heading` longtext NOT NULL,
  `letter_sarok` text CHARACTER SET utf8 NOT NULL,
  `letter_subject` longtext NOT NULL,
  `letter_body_1st_part` longtext NOT NULL,
  `letter_conditions` longtext NOT NULL,
  `letter_signature` longtext NOT NULL,
  `copy_to` longtext NOT NULL,
  `users` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_house_allotment` (
  `house_allotment_id` int(11) NOT NULL AUTO_INCREMENT,
  `residential_id` int(11) NOT NULL,
  `house_allotment_application_id` int(11) NOT NULL,
  `current_unit` varchar(100) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `allotment_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`house_allotment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_house_allotment_application` (
  `house_allotment_application_id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_serial` varchar(100) NOT NULL,
  `application_name` varchar(200) NOT NULL,
  `employee_type` int(11) DEFAULT NULL,
  `bpno` varchar(100) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `brush_no` varchar(100) NOT NULL,
  `working_unit` varchar(100) NOT NULL,
  `working_section` varchar(100) NOT NULL,
  `working_type` int(11) DEFAULT NULL,
  `salary_scale` float(20,2) NOT NULL,
  `house_type` int(11) DEFAULT NULL,
  `job_join_date` date DEFAULT NULL,
  `phq_join_date` date DEFAULT NULL,
  `early_allot_date` date DEFAULT NULL,
  `current_allot_date` date DEFAULT NULL,
  `count_year` varchar(20) NOT NULL,
  `remarks` text NOT NULL,
  `house_allotment_status` int(11) DEFAULT NULL,
  `time_of_previous_allotment` int(11) DEFAULT NULL,
  `apply_date` date DEFAULT NULL,
  PRIMARY KEY (`house_allotment_application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1223 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_house_flat_info` (
  `house_flat_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `residential_id` int(11) NOT NULL,
  `flat_no` varchar(100) NOT NULL,
  `floor` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`house_flat_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_house_flat_repair` (
  `house_flat_repair_id` int(11) NOT NULL AUTO_INCREMENT,
  `residential_id` int(11) DEFAULT NULL,
  `house_flat_info_id` int(11) DEFAULT NULL,
  `fiscal_year` int(11) DEFAULT NULL,
  `allot_amount` float(20,2) NOT NULL,
  `demand_amount` float(20,2) NOT NULL,
  `surrender_amount` float(20,2) NOT NULL,
  `flat_repair_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`house_flat_repair_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_ibass_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `installment_id` int(11) NOT NULL,
  `installment_type` int(11) NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `used_reserve` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_ibass_entry_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitoring_officer_id` int(11) NOT NULL,
  `financial_code` varchar(191) NOT NULL,
  `financial_year_id` int(11) NOT NULL,
  `transaction_type` varchar(191) NOT NULL,
  `transaction_date` date NOT NULL,
  `amount` double(20,2) NOT NULL,
  `comment` text,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_ibass_excel_detail_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fiscal_year` varchar(191) DEFAULT NULL,
  `fiscal_year_id` int(11) DEFAULT NULL,
  `unit_code_name` varchar(191) DEFAULT NULL,
  `unit_code` varchar(191) DEFAULT NULL,
  `letter_memo` varchar(191) DEFAULT NULL,
  `letter_memo_date` date DEFAULT NULL,
  `letter_type` int(11) DEFAULT NULL,
  `letter_sub_type` int(11) DEFAULT NULL,
  `resident_type` varchar(191) DEFAULT NULL,
  `amount` double(20,3) DEFAULT NULL,
  `total_letter_amount` double(20,3) DEFAULT NULL,
  `matching_status` int(11) DEFAULT NULL,
  `amount_difference` double(20,3) DEFAULT NULL,
  `related_project_ids` text,
  `amount_status` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17519 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_image_size` (
  `image_size_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_size_kb` int(11) NOT NULL,
  `image_total` int(11) NOT NULL,
  `need_budget_approval` int(11) NOT NULL,
  PRIMARY KEY (`image_size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_issue_info` (
  `issue_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_letter_type` int(11) DEFAULT NULL,
  `issue_subject` varchar(255) NOT NULL,
  `building_unit_id_issue` int(11) DEFAULT NULL,
  `building_unit_id_rcv` int(11) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `issue_memo` text NOT NULL,
  `issue_comments` text NOT NULL,
  `issue_attached` varchar(256) NOT NULL,
  PRIMARY KEY (`issue_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=787 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_land_acquisition` (
  `land_acquisition_id` int(11) NOT NULL AUTO_INCREMENT,
  `acquisition_serial_no` varchar(50) NOT NULL,
  `building_unit_id` int(11) NOT NULL,
  `acquisition_proposted_name` varchar(200) NOT NULL,
  `acquisition_area` varchar(200) NOT NULL,
  `acquisition_mem_no_from_ministry` varchar(100) NOT NULL,
  `acquisition_date_of_dispath` date DEFAULT NULL,
  `acquisition_admin_aprove_date` date DEFAULT NULL,
  `acquisition_clac_dlac` float NOT NULL,
  `acquisition_date_of_approve_fr_ministry` date DEFAULT NULL,
  `acquisition_com_artcle_3` int(11) DEFAULT NULL,
  `acquisition_com_artcle_4` int(11) DEFAULT NULL,
  `acquisition_com_artcle_6` int(11) DEFAULT NULL,
  `acquisition_com_artcle_7` int(11) DEFAULT NULL,
  `acquisition_amount_money_fr_dc` float(20,2) NOT NULL,
  `acquisition_date_by_dc` date DEFAULT NULL,
  `acquisition_estimat_date_by_unit` date DEFAULT NULL,
  `acquisition_date_approve_home_minstry` date DEFAULT NULL,
  `acquisition_date_money_submit` date DEFAULT NULL,
  `acquisition_doc_registry` int(11) NOT NULL,
  `acquisition_date_possession` date DEFAULT NULL,
  `acquisition_date_gazattee` date DEFAULT NULL,
  `acquisition_date_registration` date DEFAULT NULL,
  `acquisition_date_db_entry` date DEFAULT NULL,
  `acquisition_comments` blob NOT NULL,
  `acquisition_amount_money_fr_ministry` decimal(20,2) NOT NULL,
  PRIMARY KEY (`land_acquisition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_land_document` (
  `land_document_id` int(11) NOT NULL AUTO_INCREMENT,
  `land_record_info_id` int(11) NOT NULL,
  `land_document_type` int(11) NOT NULL,
  `land_document_title` varchar(256) NOT NULL,
  `land_document_description` mediumtext NOT NULL,
  `land_document_inclusion_date` date DEFAULT NULL,
  `land_document_status` int(11) NOT NULL,
  `land_document_file` varchar(256) NOT NULL,
  PRIMARY KEY (`land_document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5267 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_land_record_info` (
  `land_record_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_unit_id` int(11) NOT NULL DEFAULT '1',
  `land_id_for_title` int(11) NOT NULL,
  `land_title` varchar(256) NOT NULL,
  `land_use_type` int(11) DEFAULT NULL,
  `location_details` mediumtext NOT NULL,
  `land_record_info_ownership` int(11) DEFAULT NULL,
  `ownership_receive_date` date DEFAULT NULL,
  `ownership_receive_details` mediumtext NOT NULL,
  `ownership_establish_date` date DEFAULT NULL,
  `paid_amount` decimal(20,2) NOT NULL,
  `total_land_area` decimal(20,4) NOT NULL,
  `land_boundary_details` mediumtext NOT NULL,
  `land_surrounding_details` mediumtext NOT NULL,
  `lowerlevel_land_details` mediumtext NOT NULL,
  `boundary_wall_status` int(11) DEFAULT NULL,
  `boundary_wall_type` int(11) DEFAULT NULL,
  `ownership_non_establish_area` float NOT NULL,
  `ownership_non_establish_name` varchar(256) NOT NULL,
  `register_office_details` mediumtext NOT NULL,
  `mutation_status` int(11) DEFAULT NULL,
  `dcr_no` varchar(256) NOT NULL,
  `dcr_no_date` date DEFAULT NULL,
  `mutation_details` mediumtext NOT NULL,
  `name_jari_date` date DEFAULT NULL,
  `tafshil_office_details` mediumtext NOT NULL,
  `khajna_yearly_amount` decimal(20,2) NOT NULL,
  `khajna_paid_upto` int(4) NOT NULL,
  `mouja` varchar(256) NOT NULL,
  `jl_no` varchar(256) NOT NULL,
  `cs_khotian_no` varchar(256) NOT NULL,
  `cs_dag_no` varchar(256) NOT NULL,
  `cs_owner_name_details` mediumtext NOT NULL,
  `rs_khotian_no` text NOT NULL,
  `rs_dag_no` text NOT NULL,
  `rs_owner_name_details` mediumtext NOT NULL,
  `hal_khotian_no` text NOT NULL,
  `hal_dag_no` text NOT NULL,
  `hal_owner_name_details` mediumtext NOT NULL,
  `hal_owner_area` text NOT NULL,
  `ownership_case_status` int(11) DEFAULT NULL,
  `case_details` mediumtext NOT NULL,
  `case_last_update` varchar(10) DEFAULT NULL,
  `unused_land_status` int(11) DEFAULT NULL,
  `unused_land_area` varchar(100) NOT NULL,
  `unused_land_proposal` mediumtext NOT NULL,
  `information_provider_details` mediumtext NOT NULL,
  `land_resp_officer_details` mediumtext NOT NULL,
  `verified_status` int(11) DEFAULT NULL,
  `verified_by` int(11) DEFAULT NULL,
  `verified_date` varchar(10) NOT NULL,
  PRIMARY KEY (`land_record_info_id`),
  KEY `land_record_info_id` (`land_record_info_id`),
  KEY `building_unit_id` (`building_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2419 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `english` text NOT NULL,
  `bangla` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_letter_construction` (
  `letter_construction_id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_type` int(11) DEFAULT NULL,
  `letter_sub_type` int(11) NOT NULL,
  `letter_construction_tos` longtext NOT NULL,
  `letter_construction_year` int(11) DEFAULT NULL,
  `sarok_no` text NOT NULL,
  `sarok_no_2` text DEFAULT NULL,
  `sarok_date` date DEFAULT NULL,
  `replaced_letter` int(11) NOT NULL DEFAULT '0',
  `mujib_importance` int(11) NOT NULL DEFAULT '0',
  `is_corrected_letter` int(11) DEFAULT '0',
  `top_right_corner` varchar(191) DEFAULT NULL,
  `middle_below_letter_type` varchar(191) DEFAULT NULL,
  `letter_construction_subject` longtext NOT NULL,
  `letter_construction_reference` longtext NOT NULL,
  `letter_construction_body` longtext NOT NULL,
  `is_auto_generate_construction_table` int(11) NOT NULL DEFAULT '1',
  `letter_construction_instruction` longtext NOT NULL,
  `letter_construction_signatory` longtext NOT NULL,
  `letter_construction_signatory_date` date DEFAULT NULL,
  `letter_construction_signatory_2` longtext,
  `letter_construction_signatory_date_2` date DEFAULT NULL,
  `is_sign` int(11) NOT NULL DEFAULT '1',
  `financial_code` varchar(191) DEFAULT NULL,
  `strict_financial_code` int(11) NOT NULL DEFAULT '1',
  `different_project_financial_code` varchar(191) DEFAULT NULL,
  `letter_construction_to_head` longtext NOT NULL,
  `to_head_tos` int(11) DEFAULT NULL,
  `letter_construction_status` int(11) DEFAULT NULL,
  `show_allotment_table` int(11) NOT NULL DEFAULT '1',
  `show_letter_type_title` tinyint(4) NOT NULL DEFAULT '1',
  `onulipi` varchar(400) DEFAULT 'অনুলিপি - অবগতি ও প্রয়োজনীয় ব্যবস্থা গ্রহণের জন্য প্রেরণ করা হল। (জেষ্ঠ্যতার ভিত্তিতে নহে)',
  `next_allotment` int(11) DEFAULT '4',
  `building_unit_id` int(11) NOT NULL,
  `letter_construction_project_type` int(11) NOT NULL,
  `signed_officer_user_id` int(11) DEFAULT NULL,
  `installment_amount` double(20,2) DEFAULT '0.00',
  `installment_amount_final` double(20,2) DEFAULT '0.00',
  `installment_amount_difference` double(20,2) DEFAULT '0.00',
  `surrender_amount` double(20,2) DEFAULT '0.00',
  `surrender_amount_final` double(20,2) DEFAULT '0.00',
  `surrender_amount_difference` double(20,2) DEFAULT '0.00',
  `memo_status` varchar(191) DEFAULT 'Memo Not Yet',
  `is_in_favor_of` int(11) DEFAULT '0',
  `in_favor_of_user` int(11) DEFAULT NULL,
  `is_show_variation_para` tinyint(1) NOT NULL DEFAULT '1',
  `attachment` text,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`letter_construction_id`),
  KEY `letter_type` (`letter_type`,`letter_sub_type`,`letter_construction_year`,`building_unit_id`,`letter_construction_project_type`)
) ENGINE=InnoDB AUTO_INCREMENT=23342 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_letter_construction_project` (
  `letter_construction_project_id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_construction_id` int(11) NOT NULL,
  `construction_info_id` int(11) NOT NULL,
  PRIMARY KEY (`letter_construction_project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34625 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_letter_heading` (
  `letter_heading_id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_heading_date` varchar(256) DEFAULT NULL COMMENT 'bangla heading',
  `letter_heading_sarok` text NOT NULL,
  `letter_heading_subject` text NOT NULL,
  `letter_heading_ref` varchar(255) NOT NULL,
  `letter_heading_copies` varchar(255) NOT NULL,
  `cromik_no` varchar(100) NOT NULL,
  `prokolpo_id` varchar(100) NOT NULL,
  `prokolpo_name` varchar(100) NOT NULL,
  `proshasonik_onumodon` varchar(100) NOT NULL,
  `tec_onumodon` varchar(100) NOT NULL,
  `ortho_protahar1` varchar(100) NOT NULL,
  `ortho_protahar2` varchar(100) NOT NULL,
  `ortho_protahar3` varchar(100) NOT NULL,
  `ortho_protahar4` varchar(100) NOT NULL,
  `ortho_protahar5` varchar(100) NOT NULL,
  `ortho_protahar6` varchar(100) NOT NULL,
  `nirman_boraddo1` varchar(100) NOT NULL,
  `nirman_boraddo2` varchar(100) NOT NULL,
  `nirman_boraddo3` varchar(100) NOT NULL,
  `proshashonik_onomodon_repair` varchar(256) NOT NULL,
  `nirman_boraddo4` varchar(100) NOT NULL,
  `songsudito_onumodhon1` varchar(100) NOT NULL,
  `songsudito_onumodhon2` varchar(100) NOT NULL,
  `letter_heading_banner` text NOT NULL,
  `shomvabbo_boraddo` varchar(256) NOT NULL,
  `template_text` text NOT NULL,
  `construction_letter_body` text NOT NULL,
  `construction_letter_instruction` text NOT NULL,
  `construction_letter_signatory` text NOT NULL,
  `construction_letter_to_head` text NOT NULL,
  `construction_letter_tos` longtext NOT NULL,
  `repair_letter_body` text NOT NULL,
  `repair_letter_instruction` text NOT NULL,
  `repair_letter_signatory` text NOT NULL,
  `repair_letter_to_head` text NOT NULL,
  `other_letter_body` text NOT NULL,
  `other_letter_instruction` text NOT NULL,
  `other_letter_signatory` text NOT NULL,
  `other_letter_to_head` text NOT NULL,
  `other_letter_copies_to` text NOT NULL,
  `meramot_boraddo_1` text NOT NULL,
  PRIMARY KEY (`letter_heading_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_letter_heading_long` (
  `letter_heading_long_id` int(11) NOT NULL AUTO_INCREMENT,
  `construction_letter_tos` text NOT NULL,
  `other_letter_signatory` text NOT NULL,
  `other_letter_to_head` text NOT NULL,
  `other_letter_copies_to` text NOT NULL,
  `repair_letter_tos` text NOT NULL,
  PRIMARY KEY (`letter_heading_long_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_letter_heading_rncp` (
  `letter_heading_id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_heading_date` varchar(256) DEFAULT NULL COMMENT 'bangla heading',
  `letter_heading_sarok` text NOT NULL,
  `letter_heading_subject` varchar(255) NOT NULL,
  `letter_heading_ref` varchar(255) NOT NULL,
  `letter_heading_copies` varchar(255) NOT NULL,
  `cromik_no` varchar(100) NOT NULL,
  `letter_heading_banner` text NOT NULL,
  `template_text` text NOT NULL,
  `letter_body` text NOT NULL,
  `letter_instruction` text NOT NULL,
  `letter_signatory` text NOT NULL,
  `letter_to_head` text NOT NULL,
  `letter_tos` longtext NOT NULL,
  PRIMARY KEY (`letter_heading_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_letter_other` (
  `letter_other_id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_other_type` int(11) DEFAULT NULL,
  `letter_other_sub_type` int(11) DEFAULT NULL,
  `letter_other_year` int(11) DEFAULT NULL,
  `letter_other_sarok_no` text NOT NULL,
  `letter_other_sarok_date` date DEFAULT NULL,
  `letter_other_subject` text NOT NULL,
  `letter_other_reference` text NOT NULL,
  `letter_other_body` text NOT NULL,
  `letter_other_instruction` text NOT NULL,
  `letter_other_signatory` text NOT NULL,
  `letter_other_to_head` text NOT NULL,
  `letter_other_copies_to` text NOT NULL,
  `letter_other_status` int(11) DEFAULT NULL,
  `building_unit_id` int(11) DEFAULT NULL,
  `letter_other_project_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`letter_other_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4874 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_letter_other_project` (
  `letter_other_project_id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_other_id` int(11) NOT NULL,
  `construction_info_id` int(11) NOT NULL,
  PRIMARY KEY (`letter_other_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_letter_repair` (
  `letter_repair_id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_repair_type` int(11) DEFAULT NULL,
  `letter_repair_sub_type` int(11) DEFAULT NULL,
  `letter_repair_year` int(11) DEFAULT NULL,
  `letter_repair_sarok_no` text NOT NULL,
  `despatch_no` varchar(150) DEFAULT NULL,
  `signed_by` int(11) DEFAULT NULL,
  `letter_repair_sarok_date` date DEFAULT NULL,
  `letter_repair_subject` text NOT NULL,
  `letter_repair_reference` text NOT NULL,
  `letter_repair_body` text NOT NULL,
  `letter_repair_instruction` text NOT NULL,
  `attachment_note` text,
  `letter_repair_signatory` text NOT NULL,
  `letter_repair_to_head` text NOT NULL,
  `letter_repair_tos` text NOT NULL,
  `letter_repair_status` int(11) DEFAULT NULL,
  `building_unit_id` int(11) NOT NULL,
  `repair_code` int(11) DEFAULT NULL,
  `replaced_letter` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`letter_repair_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11889 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_letter_repair_project` (
  `letter_repair_project_id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_repair_id` int(11) NOT NULL,
  `repair_id` int(11) NOT NULL,
  PRIMARY KEY (`letter_repair_project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37781 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_letter_rncp` (
  `letter_rncp_id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_type` int(11) DEFAULT NULL,
  `letter_sub_type` int(11) NOT NULL,
  `building_unit_id` int(11) DEFAULT NULL,
  `letter_rncp_tos` longtext NOT NULL,
  `letter_rncp_year` int(11) DEFAULT NULL,
  `sarok_no` text NOT NULL,
  `sarok_no_2` text DEFAULT NULL,
  `sarok_date` date DEFAULT NULL,
  `replaced_letter` int(11) NOT NULL DEFAULT '0',
  `mujib_importance` int(11) NOT NULL DEFAULT '0',
  `top_right_corner` varchar(191) DEFAULT NULL,
  `middle_below_letter_type` varchar(191) DEFAULT NULL,
  `letter_rncp_subject` longtext NOT NULL,
  `letter_rncp_reference` longtext NOT NULL,
  `letter_rncp_body` longtext NOT NULL,
  `is_auto_generate_construction_table` int(11) NOT NULL DEFAULT '1',
  `letter_rncp_instruction` longtext NOT NULL,
  `letter_rncp_signatory` longtext NOT NULL,
  `letter_rncp_signatory_2` longtext,
  `is_sign` int(11) NOT NULL DEFAULT '1',
  `letter_rncp_to_head` longtext NOT NULL,
  `to_head_tos` int(11) DEFAULT NULL,
  `letter_rncp_status` int(11) DEFAULT NULL,
  `show_allotment_table` int(11) NOT NULL DEFAULT '1',
  `show_letter_type_title` tinyint(4) NOT NULL DEFAULT '1',
  `onulipi` varchar(400) DEFAULT 'অনুলিপি - অবগতি ও প্রয়োজনীয় ব্যবস্থা গ্রহণের জন্য প্রেরণ করা হল। (জেষ্ঠ্যতার ভিত্তিতে নহে)',
  `next_allotment` int(11) DEFAULT '4',
  `signed_officer_user_id` int(11) DEFAULT NULL,
  `memo_status` varchar(191) DEFAULT 'Memo Not Yet',
  `attachment` text,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`letter_rncp_id`),
  KEY `letter_type` (`letter_type`,`letter_sub_type`,`letter_rncp_year`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_letter_tos` (
  `letter_tos_id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_construction_repair_id` int(11) NOT NULL,
  `letter_tos` text NOT NULL,
  PRIMARY KEY (`letter_tos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6384 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_letter_tos_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_id` int(10) NOT NULL,
  `letter_type` int(2) NOT NULL,
  `letter_tos` text NOT NULL,
  `tos_email` text NOT NULL,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15230 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_letter_tos_email_rncp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_id` int(10) NOT NULL,
  `letter_type` int(2) NOT NULL,
  `letter_tos` text NOT NULL,
  `tos_email` text NOT NULL,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_lifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `building_info_id` int(11) NOT NULL,
  `building_id` varchar(100) NOT NULL,
  `lift_no` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_location_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `building_unit_id` int(11) NOT NULL,
  `user_type_default_id` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2394 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_mail_box` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_id` int(5) NOT NULL,
  `user_id` int(3) NOT NULL,
  `tos_id` int(3) NOT NULL,
  `email` varchar(100) NOT NULL,
  `attach` text,
  `path` text NOT NULL,
  `status` int(2) NOT NULL,
  `sent_mail_status` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59157 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_mail_box_rncp` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_id` int(5) NOT NULL,
  `user_id` int(3) NOT NULL,
  `tos_id` int(3) NOT NULL,
  `email` varchar(100) NOT NULL,
  `attach` text,
  `path` text NOT NULL,
  `status` int(2) NOT NULL,
  `sent_mail_status` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message_date` date DEFAULT NULL,
  `message_title` varchar(255) NOT NULL,
  `message_body` text NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_message_receiver` (
  `message_receiver_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `read_status` int(1) DEFAULT NULL,
  `read_date` date DEFAULT NULL,
  PRIMARY KEY (`message_receiver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_ministry_report_changes` (
  `building_info_id` int(11) DEFAULT NULL,
  `monitoring_officer_id` int(11) DEFAULT NULL,
  `resident_type` varchar(190) DEFAULT NULL,
  `project_ids` mediumtext,
  `project_type_ids` text,
  `project_types` text,
  `building_id` varchar(190) DEFAULT NULL,
  `project_title` longtext,
  `project_title_brief` longtext,
  `img_src` longtext,
  `building_unit` mediumtext,
  `project_expense` double(20,2) DEFAULT NULL,
  `tec_amount` double(20,2) DEFAULT NULL,
  `cumulative_allotment_upto_date` double(20,2) DEFAULT NULL,
  `allotment_due` double(20,2) DEFAULT NULL,
  `physical_progress` double(20,2) DEFAULT NULL,
  `financial_progress` double(20,2) DEFAULT NULL,
  `phq_officer` varchar(190) DEFAULT NULL,
  `last_activity` longtext,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_ndc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `file_name` varchar(256) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_overview_data` (
  `overview_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_unit_id` int(11) NOT NULL,
  `overview_data_remarks` varchar(200) NOT NULL,
  `overview_data_lovdata` varchar(255) NOT NULL,
  `overview_data_date` date DEFAULT NULL,
  PRIMARY KEY (`overview_data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_page` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_parent` int(11) NOT NULL,
  `page_title` varchar(256) NOT NULL,
  `page_description` mediumtext NOT NULL,
  `page_status` int(1) NOT NULL,
  `page_level` int(11) NOT NULL,
  `page_sort_by` int(11) NOT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_page_table` (
  `page_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(256) NOT NULL,
  `page_name` varchar(256) NOT NULL,
  PRIMARY KEY (`page_table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_pending_construction_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` text NOT NULL,
  `proposed_amount` double(20,2) DEFAULT '0.00',
  `range_id` int(11) DEFAULT NULL,
  `building_unit_id` int(11) DEFAULT NULL,
  `proposal_memo` varchar(191) DEFAULT NULL,
  `proposal_memo_date` date DEFAULT NULL,
  `phq_diary_no` varchar(191) DEFAULT NULL,
  `phq_file_no` text,
  `phq_receive_date` date DEFAULT NULL,
  `phq_officer_id` int(11) NOT NULL,
  `is_enlisted` int(11) NOT NULL DEFAULT '0',
  `enlisted_project_id` int(11) DEFAULT '0',
  `status` varchar(191) NOT NULL DEFAULT 'Pending',
  `latest_activity` text,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=443 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_pending_construction_info_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `file` text NOT NULL,
  `file_ext` varchar(20) NOT NULL,
  `file_type` varchar(20) NOT NULL,
  `file_sub_type` varchar(191) DEFAULT NULL,
  `description` text,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_name` (`permission_name`)
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_permission_user` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_phq_officers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `area` text,
  `section` varchar(191) DEFAULT NULL,
  `officer_type` varchar(191) DEFAULT NULL,
  `superior_officer_id` int(11) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `created_by` int(6) NOT NULL,
  `updated_by` int(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_pre_and_post_repair_image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `repair_id` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `item_serial` double(10,2) DEFAULT NULL,
  `pre_repair_image` varchar(256) DEFAULT NULL,
  `pre_repair_image_date` date DEFAULT NULL,
  `post_repair_image` varchar(256) DEFAULT NULL,
  `post_repair_image_date` date DEFAULT NULL,
  `old_items_image` varchar(256) DEFAULT NULL,
  `old_items_date` date DEFAULT NULL,
  `remarks_on_old_item_image` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33832 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_project_progress_report_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `row_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `tender_type` int(11) NOT NULL,
  `tenderer_person_id` int(11) NOT NULL,
  `file_ext` varchar(255) NOT NULL,
  `file_path` text NOT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63091 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_project_time_extension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `construction_info_id` int(11) NOT NULL,
  `last_requested_close_date` date NOT NULL,
  `extended_closing_date` date NOT NULL,
  `extended_duration` int(11) NOT NULL,
  `comment` text,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_proposal_duality_certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL,
  `file` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1546 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_pwd_budget_request` (
  `pwd_budget_request_id` int(11) NOT NULL AUTO_INCREMENT,
  `construction_info_id` int(11) NOT NULL,
  `construction_installment_fiscal_year` int(11) DEFAULT NULL,
  `request_type` int(11) NOT NULL,
  `request_date` date DEFAULT NULL,
  `demand_amount` decimal(20,2) NOT NULL,
  `given_amount` decimal(20,2) NOT NULL,
  `phq_amount` decimal(20,2) NOT NULL,
  `approved_date` date DEFAULT NULL,
  `construction_installment_id` int(11) NOT NULL,
  `pwd_budget_comment` text NOT NULL,
  `building_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pwd_budget_request_id`),
  KEY `construction_info_id` (`construction_info_id`,`request_type`,`construction_installment_id`,`building_info_id`,`user_id`),
  KEY `construction_installment_fiscal_year` (`construction_installment_fiscal_year`)
) ENGINE=InnoDB AUTO_INCREMENT=10400 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_pwd_lged_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_type` int(11) NOT NULL,
  `schedule_type` int(11) NOT NULL,
  `item_no` varchar(150) NOT NULL,
  `item_name` varchar(256) NOT NULL,
  `description` longtext NOT NULL,
  `unit` int(11) NOT NULL,
  `area_one` double(10,2) NOT NULL COMMENT 'Dhaka, Mymensingh',
  `area_two` double(10,2) NOT NULL COMMENT 'Chattogram, Sylhet',
  `area_three` double(10,2) NOT NULL COMMENT 'Khulna, Barisal, Gopalgonj',
  `area_four` double(10,2) NOT NULL COMMENT 'Rajshahi, Rangpur',
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_pwd_lged_schedule_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `schedule_type` int(11) NOT NULL,
  `description` longtext,
  `unit` int(11) DEFAULT NULL,
  `area_one` double(10,2) DEFAULT NULL COMMENT 'Dhaka, Mymensingh ',
  `area_two` double(10,2) DEFAULT NULL COMMENT 'Chattogram, Sylhet ',
  `area_three` double(10,2) DEFAULT NULL COMMENT 'Khulna, Barisal, Gopalgonj 	',
  `area_four` double(10,2) DEFAULT NULL COMMENT 'Rajshahi, Rangpur',
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4444 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_pwd_progress_report_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `row_type` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `row_sl` int(11) DEFAULT '0',
  `has_break` int(11) NOT NULL DEFAULT '0',
  `col_no` text CHARACTER SET utf8,
  `col_name` longtext CHARACTER SET utf8,
  `col_ao` text CHARACTER SET utf8,
  `col_project_duration_from` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `col_project_duration_to` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `col_pre_allotment` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `col_pre_expense` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `col_pre_progress` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `col_adp_allotment` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `col_post_allotment` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `col_post_expense` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `col_post_progress` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `col_total_allotment` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `col_total_expense` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `col_total_progress` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `col_project_closing_date` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `col_comment` longtext CHARACTER SET utf8,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `col_quote_amount` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `col_project_duration` int(11) DEFAULT NULL,
  `no_work_order_date` int(11) DEFAULT '0',
  `is_project_finished` int(11) DEFAULT '-1',
  `is_payment_complete` int(11) DEFAULT '-1',
  `is_in_use` int(11) DEFAULT '-1',
  `col_pwd_variation_not_approved` tinyint(1) NOT NULL DEFAULT '0',
  `col_pwd_variation_not_approved_2` tinyint(1) NOT NULL DEFAULT '0',
  `col_pwd_variation_not_approved_3` tinyint(1) NOT NULL DEFAULT '0',
  `col_contractor_name` text CHARACTER SET utf8,
  `col_contractor_address` text CHARACTER SET utf8,
  `col_contractor_comment` text CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47996 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_pwd_progress_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `ministry` varchar(200) CHARACTER SET utf8 NOT NULL,
  `report_month` varchar(50) CHARACTER SET utf8 NOT NULL,
  `report_year` varchar(50) CHARACTER SET utf8 NOT NULL,
  `report_sl` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `signature` text CHARACTER SET utf8,
  `building_boundary_id` int(11) DEFAULT NULL,
  `building_boundary_type` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `tenderer_person_id` int(11) NOT NULL,
  `project_last_month` varchar(50) CHARACTER SET utf8 NOT NULL,
  `project_last_year` varchar(50) CHARACTER SET utf8 NOT NULL,
  `project_fiscal_year` varchar(100) CHARACTER SET utf8 NOT NULL,
  `exen_unit` varchar(200) CHARACTER SET utf8 NOT NULL,
  `published_at` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5548 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_pwd_request_type` (
  `pwd_request_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `pwd_request_type_title` varchar(256) NOT NULL,
  PRIMARY KEY (`pwd_request_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_receive_info` (
  `receive_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_info_id` int(11) NOT NULL,
  `issue_receiving_date` date DEFAULT NULL,
  `issue_receiving_memo` text NOT NULL,
  `issue_receiving_comments` text NOT NULL,
  `issue_receiving_status` int(11) NOT NULL,
  PRIMARY KEY (`receive_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=785 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_related_building` (
  `related_building_id` int(11) NOT NULL AUTO_INCREMENT,
  `land_record_info_id` int(11) NOT NULL,
  `building_info_id` int(11) NOT NULL,
  PRIMARY KEY (`related_building_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3704 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_rental_office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_name` varchar(191) NOT NULL,
  `range_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `building_unit_id` int(11) DEFAULT NULL,
  `building_info_id` int(11) DEFAULT NULL,
  `designation_head_of_office` varchar(191) DEFAULT NULL,
  `manpower` int(11) DEFAULT NULL,
  `office_address` mediumtext,
  `office_area` double DEFAULT NULL,
  `monthly_rent_with_vat` double DEFAULT NULL,
  `yearly_rent_with_vat` double DEFAULT NULL,
  `contract_first_date` date DEFAULT NULL,
  `contract_duration_in_month` int(11) DEFAULT NULL,
  `contract_last_date` date DEFAULT NULL,
  `warning_before_days` int(11) DEFAULT NULL,
  `contract_warning_date` date DEFAULT NULL,
  `contract_renewal_date` date DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `description` mediumtext,
  `phq_memo` varchar(191) DEFAULT NULL,
  `phq_memo_date` varchar(191) DEFAULT NULL,
  `contract_duration` mediumtext,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1127 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_repair` (
  `repair_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_start_fiscal_year` varchar(10) DEFAULT NULL,
  `repair_unit` int(11) DEFAULT NULL,
  `repair_type` int(11) DEFAULT NULL,
  `repair_code` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `letter_status` int(11) DEFAULT NULL,
  `tender_type` int(11) DEFAULT NULL,
  `tender_person` int(11) DEFAULT NULL,
  `fiscal_year` varchar(10) DEFAULT NULL,
  `building_district_id` int(11) DEFAULT NULL,
  `building_unit_id` int(11) DEFAULT NULL,
  `building_info_id` int(11) DEFAULT NULL,
  `tender_open_date` date DEFAULT NULL,
  `tec_unit_date` date DEFAULT NULL,
  `description` text NOT NULL,
  `estimated_cost` float(20,2) NOT NULL,
  `tec_approval_date` date DEFAULT NULL,
  `ao_amount` decimal(20,2) NOT NULL,
  `estimated_amount_after_ao` decimal(20,2) NOT NULL DEFAULT '0.00',
  `tec_amount` decimal(20,2) NOT NULL,
  `alotment` decimal(20,2) NOT NULL,
  `surrender_amount` decimal(20,2) DEFAULT NULL,
  `variation_amount` decimal(20,2) DEFAULT '0.00',
  `variation_allotment` decimal(20,2) DEFAULT '0.00',
  `work_order_date` date DEFAULT NULL,
  `work_starting_date` date DEFAULT NULL,
  `work_duration` int(11) DEFAULT NULL,
  `revised_approve_amount` decimal(20,2) NOT NULL,
  `save_amount` decimal(20,2) NOT NULL,
  `num_tender_sold` varchar(100) NOT NULL,
  `num_tender_rcv` varchar(100) NOT NULL,
  `remarks` text NOT NULL,
  `building_wall` varchar(256) NOT NULL,
  `ending_report` enum('Yes','No') NOT NULL DEFAULT 'No',
  `ending_report_accepted_by` int(11) DEFAULT NULL,
  `ending_report_accepted_on` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `summary_sheet` longtext,
  `overall_or_flat` enum('overall','flat','lift') NOT NULL DEFAULT 'overall',
  `flat_id` int(11) DEFAULT NULL,
  `lift_no` varchar(256) DEFAULT NULL,
  `proposal_id` bigint(20) DEFAULT NULL,
  `contractor_id` int(11) NOT NULL DEFAULT '0',
  `bid_position` int(11) NOT NULL DEFAULT '0',
  `purchase_method` int(11) NOT NULL DEFAULT '0',
  `std` int(11) NOT NULL DEFAULT '0',
  `approved_purchase_method` int(11) NOT NULL DEFAULT '0',
  `progress` int(11) NOT NULL DEFAULT '100',
  `allotment_from_ministry_id` int(11) DEFAULT '0',
  PRIMARY KEY (`repair_id`),
  KEY `repair_unit` (`repair_unit`,`fiscal_year`),
  KEY `repair_id` (`repair_id`),
  KEY `building_unit_id` (`building_unit_id`),
  KEY `building_info_id` (`building_info_id`),
  KEY `building_district_id` (`building_district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23995 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_repair_allotment_from_ministry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fiscal_year` int(11) NOT NULL DEFAULT '0',
  `economic_code` int(11) NOT NULL DEFAULT '0',
  `part` int(11) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `full` tinyint(4) NOT NULL DEFAULT '0',
  `allotment_letter_created` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_title_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `structure_type` int(11) NOT NULL,
  `structure_type_description` text DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `purchase_method` varchar(256) NOT NULL,
  `purchase_method_description` text DEFAULT NULL,
  `estimated_expenditure` double(10,2) NOT NULL,
  `tender_publication` date NOT NULL,
  `tender_opening` date NOT NULL,
  `tender_evaluation` date NOT NULL,
  `tender_approval` date NOT NULL,
  `notification_of_award` date NOT NULL,
  `contract_signing` date NOT NULL,
  `ending_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15209 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_app_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_title` varchar(256) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `fiscal_year` int(11) NOT NULL,
  `repair_code_for_app` int(11) NOT NULL,
  `total_estimated_expenditure` double(12,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1792',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2699 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_cleaning_quota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fiscal_year` int(11) DEFAULT NULL,
  `building_unit` int(11) DEFAULT NULL,
  `quota_percent` decimal(20,2) DEFAULT NULL,
  `quota_available` int(11) DEFAULT NULL,
  `not_tender_yet` int(11) DEFAULT NULL,
  `custom_unit_district` int(11) DEFAULT NULL,
  `quota_amount` decimal(20,2) DEFAULT NULL,
  `repair_quota_status` int(11) DEFAULT NULL,
  `final_budget` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_completion_report_old_item_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tec_details_id` int(11) NOT NULL,
  `image_type` enum('demolishable','auctionable','reusable') DEFAULT NULL,
  `image` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3942 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_contractor_updated_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractor_id` int(11) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `trade_license_no` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_contractors_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_license_no` varchar(256) NOT NULL,
  `bin_no` varchar(150) NOT NULL,
  `other_identification_no` varchar(150) NOT NULL,
  `vat_reg_no` varchar(256) NOT NULL,
  `agency_tin` varchar(256) NOT NULL,
  `agency_name` varchar(256) CHARACTER SET utf8 NOT NULL,
  `agency_name_bn` varchar(256) NOT NULL,
  `agency_registered_address` text NOT NULL,
  `name_type` enum('proprietor','md') NOT NULL,
  `proprietor_or_md_name` varchar(256) NOT NULL,
  `proprietor_or_md_nid` bigint(11) NOT NULL,
  `proprietor_or_md_phone` varchar(150) NOT NULL,
  `proprietor_or_md_tin` varchar(256) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=636 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_details` (
  `repair_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_wall_repair_id` int(11) NOT NULL,
  `building_info_id` int(11) NOT NULL,
  `repair_work_name` int(11) NOT NULL,
  `unit_measurement` int(11) NOT NULL,
  `repair_quantity` float NOT NULL,
  `repair_rate` float NOT NULL,
  `repair_amount` double(11,4) NOT NULL,
  `repair_remark` mediumtext NOT NULL,
  PRIMARY KEY (`repair_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=198917 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_repair_ending_report_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_wall_repair_id` int(11) DEFAULT NULL,
  `item` varchar(256) DEFAULT NULL,
  `item_serial` double(10,2) DEFAULT NULL,
  `approved_amount` double(10,2) DEFAULT NULL,
  `work_done_amount` double(10,2) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `approved_quantity` double(10,2) DEFAULT NULL,
  `work_done_quantity` double(10,2) DEFAULT NULL,
  `remarks` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4472 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_firefighting_quota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fiscal_year` int(11) DEFAULT NULL,
  `building_unit` int(11) DEFAULT NULL,
  `quota_percent` decimal(20,2) DEFAULT NULL,
  `quota_available` int(11) DEFAULT NULL,
  `not_tender_yet` int(11) DEFAULT NULL,
  `custom_unit_district` int(11) DEFAULT NULL,
  `quota_amount` decimal(20,2) DEFAULT NULL,
  `repair_quota_status` int(11) DEFAULT NULL,
  `final_budget` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_image` (
  `repair_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_wall_repair_id` int(11) NOT NULL,
  `building_info_id` int(11) NOT NULL,
  `repair_image` varchar(256) NOT NULL,
  `repair_image_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `picture_folder_name` int(11) DEFAULT NULL,
  `image_description` mediumtext NOT NULL,
  PRIMARY KEY (`repair_image_id`),
  KEY `building_info_id` (`building_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=219424 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_repair_image_with_proposal` (
  `image_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` bigint(11) NOT NULL,
  `item_serial` decimal(5,3) DEFAULT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `pre_repair_image` varchar(256) DEFAULT NULL,
  `pre_repair_image_date` date DEFAULT NULL,
  `post_repair_image` varchar(256) DEFAULT NULL,
  `post_repair_image_date` date DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123783 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_repair_letter_pdf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_repair_id` int(11) DEFAULT NULL,
  `file` varchar(256) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_name` varchar(256) NOT NULL,
  `fiscal_year` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_noa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL,
  `district` varchar(256) DEFAULT NULL,
  `contract_no` varchar(256) NOT NULL,
  `contract_date` date NOT NULL,
  `date_14_days` date NOT NULL,
  `date_28_days` date NOT NULL,
  `date` date NOT NULL,
  `file` varchar(256) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `bp` bigint(20) DEFAULT NULL,
  `rank` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=869 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `structure_id_integer` int(11) NOT NULL,
  `structure_id` varchar(100) NOT NULL,
  `structure_type` varchar(10) NOT NULL,
  `fiscal_year` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `project_title` text NOT NULL,
  `approved_project_title` text DEFAULT NULL,
  `priority_no` int(11) NOT NULL,
  `estimated_cost` double(10,2) NOT NULL,
  `approved_estimated_cost` double(10,2) DEFAULT NULL,
  `repair_type` int(11) NOT NULL,
  `material` int(11) DEFAULT NULL,
  `starting_point` varchar(256) DEFAULT NULL,
  `ending_point` varchar(256) DEFAULT NULL,
  `via` varchar(256) DEFAULT NULL,
  `depth` double(20,2) DEFAULT NULL,
  `width` double(20,2) DEFAULT NULL,
  `length` double(20,2) DEFAULT NULL,
  `building_type` int(11) NOT NULL,
  `number_of_floors` int(11) DEFAULT NULL,
  `flats_per_floor` int(11) DEFAULT NULL,
  `flat_area` int(11) DEFAULT NULL,
  `have_occupants` tinyint(1) DEFAULT NULL,
  `occupant_pays_rent` tinyint(4) DEFAULT NULL,
  `certificate_from_sp` varchar(256) DEFAULT NULL,
  `occupants_name_and_designation` text,
  `why_flat_is_vacant` text,
  `no_one_lives_why_repair_is_needed` text NOT NULL,
  `rent_deduction_details` text,
  `short_description_on_rent` text NOT NULL,
  `description` text,
  `repair_in_last_three_years` tinyint(4) DEFAULT NULL,
  `last_repair_year` int(11) DEFAULT NULL,
  `last_repair_cost` double(10,2) NOT NULL,
  `short_repair_history` longtext NOT NULL,
  `cause_of_not_repairing` longtext,
  `estate_officer_visited_site` tinyint(4) DEFAULT NULL,
  `site_visiting_date` date NOT NULL,
  `comment_from_estate_officer` longtext NOT NULL,
  `approved_by_range` tinyint(1) NOT NULL DEFAULT '0',
  `message_from_range` text,
  `message_from_phq` text,
  `status` int(11) DEFAULT '0',
  `tec_status` int(11) NOT NULL DEFAULT '1792',
  `schedule_type` int(11) NOT NULL DEFAULT '1808',
  `approved_schedule_type` int(11) DEFAULT NULL,
  `tec_schedule_type` int(11) DEFAULT NULL,
  `read_unread` tinyint(1) NOT NULL DEFAULT '0',
  `repair_id` int(11) DEFAULT NULL,
  `app_item` int(11) DEFAULT NULL,
  `has_detailed_estimate` int(11) NOT NULL DEFAULT '1',
  `cause_of_not_attaching_detailed_estimate` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `sent_to_range_by` int(11) DEFAULT NULL,
  `sent_to_range_at` date DEFAULT NULL,
  `range_approval_by` int(11) DEFAULT NULL,
  `range_approval_at` date DEFAULT NULL,
  `submission_accepted_by` int(11) DEFAULT NULL,
  `submission_accepted_at` date DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` date DEFAULT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  `meeting_discussion` text,
  `upazila` int(11) NOT NULL DEFAULT '0',
  `meeting_decision` int(11) DEFAULT NULL,
  `implementing_officer` text,
  `minutes_status` tinyint(1) NOT NULL DEFAULT '0',
  `damage_cause` int(11) DEFAULT NULL,
  `sent_back_to` int(11) NOT NULL DEFAULT '6597',
  `sent_back_cause` int(11) DEFAULT NULL COMMENT 'tec sending back',
  `allowed_repair_code_for_this_proposal` int(11) NOT NULL DEFAULT '0',
  `purchase_method` int(11) DEFAULT NULL,
  `overall_or_flat` enum('overall','flat','lift') DEFAULT NULL,
  `flat_id` int(11) NOT NULL DEFAULT '0',
  `somorpon` double(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7911 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_allotment_notesheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fiscal_year_id` int(11) NOT NULL,
  `nothi_no` varchar(100) DEFAULT NULL,
  `paragraph_no` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `subject` text CHARACTER SET utf8,
  `shutro` text,
  `top_part` longtext,
  `bottom_part` longtext,
  `between_res_and_non_res` text,
  `between_non_res_and_non_other` text,
  `approval_status` tinyint(1) NOT NULL DEFAULT '0',
  `part` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_allotment_notesheet_and_proposal_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notesheet_id` int(11) NOT NULL,
  `proposal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1578 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_approval_meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fiscal_year_id` int(11) NOT NULL,
  `nothi_no` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `subject` text CHARACTER SET utf8,
  `subject_for_notesheet` text,
  `top_part` longtext,
  `signature` longtext,
  `copy_to` longtext CHARACTER SET utf8,
  `chairperson` text CHARACTER SET utf8,
  `chairperson_post` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `meeting_place` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `present_officials` text,
  `implementing_officer` text,
  `bottom_part` text,
  `between_res_and_non_res` text,
  `between_non_res_and_non_other` text,
  `sarok_no` int(11) DEFAULT NULL,
  `sarok_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=422 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_detailed_estimate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL,
  `file_name` varchar(256) DEFAULT NULL,
  `file_path` varchar(256) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6770 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proposal_id` bigint(20) NOT NULL,
  `repair_work` int(11) NOT NULL,
  `repair_work_parent` int(11) DEFAULT NULL,
  `unit_measurement` int(11) NOT NULL,
  `quantity` double(10,2) NOT NULL,
  `rate` double(10,2) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `remarks` text,
  `code` varchar(150) DEFAULT NULL,
  `repair_work_phq` int(11) DEFAULT NULL,
  `unit_measurement_phq` int(11) NOT NULL,
  `quantity_phq` int(11) NOT NULL,
  `rate_phq` double(10,2) NOT NULL,
  `amount_phq` double(10,2) NOT NULL,
  `remarks_phq` text,
  `repair_work _tec` int(11) NOT NULL,
  `unit_measurement_tec` int(11) NOT NULL,
  `quantity_tec` int(11) NOT NULL,
  `rate_tec` double(10,2) NOT NULL,
  `amount_tec` double(10,2) NOT NULL,
  `remarks_tec` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135665 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_details_after_approval` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proposal_details_id` bigint(20) DEFAULT NULL,
  `proposal_id` bigint(20) NOT NULL,
  `repair_work` int(11) NOT NULL,
  `repair_work_parent` int(11) DEFAULT NULL,
  `unit_measurement` int(11) NOT NULL,
  `quantity` double(10,3) NOT NULL,
  `rate` double(10,3) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `remarks` text NOT NULL,
  `code` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40331 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_details_after_tec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proposal_details_id` bigint(20) DEFAULT NULL,
  `proposal_id` bigint(20) NOT NULL,
  `repair_work` int(11) NOT NULL,
  `repair_work_parent` int(11) DEFAULT NULL,
  `unit_measurement` int(11) NOT NULL,
  `quantity` double(10,3) NOT NULL,
  `rate` double(10,3) NOT NULL,
  `amount` double(10,3) NOT NULL,
  `work_done_quantity` double(10,3) DEFAULT NULL,
  `work_done_amount` double(10,3) DEFAULT NULL,
  `remarks` varchar(256) NOT NULL,
  `code` varchar(150) DEFAULT NULL,
  `progress` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56625 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_details_completed_works` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proposal_id` bigint(20) NOT NULL,
  `repair_work` int(11) NOT NULL,
  `repair_work_parent` int(11) DEFAULT NULL,
  `tec_details_id` int(11) DEFAULT NULL,
  `unit_measurement` int(11) NOT NULL,
  `quantity` double(10,3) NOT NULL,
  `rate` double(10,3) NOT NULL,
  `amount` double(10,3) NOT NULL,
  `remarks` varchar(256) NOT NULL,
  `code` varchar(150) DEFAULT NULL,
  `work_done_quantity` double(10,3) DEFAULT NULL,
  `work_done_amount` double(10,3) DEFAULT NULL,
  `work_done_progress` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_meeting_and_officials_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) NOT NULL,
  `name_and_post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1994 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_meeting_and_proposal_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) NOT NULL,
  `proposal_id` int(11) NOT NULL,
  `project_title` text,
  `purchase_method` int(11) DEFAULT NULL,
  `estimated_cost` double(10,2) DEFAULT NULL,
  `approved_estimated_cost` double(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sent_back_to` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11003 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_multiple_building_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL,
  `building_info_id` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1026 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_notesheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fiscal_year_id` int(11) NOT NULL,
  `nothi_no` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `tenderer_person` int(11) NOT NULL DEFAULT '0',
  `tenderer_type` int(11) NOT NULL DEFAULT '0',
  `subject` text CHARACTER SET utf8,
  `shutro` varchar(256) DEFAULT NULL,
  `top_part` longtext,
  `bottom_part` longtext,
  `implementing_officer` text,
  `between_res_and_non_res` text,
  `between_non_res_and_non_other` text,
  `approval_status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_notesheet_and_proposal_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notesheet_id` int(11) NOT NULL,
  `proposal_id` int(11) NOT NULL,
  `project_title` text,
  `purchase_method` int(11) DEFAULT NULL,
  `estimated_cost` double(10,2) DEFAULT NULL,
  `approved_estimated_cost` double(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sent_back_to` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2549 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_site_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 DEFAULT NULL,
  `date` date DEFAULT NULL,
  `map` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2624 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_tec_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL,
  `noa_date` date DEFAULT NULL,
  `noa_sarok` text DEFAULT NULL,
  `noa_acceptance_date` date DEFAULT NULL,
  `caution_money` double(10,2) NOT NULL DEFAULT '0.00',
  `bank_name` varchar(256) DEFAULT NULL,
  `bank_deposit_slip` text,
  `contract_signing_date` date DEFAULT NULL,
  `contract_copy` text,
  `work_order_date` date DEFAULT NULL,
  `work_order_copy` text,
  `work_ending_date_as_per_work_order` date DEFAULT NULL,
  `work_completion_certificate_copy` text,
  `inspection_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2289 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_tec_notesheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fiscal_year_id` int(11) NOT NULL,
  `nothi_no` varchar(100) DEFAULT NULL,
  `paragraph_no` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `subject` text CHARACTER SET utf8,
  `shutro` varchar(256) DEFAULT NULL,
  `top_part` longtext,
  `bottom_part` longtext,
  `between_res_and_non_res` text,
  `between_non_res_and_non_other` text,
  `approval_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_tec_notesheet_and_proposal_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notesheet_id` int(11) NOT NULL,
  `proposal_id` int(11) NOT NULL,
  `project_title` text,
  `purchase_method` int(11) DEFAULT NULL,
  `ao_amount` double(10,3) DEFAULT NULL,
  `tec_amount` double(10,3) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sent_back_cause` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2945 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_proposal_tos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL,
  `file` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3215 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_quota` (
  `repair_quota_id` int(11) NOT NULL AUTO_INCREMENT,
  `repair_quota_fiscal_year` varchar(10) DEFAULT NULL,
  `building_unit_id` int(11) NOT NULL,
  `quota_percent` decimal(20,2) NOT NULL,
  `quota_available` tinyint(4) DEFAULT NULL,
  `not_tender_yet` tinyint(4) DEFAULT NULL,
  `custom_unit_district` int(11) NOT NULL,
  `quota_amount` decimal(20,2) NOT NULL,
  `quota_amount_res` decimal(20,2) NOT NULL DEFAULT '0.00',
  `quota_amount_non_res` decimal(20,2) NOT NULL DEFAULT '0.00',
  `quota_amount_other` decimal(20,2) NOT NULL DEFAULT '0.00',
  `repair_quota_status` int(11) NOT NULL,
  `final_budget` decimal(10,2) NOT NULL,
  PRIMARY KEY (`repair_quota_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2008 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_repair_section_letter_and_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4856 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_section_letters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_repair_type` int(11) DEFAULT NULL,
  `letter_repair_sub_type` int(11) DEFAULT NULL,
  `letter_repair_year` int(11) DEFAULT NULL,
  `letter_repair_sarok_no` text,
  `despatch_no` varchar(150) DEFAULT NULL,
  `signed_by` int(11) DEFAULT NULL,
  `letter_repair_sarok_date` date DEFAULT NULL,
  `letter_repair_subject` text,
  `letter_repair_reference` text,
  `letter_repair_body` text,
  `letter_repair_instruction` text,
  `attachment_note` text,
  `letter_repair_signatory` text,
  `letter_repair_to_head` text,
  `letter_repair_tos` text,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_repair_section_tos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_and_post` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `order_no` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_tos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL,
  `tender_number` varchar(256) DEFAULT NULL,
  `tender_date` date DEFAULT NULL,
  `total_estimated_cost` double(10,2) DEFAULT NULL,
  `tender_opening_date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `consultant` varchar(256) DEFAULT NULL,
  `member_one_name` varchar(256) DEFAULT NULL,
  `member_one_bp` bigint(20) DEFAULT NULL,
  `member_one_post` varchar(256) DEFAULT NULL,
  `member_two_name` varchar(256) DEFAULT NULL,
  `member_two_bp` bigint(20) DEFAULT NULL,
  `member_two_post` varchar(256) DEFAULT NULL,
  `chairman_name` varchar(256) DEFAULT NULL,
  `chairman_bp` bigint(20) DEFAULT NULL,
  `chairman_post` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1202 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_tos_row` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tos_id` int(11) NOT NULL,
  `tenderer_name` varchar(256) NOT NULL,
  `tenderer_address` text NOT NULL,
  `repair_tender_type` int(11) NOT NULL,
  `tender_amount` double(10,2) NOT NULL,
  `have_payorder` tinyint(1) NOT NULL,
  `pay_order_no` varchar(256) NOT NULL,
  `pay_order_date` date NOT NULL,
  `bank_name` varchar(256) NOT NULL,
  `branch_name` varchar(256) NOT NULL,
  `surety` double(10,2) NOT NULL,
  `owner_or_agent_name` varchar(256) NOT NULL,
  `owner_or_agent_address` text NOT NULL,
  `owner_or_agent_post` varchar(256) NOT NULL,
  `owner_or_agent_phone` varchar(256) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4562 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_total_budget` (
  `repair_total_budget_id` int(11) NOT NULL AUTO_INCREMENT,
  `repair_total_budget_fiscal_year` varchar(10) DEFAULT NULL,
  `repair_total_budget_total_amount` decimal(20,2) NOT NULL,
  `repair_total_budget_res` decimal(20,2) NOT NULL DEFAULT '0.00',
  `repair_total_budget_non_res` decimal(20,2) NOT NULL DEFAULT '0.00',
  `repair_total_budget_other` decimal(20,2) NOT NULL DEFAULT '0.00',
  `repair_total_budget_other_rab` decimal(20,0) NOT NULL DEFAULT '0',
  `repair_total_budget_reserve_amount` decimal(20,2) NOT NULL,
  PRIMARY KEY (`repair_total_budget_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_repair_total_budget_for_cleaning` (
  `tbl_repair_total_budget_for_cleaning_id` int(11) NOT NULL AUTO_INCREMENT,
  `fiscal_year` int(11) NOT NULL,
  `total_budget_amount` decimal(20,2) NOT NULL,
  `total_budget_revised_amount` decimal(20,2) NOT NULL,
  PRIMARY KEY (`tbl_repair_total_budget_for_cleaning_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_repair_total_budget_for_firefighting` (
  `tbl_repair_total_budget_for_firefighting_id` int(11) NOT NULL AUTO_INCREMENT,
  `fiscal_year` int(11) NOT NULL,
  `total_budget_amount` decimal(20,2) NOT NULL,
  `total_budget_revised_amount` decimal(20,2) NOT NULL,
  PRIMARY KEY (`tbl_repair_total_budget_for_firefighting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_residential` (
  `residential_id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(100) NOT NULL,
  `building_name` varchar(200) NOT NULL,
  `house_type` int(11) DEFAULT NULL,
  `total_house_no` varchar(100) NOT NULL,
  `for_phq` varchar(100) NOT NULL,
  `floor_no` varchar(100) NOT NULL,
  `room_per_unit` varchar(100) NOT NULL,
  `lift` int(11) DEFAULT NULL,
  `car_parking` int(11) DEFAULT NULL,
  `generator` int(11) DEFAULT NULL,
  `remarks` blob NOT NULL,
  `allot_quota` blob NOT NULL,
  `construction_year` varchar(10) NOT NULL,
  PRIMARY KEY (`residential_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_road_image` (
  `road_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `road_info_id` int(11) NOT NULL,
  `image` varchar(256) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`road_image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_road_info` (
  `road_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `road_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `road_id_number` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `road_info_parent` int(11) DEFAULT NULL,
  `road_info_parent_title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `road_id_for_title` varchar(100) NOT NULL,
  `road_name_en` varchar(256) CHARACTER SET utf8 NOT NULL,
  `road_name_bn` varchar(256) CHARACTER SET utf8 NOT NULL,
  `geo_district` int(11) DEFAULT NULL,
  `road_location` text CHARACTER SET utf8,
  `ownership` int(11) NOT NULL,
  `width` decimal(20,2) NOT NULL,
  `width_meter` decimal(20,2) NOT NULL,
  `width_without_drain` double(20,2) DEFAULT NULL,
  `width_without_drain_meter` double(20,2) DEFAULT NULL,
  `length` decimal(20,2) NOT NULL,
  `length_meter` decimal(20,2) NOT NULL,
  `construction_starting_year` int(11) NOT NULL,
  `construction_ending_year` int(11) NOT NULL,
  `construction_cost` decimal(20,2) NOT NULL,
  `road_type` int(11) NOT NULL,
  `footpath` enum('Yes','No') NOT NULL,
  `footpath_type` enum('One side','Both side') NOT NULL,
  `use_started_on` date DEFAULT NULL,
  `use_ended_on` date DEFAULT NULL,
  `contractor_info` text NOT NULL,
  `remarks` text NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`road_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_role_permission` (
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_save_letter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_id` int(11) NOT NULL,
  `project_id` text NOT NULL,
  `letter_type` varchar(50) NOT NULL,
  `path` varchar(255) NOT NULL,
  `sarok_no` varchar(100) CHARACTER SET utf8 NOT NULL,
  `attach` text,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17215 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_save_letter_rncp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `letter_id` int(11) NOT NULL,
  `letter_type` varchar(50) NOT NULL,
  `path` varchar(255) NOT NULL,
  `sarok_no` varchar(100) CHARACTER SET utf8 NOT NULL,
  `attach` text,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_site_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `photo` varchar(256) DEFAULT NULL,
  `rank` varchar(256) DEFAULT NULL,
  `mobilephone` varchar(100) DEFAULT NULL,
  `landphone` varchar(100) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `show_or_hide` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_site_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `file_name` varchar(256) NOT NULL,
  `date` date NOT NULL,
  `priority` int(11) NOT NULL,
  `show_or_hide` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_site_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `file_name` varchar(256) NOT NULL,
  `date` date NOT NULL,
  `priority` int(11) NOT NULL,
  `image_place` varchar(191) DEFAULT NULL,
  `show_or_hide` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_site_letter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `file_name` varchar(256) NOT NULL,
  `date` date NOT NULL,
  `priority` int(11) NOT NULL,
  `show_or_hide` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_site_notice_and_circular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `file_name` varchar(256) NOT NULL,
  `date` date NOT NULL,
  `priority` int(11) NOT NULL,
  `show_or_hide` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bulk_company` varchar(200) NOT NULL,
  `sender_id` varchar(200) NOT NULL,
  `number` varchar(20) NOT NULL,
  `message` text,
  `cost` double NOT NULL,
  `cost_per_sms` double NOT NULL,
  `sms_counted` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `status_text` text,
  `purpose` varchar(255) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2752 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_storage_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` text NOT NULL,
  `file_ext` varchar(191) NOT NULL,
  `file_category` int(11) NOT NULL,
  `file_size` double NOT NULL,
  `upload_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `folder_id` int(11) NOT NULL DEFAULT '1',
  `url` text NOT NULL,
  `description` text,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_storage_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text,
  `parent_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `child_file_count` int(11) NOT NULL,
  `child_folder_count` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_structure_id_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `building_info_parent` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `name` varchar(256) NOT NULL,
  `name_bn` varchar(256) NOT NULL,
  `present_use` int(11) NOT NULL,
  `ownership` int(11) NOT NULL,
  `usage_type` int(11) NOT NULL,
  `other_information` text NOT NULL,
  `name_and_contact` text NOT NULL,
  `read_unread` tinyint(1) NOT NULL,
  `submitted_by` int(11) NOT NULL,
  `served_by` int(11) DEFAULT NULL,
  `status` enum('Pending','Not Required','ID Issued') NOT NULL DEFAULT 'Pending',
  `given_id` varchar(100) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=552 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_structure_repair_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) NOT NULL,
  `fiscal_year` int(11) DEFAULT NULL,
  `number_of_buildings` int(11) DEFAULT NULL,
  `economic_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_structure_stat_for_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) NOT NULL,
  `economic_code` int(11) DEFAULT NULL,
  `building_stat_number_of_buildings_res` int(11) DEFAULT NULL,
  `building_stat_ids_of_buildings_res` int(11) DEFAULT NULL,
  `building_stat_total_fire_extinguishers_res` int(11) DEFAULT NULL,
  `building_stat_police_buildings_res` int(11) DEFAULT NULL,
  `building_stat_other_govt_buildings_res` int(11) DEFAULT NULL,
  `building_stat_rented_buildings_res` int(11) DEFAULT NULL,
  `building_stat_airmark_buildings_res` int(11) DEFAULT NULL,
  `building_stat_allotable_res` int(11) DEFAULT NULL,
  `building_stat_total_buildings_res` int(11) DEFAULT NULL,
  `building_stat_vacant_residence_res` int(11) DEFAULT NULL,
  `building_stat_barrack_res` int(11) DEFAULT NULL,
  `building_stat_police_buildings_non_res` int(11) DEFAULT NULL,
  `building_stat_other_govt_buildings_non_res` int(11) DEFAULT NULL,
  `building_stat_rented_buildings_non_res` int(11) DEFAULT NULL,
  `building_stat_number_of_buildings_non_res` int(11) DEFAULT NULL,
  `building_stat_ids_of_buildings_non_res` int(11) DEFAULT NULL,
  `building_stat_total_fire_extinguishers_non_res` int(11) DEFAULT NULL,
  `building_stat_number_of_buildings_other` int(11) DEFAULT NULL,
  `building_stat_ids_of_buildings_other` int(11) DEFAULT NULL,
  `building_stat_total_fire_extinguishers_other` int(11) DEFAULT NULL,
  `building_stat_police_buildings_other` int(11) DEFAULT NULL,
  `building_stat_other_govt_buildings_other` int(11) DEFAULT NULL,
  `building_stat_rented_buildings_other` int(11) DEFAULT NULL,
  `repair_plan_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_sync` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_table_column_name` varchar(191) CHARACTER SET utf8 NOT NULL,
  `to_table_column_name` varchar(191) CHARACTER SET utf8 NOT NULL,
  `row_id` bigint(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `sync_type` varchar(20) NOT NULL,
  `comment` text,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2393 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_tentative_repair_proposal_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `structure_id_integer` int(11) NOT NULL,
  `structure_id` varchar(100) NOT NULL,
  `structure_type` varchar(10) NOT NULL,
  `fiscal_year` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `project_title` text NOT NULL,
  `approved_project_title` text DEFAULT NULL,
  `priority_no` int(11) NOT NULL,
  `estimated_cost` double(10,2) NOT NULL,
  `approved_estimated_cost` double(10,2) DEFAULT NULL,
  `repair_type` int(11) NOT NULL,
  `material` int(11) DEFAULT NULL,
  `starting_point` varchar(256) DEFAULT NULL,
  `ending_point` varchar(256) DEFAULT NULL,
  `via` varchar(256) DEFAULT NULL,
  `depth` double(20,2) DEFAULT NULL,
  `width` double(20,2) DEFAULT NULL,
  `length` double(20,2) DEFAULT NULL,
  `building_type` int(11) NOT NULL,
  `number_of_floors` int(11) DEFAULT NULL,
  `flats_per_floor` int(11) DEFAULT NULL,
  `flat_area` int(11) DEFAULT NULL,
  `have_occupants` tinyint(1) DEFAULT NULL,
  `occupant_pays_rent` tinyint(4) DEFAULT NULL,
  `certificate_from_sp` varchar(256) DEFAULT NULL,
  `occupants_name_and_designation` text,
  `why_flat_is_vacant` text,
  `no_one_lives_why_repair_is_needed` text NOT NULL,
  `rent_deduction_details` text,
  `short_description_on_rent` text NOT NULL,
  `description` text,
  `repair_in_last_three_years` tinyint(4) DEFAULT NULL,
  `last_repair_year` int(11) DEFAULT NULL,
  `last_repair_cost` double(10,2) NOT NULL,
  `short_repair_history` longtext NOT NULL,
  `cause_of_not_repairing` longtext,
  `estate_officer_visited_site` tinyint(4) DEFAULT NULL,
  `site_visiting_date` date NOT NULL,
  `comment_from_estate_officer` longtext NOT NULL,
  `approved_by_range` tinyint(1) NOT NULL DEFAULT '0',
  `message_from_range` text,
  `message_from_phq` text,
  `status` int(11) DEFAULT '0',
  `tec_status` int(11) NOT NULL DEFAULT '1792',
  `schedule_type` int(11) NOT NULL DEFAULT '1808',
  `approved_schedule_type` int(11) DEFAULT NULL,
  `read_unread` tinyint(1) NOT NULL DEFAULT '0',
  `repair_id` int(11) DEFAULT NULL,
  `app_item` int(11) DEFAULT NULL,
  `has_detailed_estimate` int(11) NOT NULL DEFAULT '1',
  `cause_of_not_attaching_detailed_estimate` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `sent_to_range_by` int(11) DEFAULT NULL,
  `sent_to_range_at` date DEFAULT NULL,
  `range_approval_by` int(11) DEFAULT NULL,
  `range_approval_at` date DEFAULT NULL,
  `submission_accepted_by` int(11) DEFAULT NULL,
  `submission_accepted_at` date DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` date DEFAULT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  `meeting_discussion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_test` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `col_1` text,
  `col_2` varchar(256) DEFAULT '0',
  `col_3` varchar(256) DEFAULT '',
  `col_4` int(11) NOT NULL,
  `col_5` int(11) NOT NULL,
  `col_6` int(11) NOT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=259295 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_trainee_officer` (
  `trainee_officer_id` int(11) NOT NULL AUTO_INCREMENT,
  `trainee_bpno` varchar(100) NOT NULL,
  `trainee_type` int(11) DEFAULT NULL,
  `trainee_batch_no` varchar(50) NOT NULL,
  `trainee_bcs_batch` varchar(50) NOT NULL,
  `trainee_course_type` int(11) DEFAULT NULL,
  `trainee_name` varchar(200) NOT NULL,
  `trainee_course_date` date DEFAULT NULL,
  `trainee_birth_date` date DEFAULT NULL,
  `trainee_course_duration` varchar(20) NOT NULL,
  `trainee_work_estate_officer` int(11) DEFAULT NULL,
  `trainee_obtain_training` varchar(11) NOT NULL,
  `trainee_got_training` int(11) DEFAULT NULL,
  `trainee_contact_no` varchar(20) NOT NULL,
  `trainee_district_name` int(11) DEFAULT NULL,
  `trainee_rank` varchar(100) NOT NULL,
  `trainee_designation` varchar(100) NOT NULL,
  `trainee_comments` text NOT NULL,
  `trainee_email` varchar(100) NOT NULL,
  `trainee_work_status` int(11) DEFAULT NULL,
  `building_unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`trainee_officer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1787 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_unit_structure` (
  `unit_structure_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_id` int(11) NOT NULL,
  `unit_structure_circle` varchar(200) NOT NULL,
  `unit_structure_thana` varchar(200) NOT NULL,
  `unit_structure_investigation` varchar(200) NOT NULL,
  `unit_structure_fari` varchar(255) NOT NULL,
  `unit_structure_camp_title` varchar(200) NOT NULL,
  PRIMARY KEY (`unit_structure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_unit_type` (
  `unit_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_type_title` varchar(256) NOT NULL,
  PRIMARY KEY (`unit_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_default_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_super_admin` int(11) NOT NULL,
  `user_pwd` tinyint(1) NOT NULL,
  `login_id` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_full_name` varchar(355) DEFAULT NULL,
  `operator_full_name` varchar(191) DEFAULT NULL,
  `operator_mobile` varchar(191) DEFAULT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_status` int(1) NOT NULL DEFAULT '1',
  `user_mobile` varchar(20) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_photo` varchar(256) NOT NULL,
  `building_unit_id` int(11) NOT NULL,
  `access_location` text,
  `custom_unit_id` int(11) NOT NULL,
  `user_tender_person` int(11) NOT NULL,
  `sharok` varchar(255) DEFAULT NULL,
  `access_token` text,
  `user_sign_info` text,
  `user_sign_image` text,
  `user_logged_in` int(1) NOT NULL,
  `user_permissions` text,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `otp` varchar(50) DEFAULT NULL,
  `otp_date_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=724 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_user_log` (
  `user_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_session_in` int(11) DEFAULT NULL,
  `user_session_out` int(11) DEFAULT NULL,
  `user_log_date` date DEFAULT NULL,
  PRIMARY KEY (`user_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_user_permission` (
  `user_permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(256) DEFAULT NULL,
  `sub_menu` varchar(256) DEFAULT NULL,
  `user_permission_value` int(11) NOT NULL,
  PRIMARY KEY (`user_permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=487 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_user_preference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `columns` text COLLATE utf8_unicode_ci,
  `sort_order` text COLLATE utf8_unicode_ci,
  `template_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=715 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tbl_user_role` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_user_tables_combination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `table_id` varchar(255) NOT NULL,
  `combination` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_user_type` (
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_permission` varchar(20) DEFAULT NULL,
  `user_date` timestamp NULL DEFAULT NULL,
  `user_logid` int(11) DEFAULT NULL,
  `user_type_status` int(2) DEFAULT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_user_type_default` (
  `user_type_default_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_default_title` varchar(256) NOT NULL,
  `user_type_default_status` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_pages_allowed` text NOT NULL,
  PRIMARY KEY (`user_type_default_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_venue_booking_time_slots` (
  `booking_id` int(11) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `slot_id` int(11) NOT NULL,
  `status` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_venue_bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venue_id` int(11) NOT NULL,
  `chief_guest_name` varchar(191) DEFAULT NULL,
  `special_guest_name` varchar(191) DEFAULT NULL,
  `president_name` varchar(191) DEFAULT NULL,
  `host_name` varchar(191) NOT NULL,
  `host_contact_no` varchar(191) NOT NULL,
  `host_email_address` varchar(191) DEFAULT NULL,
  `total_participant` int(11) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `booking_slot` varchar(20) DEFAULT NULL,
  `slot_start_time` varchar(10) DEFAULT NULL,
  `slot_end_time` varchar(10) DEFAULT NULL,
  `booking_slot_detail` mediumtext NOT NULL,
  `meeting_subject` mediumtext NOT NULL,
  `function_type` varchar(191) DEFAULT NULL,
  `booking_status` varchar(191) NOT NULL,
  `status_changer_id` int(11) DEFAULT NULL,
  `status_changed_at` datetime DEFAULT NULL,
  `description` mediumtext,
  `is_conditional` int(11) DEFAULT '0',
  `letter_file` mediumtext,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_venues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `address` text,
  `image` text,
  `contact_no` varchar(191) DEFAULT NULL,
  `max_person_capacity` int(11) DEFAULT NULL,
  `venue_type` varchar(191) NOT NULL,
  `description` text,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_wall_multi_construction` (
  `wall_multi_construction_id` int(11) NOT NULL AUTO_INCREMENT,
  `boundary_wall_id` int(11) DEFAULT NULL,
  `phase_of_construction` int(11) DEFAULT NULL,
  `phase_details` mediumtext NOT NULL,
  `construction_start_date` int(4) NOT NULL,
  `construction_end_date` int(4) NOT NULL,
  `construction_cost` decimal(20,2) NOT NULL,
  `wall_current_height` decimal(20,2) NOT NULL,
  `wall_required_length` decimal(20,2) NOT NULL,
  `wall_existing_length` decimal(20,2) NOT NULL,
  `barbed_wire` int(11) NOT NULL,
  `wall_color` int(11) NOT NULL,
  `wall_plaster_type` int(11) NOT NULL,
  `contractor_information` mediumtext NOT NULL,
  `boundary_wall_remarks` mediumtext NOT NULL,
  PRIMARY KEY (`wall_multi_construction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_wall_related_building` (
  `wall_related_building_id` int(11) NOT NULL AUTO_INCREMENT,
  `boundary_wall_id` int(11) NOT NULL,
  `building_info_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`wall_related_building_id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_water_bill_allotment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `fiscal_year` int(11) NOT NULL,
  `transaction_type` text NOT NULL COMMENT 'demand/allotment/surrender',
  `transaction_amount` double DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_code` varchar(191) DEFAULT NULL,
  `transaction_reference` text,
  `description` text,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbl_water_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `water_unit` varchar(50) NOT NULL,
  `water_sub_unit` int(11) DEFAULT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `meter_id` int(11) NOT NULL,
  `bill_payment_type` varchar(50) DEFAULT NULL,
  `bill_month` varchar(20) NOT NULL,
  `bill_year` int(11) NOT NULL,
  `bill_year_month` int(11) NOT NULL,
  `fiscal_year` int(11) DEFAULT NULL,
  `previous_reading` double NOT NULL,
  `current_reading` double NOT NULL,
  `used_water_unit` double NOT NULL,
  `bill_per_unit` double NOT NULL,
  `total_bill` double NOT NULL,
  `approved_amount` double DEFAULT NULL,
  `due_amount` double DEFAULT NULL,
  `bill_no` varchar(255) DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `bill_receive_memo_no` varchar(255) DEFAULT NULL,
  `bill_receive_memo_date` date DEFAULT NULL,
  `approved_bill_send_memo_no` varchar(255) DEFAULT NULL,
  `approved_bill_send_memo_date` date DEFAULT NULL,
  `approved_bill_payment_memo_no` varchar(255) DEFAULT NULL,
  `approved_bill_payment_memo_date` date DEFAULT NULL,
  `bill_payment_cheque_or_memo_no` varchar(255) DEFAULT NULL,
  `bill_payment_cheque_or_memo_date` date DEFAULT NULL,
  `payment_status` varchar(50) NOT NULL DEFAULT 'unpaid',
  `comment` text,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_water_meters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meter_no` varchar(255) NOT NULL,
  `range_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `meter_installation_date` date DEFAULT NULL,
  `meter_status` varchar(50) NOT NULL DEFAULT 'active',
  `meter_type` enum('Post','Pre') NOT NULL,
  `account_no` varchar(255) NOT NULL,
  `financial_code` varchar(191) DEFAULT NULL,
  `customer_no` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_work_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `label` int(11) NOT NULL,
  `upwork` varchar(50) NOT NULL,
  `approved_by` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_for` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_item_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_details_id` bigint(20) DEFAULT NULL,
  `tec_details_id` bigint(20) DEFAULT NULL,
  `image_type` enum('pre','post') DEFAULT NULL,
  `image` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137759 DEFAULT CHARSET=utf8mb4;

