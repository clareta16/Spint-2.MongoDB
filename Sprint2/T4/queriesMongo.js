{\rtf1\ansi\ansicpg1252\cocoartf2636
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -1\
db.restaurants.find()\
\
-2\
db.restaurants.find(\{\}, \{restaurant_id: 1, name: 1, borough: 1, cuisine: 1\})\
\
-3\
db.restaurants.find(\{\}, \{restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0\})\
\
-4\
db.restaurants.find(\{\}, \{restaurant_id: 1, name: 1, borough: 1, 'address.zipcode': 1, _id: 0\})\
\
-5\
db.restaurants.find(\{borough: 'Bronx'\})\
\
-6\
db.restaurants.find(\{borough: 'Bronx'\}).limit(5)\
\
-7\
db.restaurants.find(\{borough: 'Bronx'\}).limit(5).skip(5)\
\
-8\
db.restaurants.find(\{'grades.score': \{$gt: 90\}\})\
\
-9\
db.restaurants.find(\{'grades': \{$elemMatch: \{'score': \{$gt: 80, $lt: 100\}\}\}\})\
\
-10\
db.restaurants.find(\{'address.coord': \{$lt: -95.754168\}\})\
\
-11\
db.restaurants.find(\{cuisine: \{$not: /American/\}, 'grades.score': \{$gt: 70\}, 'address.coord': \{$lt: -65.754168\}\})\
\
-12\
db.restaurants.find(\{cuisine: \{$ne: 'American'\}, 'address.coord': \{$lt: -65.754168\}, 'grades.score': \{$gt: 80\}\})\
\
-13\
db.restaurants.find(\{cuisine: \{$ne: 'American'\}, borough: \{$ne: 'Brooklyn'\}, 'grades.grade': 'A'\}).sort(\{cuisine: -1\})\
\
-14\
db.restaurants.find(\{name: /^Wil/\}, \{restaurant_id: 1, name: 1, borough: 1, cuisine: 1\})\
\
-15\
db.restaurants.find(\{name: /ces$/\}, \{restaurant_id: 1, name: 1, borough: 1, cuisine: 1\})\
\
-16\
db.restaurants.find(\{name: /Reg/\}, \{restaurant_id: 1, name: 1, borough: 1, cuisine: 1\})\
\
-17\
db.restaurants.find(\{$and: [\{$or: [\{cuisine: 'American'\}, \{cuisine: 'Chinese'\}]\}, \{borough: 'Bronx'\}]\})\
\
-18\
db.restaurants.find(\{borough: \{$in: ['Staten Island', 'Queens', 'Bronx', 'Brooklyn']\}\}, \{_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1\})\
\
-19\
db.restaurants.find(\{borough: \{$nin: ['Staten Island', 'Queens', 'Bronx', 'Brooklyn']\}\}, \{_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1\})\
\
-20\
db.restaurants.find(\{'grades.score': \{$not: \{$gt: 10\}\}\}, \{restaurant_id: 1, name: 1, borough: 1, cuisine: 1\})\
\
-21\
db.restaurants.find(\{$or: [\{$and: [\{cuisine: 'Seafood'\}, \{cuisine: \{$nin: ['American', 'Chinese']\}\}]\}, \{name: /^Wil/\}]\}, \{restaurant_id: 1, name: 1, borough: 1, cuisine: 1\})\
\
-22\
db.restaurants.find(\{grades: \{$elemMatch: \{date: ISODate("2014-08-11T00:00:00Z"), score: 11, grade: 'A'\}\}\}, \{restaurant_id: 1, name: 1, grades: 1\})\
\
-23\
db.restaurants.find(\{'grades.grade': 'A', 'grades.score': 9, 'grades.date': ISODate("2014-08-11T00:00:00Z")\}, \{restaurant_id: 1, name: 1, grades: \{$slice: [1, 1]\}\})\
\
-24\
db.restaurants.find(\{'address.coord': \{$gt: 42, $lte: 52\}\}, \{restaurant_id: 1, name: 1, 'address.street': 1, 'address.coord': \{$slice: [1, 1]\}\})\
\
-25\
db.restaurants.find(\{\}).sort(\{name: 1\})\
\
-26\
db.restaurants.find(\{\}).sort(\{name: -1\})\
\
-27\
db.restaurants.find(\{\}).sort(\{cuisine: 1, borough: -1\})\
\
\
}