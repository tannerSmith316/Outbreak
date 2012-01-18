drop table hotspot;
drop table virus;
drop table player;

--player
create table player
( 
  playerid number(7)    constraint  playerid_pk primary key,
  playerlatitude number(11,8),
  playerlongitude number(11,8),
  playername varchar2(30) constraint playername_nn not null
);

--virus
create table virus
(
  virusid number(7) constraint virusid_pk primary key,
  playerid number(7) constraint virus_player_fk references player(playerid) constraint virus_player_fk_nn not null,
  instant_points number(3)  constraint instant_points_nn not null,
  zone_points number(3) constraint zone_points_nn not null
);
--zone

create table hotspot
(
  hotspotid number(7) constraint hotspotid_pk primary key,
  virusid number(7) constraint hotspot_virus_fk references virus(virusid) constraint hotspot_virus_fk_nn not null,
  hotspotlatitude number(11,8) constraint latitude_nn not null,
  hotspotlongitude number(11,8) constraint longitude_nn not null,
  regtime number(7) constraint regtime_nn not null
);