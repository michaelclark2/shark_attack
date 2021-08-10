create schema if not exists import;
drop table if exists import.attacks;
create table import.attacks(
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
    drop_href text,
    href text,
    drop_case_number text,
    drop_case_number2 text,
    drop_original_order text,
    drop_me text,
    drop_me2 text
);


