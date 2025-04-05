.print "Dropping existing tables (sanity)."
DROP TABLE IF EXISTS Amateur;
DROP TABLE IF EXISTS Entity;
DROP TABLE IF EXISTS Comments;
DROP TABLE IF EXISTS Header;
DROP TABLE IF EXISTS History;
DROP TABLE IF EXISTS Attachment;
DROP TABLE IF EXISTS SpecialCond;
DROP TABLE IF EXISTS SpecialCondFreeForm;

.print "Creating tables."
.print "\t- Amateur"
CREATE TABLE Amateur
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_num              char(14)             null,
      ebf_number                varchar(30)          null,
      callsign                  char(10)             null,
      operator_class            char(1)              null,
      group_code                char(1)              null,
      region_code               tinyint              null,
      trustee_callsign          char(10)             null,
      trustee_indicator         char(1)              null,
      physician_certification   char(1)              null,
      ve_signature              char(1)              null,
      systematic_callsign_change char(1)             null,
      vanity_callsign_change    char(1)              null,
      vanity_relationship       char(12)             null,
      previous_callsign         char(10)             null,
      previous_operator_class   char(1)              null,
      trustee_name              varchar(50)          null
);

.print "\t- Entity"
CREATE TABLE Entity
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      entity_type               char(2)              null,
      licensee_id               char(9)              null,
      entity_name               varchar(200)         null,
      first_name                varchar(20)          null,
      mi                        char(1)              null,
      last_name                 varchar(20)          null,
      suffix                    char(3)              null,
      phone                     char(10)             null,
      fax                       char(10)             null,
      email                     varchar(50)          null,
      street_address            varchar(60)          null,
      city                      varchar(20)          null,
      state                     char(2)              null,
      zip_code                  char(9)              null,
      po_box                    varchar(20)          null,
      attention_line            varchar(35)          null,
      sgin                      char(3)              null,
      frn                       char(10)             null,
      applicant_type_code       char(1)              null,
      applicant_type_other      char(40)             null,
      status_code               char(1) 		     null,
      status_date		        datetime	         null,
      lic_category_code	        char(1)         	 null,
      linked_license_id	        numeric(9,0)	     null,
      linked_callsign		    char(10)		     null
);

.print "\t- Comments"
CREATE TABLE Comments
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_num              char(14)             null,
      callsign                  char(10)             null,
      comment_date              char(10)             null,
      description               varchar(255)         null,
      status_code		        char(1)		         null,
      status_date		        datetime             null
);

.print "\t- Header"
CREATE TABLE Header
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      license_status            char(1)              null,
      radio_service_code        char(2)              null,
      grant_date                char(10)             null,
      expired_date              char(10)             null,
      cancellation_date         char(10)             null,
      eligibility_rule_num      char(10)             null,
      applicant_type_code_reserved       char(1)              null,
      alien                     char(1)              null,
      alien_government          char(1)              null,
      alien_corporation         char(1)              null,
      alien_officer             char(1)              null,
      alien_control             char(1)              null,
      revoked                   char(1)              null,
      convicted                 char(1)              null,
      adjudged                  char(1)              null,
      involved_reserved      	char(1)              null,
      common_carrier            char(1)              null,
      non_common_carrier        char(1)              null,
      private_comm              char(1)              null,
      fixed                     char(1)              null,
      mobile                    char(1)              null,
      radiolocation             char(1)              null,
      satellite                 char(1)              null,
      developmental_or_sta      char(1)              null,
      interconnected_service    char(1)              null,
      certifier_first_name      varchar(20)          null,
      certifier_mi              char(1)              null,
      certifier_last_name       varchar(20)          null,
      certifier_suffix          char(3)              null,
      certifier_title           char(40)             null,
      gender                    char(1)              null,
      african_american          char(1)              null,
      native_american           char(1)              null,
      hawaiian                  char(1)              null,
      asian                     char(1)              null,
      white                     char(1)              null,
      ethnicity                 char(1)              null,
      effective_date            char(10)             null,
      last_action_date          char(10)             null,
      auction_id                int                  null,
      reg_stat_broad_serv       char(1)              null,
      band_manager              char(1)              null,
      type_serv_broad_serv      char(1)              null,
      alien_ruling              char(1)              null,
      licensee_name_change	char(1)		     null,
      whitespace_ind            char(1)              null,
      additional_cert_choice    char(1)              null,
      additional_cert_answer    char(1)              null,
      discontinuation_ind       char(1)              null,
      regulatory_compliance_ind char(1)              null,
      eligibility_cert_900        char(1)              null,
      transition_plan_cert_900    char(1)              null,
      return_spectrum_cert_900  char(1)              null,
      payment_cert_900        char(1)              null
);

