<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Webmethod_string_builder_Ajax_call_in_asp.net_and.Controller.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>--%>
    <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
</head>
<body>
        <div>
            <table>
                <thead>
                    <th>NAME</th>
                    <th>CITY</th>
                </thead>
                <tbody id="tblId">                  
                </tbody>
            </table>
        </div>
    <div>
        <br />
        <input type="button" id="btnSubmit" value="Submit" class="btn btn-success" />
    </div>


    <table id="mainTbl">
        <thead>
            <tr>
            <th>name</th>
            <th>city</th>
            </tr>
        </thead>
        <tbody id="tbdy">

        </tbody>
    </table>


</body>
</html>

<script type="text/javascript">
    $(document).ready(function () {
        //alert('chinmay padhi');

        var html = "";
        for (var x = 0; x < 6; x++) {
                html+='<tr>';
                html +='<td>';
                html +='<input type = "text" id = "txtname'+x+'" />';
                html +='</td>';

                html += '<td>';
                html += '<input type = "text" id = "txtCity'+x+'" />';
                html += '</td>';
                html += ' </tr>';
        }
        $('#tblId').append(html);
    })


    $('#btnSubmit').click(function () {
        debugger;
// alert('chinmay padhi');

        var objformDataOrg = {};
        var arrayData = [];

        for (var x = 0; x < 6; x++) {
            var formData = {};
            formData.name = $("#txtname" + x).val();
            formData.city = $("#txtCity" + x).val();
            arrayData.push(formData);
        }

        objformDataOrg.infoData = arrayData;
        $.ajax({
            url: 'WebForm2.aspx/SaveEmpList',
            data: JSON.stringify({ formDataOrg: objformDataOrg }),
           // data: JSON.stringify(objformDataOrg),

           // data: {},
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            //beforeSend: function () {
            //    Show(); // Show loader icon  
            //},
            success: function (response) {
                debugger

                var data = response.d;
                $('#mainTbl').show();

                $('#tbdy').html(data);

                //// Looping over emloyee list and display it  
                //$.each(response.d, function (index, emp) {
                //    $('#output').append('<p>Id: ' + emp.ID + '</p>' +
                //        '<p>Id: ' + emp.Name + '</p>');
                //});
            },
            //complete: function () {
            //    Hide(); // Hide loader icon  
            //},
            //failure: function (jqXHR, textStatus, errorThrown) {
            //    alert("Status: " + jqXHR.status + "; Error: " + jqXHR.responseText); // Display error message  
            //}
        });

    });
    $(document).ready(function () {

        $('#mainTbl').hide();
    })
</script>
