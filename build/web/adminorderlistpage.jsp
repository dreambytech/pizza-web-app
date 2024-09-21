<%-- 
    Document   : adminpizzalistpage
    Created on : Jul 25, 2024, 11:29:07 AM
    Author     : souri
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.bean.DataBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                min-height: 100vh;
            }
            .container {
                width: 90%;
                max-width: 1200px;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            h1 {
                color: #333;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            th, td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: center;
            }
            th {
                background-color: #f4f4f4;
                color: #333;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            tr:hover {
                background-color: #f1f1f1;
            }
            a {
                color: #007bff;
                text-decoration: none;
            }
            a:hover {
                text-decoration: underline;
            }
            button {
                background-color: #28a745;
                color: #fff;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 4px;
                font-size: 16px;
                margin-top: 20px;
            }
            button:hover {
                background-color: #218838;
            }
        </style>
        <title>Order List</title>

    </head>
    <body>
        <div class="container">
            <h1>Order List</h1>
            <table>
                <thead>
                    <tr>
                        <th>Order Email</th>
                        <th>Order List</th>
                        <th>Order Location</th>
                        <th>Total Price</th>
                        <th>Bill Paid?</th>
                        <th>Order Time</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        DataBase ob = new DataBase();

                        ResultSet result = ob.read("select * from pizzaorder");

                        while (result.next()) {
                    %>
                    <tr>
                        <td><%=result.getString(1)%></td>
                        <td><%=result.getString(2)%></td>
                        <td><%=result.getString(3)%></td>
                        <td><%=result.getString(4)%></td>
                        <td><a href=OrderValidation?email=<%=result.getString(1)%>&time=<%=result.getString(6)%>><%=result.getString(5)%></a></td>
                        <td><%=result.getString(6)%></td>
                    </tr>
                    <%
                        }
                    %>
                    <!-- Add more pizza rows as needed -->
                </tbody>
            </table>

        </div>
        <button onclick="location.href = 'adminpage.html'">Go Back</button>
    </body>
</html>

