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
    <title>Pizza List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 90%;
            max-width: 900px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            margin: 20px;
            position: relative;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 20px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
            display: block;
            margin: 10px auto;
            width: 200px;
        }
        button:hover {
            background-color: #45a049;
        }
        .button-container {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Pizza List</h1>
        <table>
            <thead>
                <tr>
                    <th>Pizza Code</th>
                    <th>Pizza Name</th>
                    <th>Pizza Price</th>
                    <th>Pizza Discount</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    DataBase ob = new DataBase();
                    ResultSet result = ob.read("select * from pizzalist");

                    while (result.next()) {
                %>
                <tr>
                    <td><%=result.getString(1)%></td>
                    <td><%=result.getString(2)%></td>
                    <td><%=result.getString(3)%></td>
                    <td><%=result.getString(4)%></td>
                    <td><a href="DeletePizza?pizzacode=<%=result.getString(1)%>">Remove</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <div class="button-container">
            <button onclick="location.href = 'addpizzatolist.html'">Add Pizza</button>
            <button onclick="location.href = 'adminpage.html'">Go Back</button>
        </div>
    </div>
</body>
</html>
