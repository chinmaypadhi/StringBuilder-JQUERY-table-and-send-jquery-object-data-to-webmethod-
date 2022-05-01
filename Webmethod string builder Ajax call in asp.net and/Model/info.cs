using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Webmethod_string_builder_Ajax_call_in_asp.net_and.Model
{
    public class info
    {
        public int id { get; set; }
        public string name { get; set; }
        public string city { get; set; }

    }
    public class ListData
    {
        public IList<info> infoData { get; set; }
        public string status { get; set; }
    }
    public class createGrid
    {
        public int id { get; set; }
    }
}