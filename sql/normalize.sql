drop table if exists shark_attacks cascade;

create table shark_attacks(
    case_number text,
    date text,
    year text,
    type text,
    country text,
    area text,
    location text,
    activity text,
    name text,
    sex text,
    age text,
    injury text,
    fatal text,
    time text,
    species text,
    source text,
    pdf text,
    href text
);


insert into shark_attacks
select 
    case_number,
    date,
    year,
    type,
    country,
    area,
    location,
    name,
    sex,
    age,
    injury,
    fatal,
    time,
    species,
    source,
    pdf,
    href
from import.attacks
;