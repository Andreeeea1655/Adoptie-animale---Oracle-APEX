--recunoastere sql, cod din docx
drop table aTip cascade constraints;
create Table aTip(
  tip char (1) not null,
  denumire varchar2 (10),
  necesarAvizM char (2) check (necesarAvizM in ('da', 'nu')),

  constraint tip_pk primary key (tip)
  );
