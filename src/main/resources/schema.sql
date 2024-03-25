drop table if exists users, items, bookings, comments, item_requests;

CREATE TABLE if not exists users
(
    user_id bigint generated by default as identity primary key,
    name    varchar(255) not null,
    email   varchar(255) not null unique
);

CREATE TABLE if not exists item_requests
(
    id           bigint generated by default as identity primary key,
    description  varchar(255) not null,
    requester_id bigint references users (user_id) on DELETE cascade,
    created      timestamp without time zone default current_timestamp
);

CREATE TABLE if not exists items
(
    item_id      bigint generated by default as identity primary key,
    name         varchar(255) not null,
    description  varchar(255),
    is_available boolean,
    owner_id     bigint references users (user_id),
    request_id BIGINT references item_requests(id)
);

CREATE TABLE if not exists comments
(
    comment_id bigint generated by default as identity primary key,
    text       varchar(1000) not null,
    item_id    bigint references items (item_id),
    author_id  bigint references users (user_id),
    created    timestamp without time zone default current_timestamp
);

CREATE TABLE if not exists bookings
(
    booking_id bigint generated by default as identity primary key,
    start_date timestamp without time zone not null,
    end_date   timestamp without time zone not null,
    item_id    bigint references items (item_id),
    booker_id  bigint references users (user_id),
    status     varchar(20) not null
);