.print "\t- History"
CREATE TABLE History
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      callsign                  char(10)             null,
      log_date                  char(10)             null,
      code                      char(6)              null
);

.print "\t- Attachment"
CREATE TABLE Attachment
 (
      record_type               char(2)              null ,
      unique_system_identifier  numeric(9,0)         null ,
      callsign                  char(10)             null ,
      attachment_code           char(1)              Null ,
      attachment_desc           varchar(60)          Null ,
      attachment_date           char(10)             Null ,
      attachment_filename       varchar(60)          Null ,
      action_performed          char(1)              Null
);

.print "\t- SpecialCond"
CREATE TABLE SpecialCond
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)              null,
      ebf_number                varchar(30)           null, 
      callsign                  char(10)             null ,
      special_condition_type    char(1)              null,
      special_condition_code    int                  null,
	status_code		char(1)			null,
	status_date		datetime		null
);

.print "\t- SpecialCondFreeForm"
CREATE TABLE SpecialCondFreeForm
(
      record_type               char(2)              null ,
      unique_system_identifier  numeric(9,0)         null ,
      uls_file_number           char(14)              null,
      ebf_number                varchar(30)           null, 
      callsign                  char(10)             null ,
      lic_freeform_cond_type    char(1)              null ,
      unique_lic_freeform_id    numeric(9,0)         null ,
      sequence_number           int              null ,
      lic_freeform_condition    varchar(255)         null,
	status_code		char(1)			null,
	status_date		datetime		null
);

.print "Importing dat files into tables."

.print "\t- AM.dat => Amateur"
.import AM.dat Amateur
.print "\t- CO.dat => Comments"
.import CO.dat Comments
.print "\t- EN.dat => Entity"
.import EN.dat Entity
.print "\t- HD.dat => Header"
.import HD.dat Header
.print "\t- HS.dat => History"
.import HS.dat History
.print "\t- LA.dat => Attachment"
.import LA.dat Attachment
.print "\t- SC.dat => SpecialCond"
.import SC.dat SpecialCond
.print "\t- SF.dat => SpecialCondFreeForm"
.import SF.dat SpecialCondFreeForm

-- Reformats all date columns to a sortable format

.print "Altering all rows with dates to enable sorting."
.print "\t- Attachment.attachment_date"
UPDATE Attachment
SET attachment_date =
	SUBSTR(attachment_date, 7, 4) || "-" || SUBSTR(attachment_date, 1, 2) || "-" || SUBSTR(attachment_date, 4, 2)
WHERE attachment_date <> '';
	
.print "\t- History.log_date"
UPDATE History
SET log_date =
	SUBSTR(log_date, 7, 4) || "-" || SUBSTR(log_date, 1, 2) || "-" || SUBSTR(log_date, 4, 2)
WHERE log_date <> '';

.print "\t- Comments.comment_date"
UPDATE Comments
SET comment_date = 
	SUBSTR(comment_date, 7, 4) || "-" || SUBSTR(comment_date, 1, 2) || "-" || SUBSTR(comment_date, 4, 2)
WHERE comment_date <> '';

.print "\t- Header.grant_date"
UPDATE Header
SET grant_date =
    SUBSTR(grant_date, 7, 4) || "-" || SUBSTR(grant_date, 1, 2) || "-" || SUBSTR(grant_date, 4, 2)
WHERE grant_date <> '';

.print "\t- Header.expired_date"
UPDATE Header
SET expired_date =
    SUBSTR(expired_date, 7, 4) || "-" || SUBSTR(expired_date, 1, 2) || "-" || SUBSTR(expired_date, 4, 2)
WHERE expired_date <> '';

.print "\t- Header.cancellation_date"
UPDATE Header
SET cancellation_date =
    SUBSTR(cancellation_date, 7, 4) || "-" || SUBSTR(cancellation_date, 1, 2) || "-" || SUBSTR(cancellation_date, 4, 2)
WHERE cancellation_date <> '';

.print "\t- Header.effective_date"
UPDATE Header
SET effective_date =
    SUBSTR(effective_date, 7, 4) || "-" || SUBSTR(effective_date, 1, 2) || "-" || SUBSTR(effective_date, 4, 2)
WHERE effective_date <> '';

.print "\t- Header.last_action_date"
UPDATE Header
SET last_action_date =
    SUBSTR(last_action_date, 7, 4) || "-" || SUBSTR(last_action_date, 1, 2) || "-" || SUBSTR(last_action_date, 4, 2)
WHERE last_action_date <> '';
