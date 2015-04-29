/*
Some demonstrations of the queries we can currently perform on our db
*/
SET search_path = unidb, public;
DO $$
DECLARE school_id bigint;
DECLARE income_bracket varchar(10);
BEGIN
	school_id := 11830; --id for university of central missouri
	income_bracket := 'npis412';
	RETURN SELECT instnm, income_bracket
	FROM   unistats INNER JOIN tuitstats USING(unitid)
	WHERE  unitid = school_id;
END $$;
