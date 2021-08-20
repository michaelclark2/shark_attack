drop table if exists shark_attacks cascade;

create table shark_attacks(
    id serial primary key,
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


insert into shark_attacks(
    case_number,
    date,
    year,
    type,
    country,
    area,
    location,
    activity,
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
)

select 
    trim(case_number),
    trim(date),
    trim(year),
    trim(type),
    trim(country),
    trim(area),
    trim(location),
    trim(activity),
    trim(name),
    trim(sex),
    trim(age),
    trim(injury),
    trim(upper(fatal)),
    trim(time),
    trim(species),
    trim(source),
    trim(pdf),
    trim(href)
from import.attacks
;

-- Update Fatal column

update shark_attacks
set fatal = 'Y'
where fatal is null
and injury ilike '%fatal%'
or injury ilike '%drow%'
or injury ilike '%death%'
or injury ilike '%post%mortem%'
or injury ilike '%remains%'
or injury ilike '%bone%'
or injury ilike '%body%recovered%'
or injury ilike '%body%found%'
or injury ilike '%die%'
or injury ilike '%corpse%'
or injury ilike '%disappear%'
or species ilike '%death%'
or id in ('845', '846', '1440', '2915', '3975', '4481', '3154', '3959', '3739', '3764', '5358', '4314', '4911', '5249', '5425', '5501', '6128')
;

update shark_attacks
set fatal = 'N'
where fatal is null
and id in ('188', '287', '794', '5502', '2370', '2369', '2397', '3210', '3330', '3235', '3442', '4129', '4647', '4783', '5515', '5759')
or injury ilike '%no injury%'
or injury ilike '%minor%'
or injury ilike '%lacer%'
or injury ilike '%abras%'
or injury ilike '%cut%'
or injury ilike '%injur%'
or injury ilike '%surviv%'
or injury ilike '%wound%'
or species ilike '%shark%not%confirmed%'
;

update shark_attacks
set fatal = null
where fatal = 'UNKNOWN'
or injury = 'No details'
or injury ilike '%hoax%'
;

alter table shark_attacks
alter column fatal type boolean
using fatal::boolean;
