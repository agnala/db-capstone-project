import mysql.connector as connector

connection = connector.connect(user = "proyect_cour", password = "sarkoist", db = "littlelemondb") 


cursor = connection.cursor()
show_tables_query = "SHOW tables" 
cursor.execute(show_tables_query)

results = cursor.fetchall()

for table in results:
    print(table)


cursor.execute("""select FirstName, LastName, Email, TotalCost from customer left join booking
on customer.IDCustomer=booking.Customer_IDCustomer

left join booking_has_table
on booking.Customer_IDCustomer=booking_has_table.Booking_Customer_IDCustomer

left join orders
on booking_has_table.Booking_Customer_IDCustomer=orders.Booking_has_Table_Booking_Customer_IDCustomer

where TotalCost>60""")

resultas = cursor.fetchall()
for row in resultas:
    print(row)