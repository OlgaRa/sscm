from __future__ import print_function
from datetime import date, datetime, timedelta

import mysql.connector

cnx = mysql.connector.connect(user='sscm', database='sscm')

cursor = cnx.cursor()

tomorrow = datetime.now().date() + timedelta(days=1)

insert_query = ("INSERT INTO item_types "
               "(name, description) "
               "VALUES (%s, %s)")

insert_data = ('Lock','Lock mechanism for rotary table')


# Insert new employee
cursor.execute(insert_query, insert_data)
id = cursor.lastrowid

print ("type created with id: {}".format(id))

# Make sure data is committed to the database
cnx.commit()

cursor.close()
cnx.close()