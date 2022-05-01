using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Webmethod_string_builder_Ajax_call_in_asp.net_and.Model;

namespace Webmethod_string_builder_Ajax_call_in_asp.net_and.Controller
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string SaveEmpList(ListData formDataOrg)
        {
            List<ListData> tempList = new List<ListData>();
            List<info> tempListInfo = new List<info>();
            StringBuilder sb = new StringBuilder();

            try
            {

                tempListInfo = (formDataOrg.infoData).ToList();

                foreach (var t in tempListInfo)
                {
                    sb.Append("<tr>");
                    sb.Append("<td>" + t.name + "</td>");
                    sb.Append("<td>" + t.city + "</td>");
                    sb.Append("</tr>");
                }


                return sb.ToString();
            }
            catch (Exception ex)
            {
                // Log Error  
                return sb.ToString();
            }

        }
    }
}