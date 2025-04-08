.print "Attaching to 'active_hams.db'."
ATTACH DATABASE "active_hams.db" AS Export;
.print "Deleting old `Active` table if exists."
DROP TABLE IF EXISTS Export.Active;
.print "Creating and inserting records from 'fcc.db' into `Active`."
CREATE TABLE Export.Active
AS
    SELECT Entity.call_sign, first_name, mi, last_name, city, state, operator_class, grant_date
    FROM Entity
    INNER JOIN Amateur USING(unique_system_identifier)
    INNER JOIN Header USING(unique_system_identifier)
    WHERE   license_status = 'A'
        AND operator_class IN ('N', 'P', 'T', 'G', 'A', 'E');
.print "Detaching from 'active_hams.db'."
DETACH Export;
