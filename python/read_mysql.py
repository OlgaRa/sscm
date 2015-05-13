import datetime
import mysql.connector
import model

g_cnx = None

def connect_to_db():
    global g_cnx
    g_cnx = mysql.connector.connect(user='sscm', database='sscm')

def disconnect_from_db():
    if g_cnx:
        g_cnx.close()

def read_item_types():


    cursor = g_cnx.cursor()

    query = ("SELECT id, name, description FROM item_types ")
    #         "WHERE hire_date BETWEEN %s AND %s")

    #hire_start = datetime.date(1999, 1, 1)
    #hire_end = datetime.date(1999, 12, 31)

    #cursor.execute(query, (hire_start, hire_end))

    cursor.execute(query)
    result = []
    for (id, name, description) in cursor:
        t = model.ItemType()
        t.id = id
        t.name = name
        t.description = description
        result.append(t)

    cursor.close()

    return result

if __name__ == "__main__":
    connect_to_db()
    types = read_item_types()
    for t in types:
        print("id: {}, name: '{}' description: '{}'".format(t.id, t.name, t.description))

    disconnect_from_db()